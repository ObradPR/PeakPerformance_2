import { Injectable, signal } from '@angular/core';
import { IBodyweightDto } from '../_generated/interfaces';

export type TModal = 'add' | 'edit';

@Injectable({
  providedIn: 'root'
})
export class ModalService {
  // Bodyweight
  private bodyweightModal = signal<boolean>(false);
  private bodyweightModalType = signal<TModal | null>(null);
  private selectedBodyweight = signal<IBodyweightDto | null>(null);

  readonly bodyweightModalSignal = this.bodyweightModal.asReadonly();
  readonly bodyweightModalTypeSignal = this.bodyweightModalType.asReadonly();
  readonly selectedBodyweightSignal = this.selectedBodyweight.asReadonly();

  showAddBodyweightModal() {
    this.bodyweightModalType.set('add');
    this.bodyweightModal.set(true);
  }
  showEditBodyweightModal(data: IBodyweightDto) {
    this.bodyweightModalType.set('edit');
    this.selectedBodyweight.set(data);
    this.bodyweightModal.set(true);
  }
  hideBodyweightModal() {
    this.bodyweightModal.set(false);
    this.bodyweightModalType.set(null);
    this.selectedBodyweight.set(null);
  }
}
