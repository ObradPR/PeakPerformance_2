import { Component, OnInit, output, OutputEmitterRef } from '@angular/core';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ValidationDirective } from '../../../directives/validation.directive';
import { BaseValidationComponent } from '../../../pages/_base/base.component/base-validation.component';
import { IModalMethods } from '../interfaces/modal-methods.interface';
import { ExerciseController } from '../../../_generated/services';
import { ModalService } from '../../../services/modal.service';
import { LoaderService } from '../../../services/loader.service';
import { eExerciseType, eMuscleGroup } from '../../../_generated/enums';
import { IEnumProvider, IExerciseDto } from '../../../_generated/interfaces';
import { Providers } from '../../../_generated/providers';
import { FileUploadService } from '../../../services/file-upload.service';
import { finalize, take } from 'rxjs';

@Component({
  selector: 'app-admin-exercise-modal',
  imports: [FormsModule, ReactiveFormsModule, ValidationDirective],
  templateUrl: './admin-exercise-modal.html',
  styleUrl: './admin-exercise-modal.css'
})
export class AdminExerciseModal extends BaseValidationComponent implements IModalMethods, OnInit {
  override errors: Record<string, string>;
  closeModalEvent: OutputEmitterRef<boolean> = output<boolean>();
  form: FormGroup<any>;

  selectedExercise: IExerciseDto | null = null;

  modalType: string;

  exerciseTypes: IEnumProvider[] = [];

  previewImage: string | null = null;
  originalImage: string | null = null;
  hasUnsavedChange = false;


  constructor(
    private fb: FormBuilder,

    public modalService: ModalService,
    private loaderService: LoaderService,
    public providers: Providers,
    private fileUploadService: FileUploadService,
  ) {
    super();
    this.modalType = this.modalService.adminExerciseModalTypeSignal() === 'add' ? 'Add' : 'Edit';
    this.selectedExercise = this.modalService.adminSelectedExerciseSignal();
    this.updatePicture();
  }

  ngOnInit(): void {
    this.formInit();
  }

  closeModal(): void {
    this.closeModalEvent.emit(true);
  }

  formInit(): void {
    console.log(this.selectedExercise);
    this.form = this.fb.group({
      id: [this.selectedExercise?.id ?? 0],
      picture: [null],
      removePicture: [false],
      apiExerciseId: [this.selectedExercise?.apiExerciseId],
      name: [this.selectedExercise?.name],
      equipmentName: [this.selectedExercise?.equipmentName],
      bodyPart: [this.selectedExercise?.bodyPart],
      instructions: [this.loadInstructions()],
      exerciseTypeId: [this.loadExerciseTypeId()],
      primaryMuscleGroupIds: [this.loadMuscleGroupIds(this.selectedExercise?.primaryMuscleGroups ?? [])],
      secondaryMuscleGroupIds: [this.loadMuscleGroupIds(this.selectedExercise?.secondaryMuscleGroups ?? [])],
    });
  }

  loadInstructions(): string | null {
    return this.selectedExercise?.instructions.join('\n') ?? null;
  }

  loadExerciseTypeId(): eExerciseType {
    if (this.selectedExercise?.isCardio)
      return eExerciseType.Cardio;
    else if (this.selectedExercise?.isBodyweight)
      return eExerciseType.Bodyweight;
    else
      return eExerciseType.Strength;
  }

  loadMuscleGroupIds(muscleGroups: string[]): eMuscleGroup[] {
    let groups: eMuscleGroup[] = [];

    muscleGroups.forEach(_ => {
      switch(_) {
        case 'Back':
          groups.push(eMuscleGroup.Back);
          break;
        case 'Arms':
          groups.push(eMuscleGroup.Arms);
          break;
        case 'Chest':
          groups.push(eMuscleGroup.Chest);
          break;
        case 'Shoulders':
          groups.push(eMuscleGroup.Shoulders);
          break;
        case 'Legs':
          groups.push(eMuscleGroup.Legs);
          break;
        case 'Core':
          groups.push(eMuscleGroup.Core);
          break;
        default:
          groups.push(eMuscleGroup.None);
      }
    });

    return groups;
  }
  
  submit() {
    const file = this.form.value.picture;
    const formValue = { ...this.form.value };

    // Transform instruction string into array
    if (formValue.instructions) {
      formValue.instructions = formValue.instructions
        .split('.')
        .map((_: string) => _.trim())
        .filter((_: string) => _.length > 0)
        .map((_: string) => _ + '.');
    }

    this.loaderService.showPageLoader();
    this.fileUploadService.upload('/Exercise/AdminSave', file, { 
      dataJson: JSON.stringify(formValue)
     })
      .pipe(
        take(1),
        finalize(() => this.loaderService.hidePageLoader())
      ).subscribe({
        next: () => {
          this.originalImage = this.previewImage;
          this.hasUnsavedChange = false;
          this.modalService.hideAdminExerciseModal();
        },
        error: (ex) => {
          this.setErrors(ex);
        }
      });
  }

  updatePicture() {
    this.originalImage = this.selectedExercise?.pictureUrl ?? null;
    this.previewImage = this.originalImage;
  }

  // events

  onFileSelected(event: any) {
    const file: File = event.target.files[0];
    if (!file) return;

    this.form.patchValue({ picture: file });
    this.hasUnsavedChange = true;

    // Load preview
    const reader = new FileReader();
    reader.onload = () => this.previewImage = reader.result as string;
    reader.readAsDataURL(file);
  }

  cancelChanges() {
    this.previewImage = this.originalImage;
    this.form.patchValue({ picture: null });
    this.hasUnsavedChange = false;
  }

  deletePicture() {
    if (!this.selectedExercise?.pictureUrl) return;

    this.selectedExercise!.pictureUrl = '';
    this.form.patchValue({ removePicture: true });
    this.updatePicture();
  }

}
