import { HttpClient, HttpEventType, HttpRequest, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { SettingsService } from './settings.service';
import { filter, map, Observable } from 'rxjs';
import { Functions } from '../functions';

@Injectable({
  providedIn: 'root'
})
export class FileUploadService {
  constructor(private http: HttpClient, private settingsService: SettingsService) { }

  upload<T>(path: string, file: File, params?: any): Observable<T> {
    const formData = new FormData();
    formData.append('file', file);

    if (params) {
      Functions.formatRequestDates(params);
      Object.keys(params).forEach(key => formData.append(key, params[key]));
    }

    const req = new HttpRequest('POST', this.settingsService.createApiUrl(path), formData, {
      reportProgress: true,
      responseType: 'json'
    });

    return this.http.request<T>(req)
      .pipe(
        filter(event => event.type === HttpEventType.Response),
        map(event => (event as HttpResponse<T>).body as T)
      );
  }

  uploadMultipart<T, TResponse>(path: string, files: File[], model?: T): Observable<TResponse> {
    const formData = new FormData();

    files.forEach((file, index) => formData.append(`files[${index}]`, file));

    if (model) {
      Functions.appendFormData(formData, model);
    }

    const req = new HttpRequest('POST', this.settingsService.createApiUrl(path), formData, {
      reportProgress: true,
      responseType: 'json'
    });

    return this.http.request<TResponse>(req)
      .pipe(
        filter(event => event.type === HttpEventType.Response),
        map(event => (event as HttpResponse<TResponse>).body as TResponse)
      );
  }
}
