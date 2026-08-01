import { Injectable } from '@angular/core';
import Swal from 'sweetalert2';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {

  constructor() { }

  /**
   * Shows a sleek, top-right success toast notification that disappears automatically.
   */
  showSuccessToast(message: string): void {
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    });

    Toast.fire({
      icon: 'success',
      title: message
    });
  }

  /**
   * Shows an elegant error modal in the center of the screen.
   */
  showErrorModal(message: string, title: string = 'Oops...'): void {
    Swal.fire({
      icon: 'error',
      title: title,
      text: message,
      customClass: {
        confirmButton: 'btn btn-primary rounded-pill px-4 shadow-sm',
        popup: 'rounded-4 shadow-lg border-0'
      },
      buttonsStyling: false
    });
  }
  
  /**
   * Shows a standard success modal in the center of the screen (for very important successes).
   */
  showSuccessModal(message: string, title: string = 'Success!'): void {
    Swal.fire({
      icon: 'success',
      title: title,
      text: message,
      customClass: {
        confirmButton: 'btn btn-primary rounded-pill px-4 shadow-sm',
        popup: 'rounded-4 shadow-lg border-0'
      },
      buttonsStyling: false
    });
  }

  async confirmAction(text: string, title: string = 'Please Confirm', confirmButtonText: string = 'Yes, confirm'): Promise<boolean> {
    // If the text itself starts with "Are you sure", it's redundant to have "Are you sure?" as the title.
    const displayTitle = text.toLowerCase().startsWith('are you sure') ? 'Action Required' : title;
    
    const result = await Swal.fire({
      title: displayTitle,
      text: text,
      icon: 'warning',
      showCancelButton: true,
      customClass: {
        confirmButton: 'btn btn-danger rounded-pill px-4 mx-2 shadow-sm',
        cancelButton: 'btn btn-light rounded-pill px-4 mx-2 border shadow-sm',
        popup: 'rounded-4 shadow-lg border-0'
      },
      buttonsStyling: false,
      confirmButtonText: `<i class="bi bi-check-circle me-1"></i> ${confirmButtonText}`,
      cancelButtonText: `<i class="bi bi-x-circle me-1"></i> Cancel`
    });

    return result.isConfirmed;
  }
}
