using Microsoft.AspNetCore.ResponseCompression;
using PeakPerformance.Api.Middlewares;
using PeakPerformance.Api.Objects;
using PeakPerformance.DependencyInjection;
using PeakPerformance.Domain.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AllApplicationServices();

builder.Services.AddControllers();
builder.Services.AddHttpContextAccessor();

builder.Services.AddScoped<IIdentityUser, IdentityUser>();

builder.Services.AddResponseCompression(opt =>
{
    opt.EnableForHttps = true;
    opt.Providers.Add<GzipCompressionProvider>();
});

builder.Services.Configure<GzipCompressionProviderOptions>(opt =>
{
    opt.Level = System.IO.Compression.CompressionLevel.Fastest;
});

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseCors(builder => builder
    .AllowAnyHeader()
    .AllowAnyMethod()
    .AllowCredentials()
    .WithOrigins("https://localhost:4200")
    );

app.UseHttpsRedirection();
app.UseResponseCompression();

app.UseAuthentication();
app.UseAuthorization();

app.UseMiddleware<ExceptionMiddleware>();

app.MapControllers();

app.Run();