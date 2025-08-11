import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { PageLoader } from './components/page-loader/page-loader'
import { AuthService } from './services/auth.service';
import { ToastModule } from 'primeng/toast';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, ToastModule, PageLoader],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App implements OnInit {
  constructor(private authService: AuthService) { }

  ngOnInit(): void {
    this.authService.loadCurrentUser();
  }
}
