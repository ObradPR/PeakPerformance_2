import { Directive, ElementRef, input, OnChanges, OnInit, Renderer2, SimpleChanges } from '@angular/core';

@Directive({
  selector: '[validation]'
})
export class ValidationDirective implements OnInit, OnChanges {
  key = input<string>('');
  errors = input<Record<string, string>>({});

  private errorTextEl: HTMLElement | null = null;
  private isFieldsetEl: boolean = false;

  constructor(private el: ElementRef, private renderer: Renderer2) { }

  ngOnInit(): void {
    const tagName = this.el.nativeElement.tagName.toLowerCase();
    this.isFieldsetEl = tagName === 'fieldset';

    this.showValidation();
  }

  ngOnChanges(changes: SimpleChanges): void {
    this.showValidation();
  }

  private showValidation() {
    if (!this.errors()) return;

    const errorMsg = this.errors()[this.key()];

    // Remove previous error message & styles
    this.renderer.removeClass(this.el.nativeElement, 'input-error');
    if (this.errorTextEl) {
      this.renderer.removeChild(this.el.nativeElement.parentNode, this.errorTextEl);
      this.errorTextEl = null;
    }

    // If validation error for this key exists
    if (this.errors() && this.key() && this.errors()[this.key()]) {
      if (!this.isFieldsetEl)
        this.renderer.addClass(this.el.nativeElement, 'input-error');

      this.errorTextEl = this.renderer.createElement('span');
      this.renderer.addClass(this.errorTextEl, 'validation-error-message');
      this.renderer.setProperty(this.errorTextEl, 'textContent', errorMsg);

      this.renderer.appendChild(this.el.nativeElement.parentNode, this.errorTextEl);
    }
  }

}
