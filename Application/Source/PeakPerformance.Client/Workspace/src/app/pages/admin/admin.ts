import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { AdminUsers } from "./admin-users/admin-users";
import { AdminExercise } from './admin-exercise/admin-exercise';

@Component({
  selector: 'app-admin',
  imports: [CommonModule, AdminUsers, AdminExercise],
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
