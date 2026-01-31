import { Component, Signal } from '@angular/core';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { ModalService } from '../../services/modal.service';
import { IUserDto } from '../../_generated/interfaces';

@Component({
  selector: 'app-header',
  imports: [RouterLink, RouterLinkActive],
  templateUrl: './header.html',
  styleUrl: './header.css'
})
export class Header {
  user: Signal<IUserDto | null>;

  constructor(
    private router: Router,

    public authService: AuthService,
    public modalService: ModalService
  ) {
    this.user = this.authService.currentUserSource;
  }

  signOut() {
    this.authService.signOut();
  }

  navigateToHome() {
    if (!this.user()) return;

    this.router.navigateByUrl('/', { skipLocationChange: true })
      .then(() => {
        this.router.navigateByUrl(`/user/${this.user()!.id}`);
      });
  }
}
