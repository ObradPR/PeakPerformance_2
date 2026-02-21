import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ToastModule } from 'primeng/toast';
import { Footer } from "./components/footer/footer";
import { Header } from "./components/header/header";
import { Modal } from './components/modal/modal';
import { PageLoader } from './components/page-loader/page-loader';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, ToastModule, PageLoader, Header, Footer, Modal],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  constructor(private authService: AuthService) { 
    this.authService.loadCurrentUser(true);
  }
}
