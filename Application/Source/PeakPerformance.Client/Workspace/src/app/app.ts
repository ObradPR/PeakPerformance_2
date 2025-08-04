import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet /*, ToastModule, PageLoaderComponent*/],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  // constructor(private authService: AuthService) {}

  // ngOnInit(): void {
  //   this.authService.loadCurrentUser();
  // }
}
