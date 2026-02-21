import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { AdminUsers } from "./admin-users/admin-users";

@Component({
  selector: 'app-admin',
  imports: [CommonModule, AdminUsers],
  templateUrl: './admin.html',
  styleUrl: './admin.css'
})
export class Admin {
  
  selectedTab: number = 0;
  tabs = [
    {
      label: 'Users',
      iconClass: 'fa-solid fa-users',
    },
    {
      label: 'Exercises',
      iconClass: 'fa-solid fa-chart-bar',
    }
  ];

  // events

  onSelectTab = (idx: number) => this.selectedTab = idx;
}
