import { Component, EventEmitter, Output, Input, OnInit, OnChanges } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-timeline',
    standalone: true,
    imports: [CommonModule],
    templateUrl: './timeline.component.html',
    styleUrls: ['./timeline.component.css']
})
export class TimelineComponent implements OnInit, OnChanges {
    @Output() daySelected = new EventEmitter<number>();
    @Output() dateSelected = new EventEmitter<string>();
    @Input() counts: { [key: number]: number } = {};
    @Input() adminMode: boolean = false;
    @Input() userRole: string = '';
    @Input() selectedSourceTeam: string = '';
    @Input() selectedDate: string = '';
    @Input() isManager: boolean = false;
    @Input() minDate: string = '';
    @Input() maxDate: string = '';

    days: number[] = [75, 60, 45, 30, 15, 7, 3, 2, 1];
    postExpiryDays: number[] = [-1, -2, -3, -7, -15, -30, -45, -60, -75];
    @Input() selectedDay: number | string | null = null;
    isTeamTimeline: boolean = false;

    get canShowDatePicker(): boolean {
        if (this.isManager) return true;
        if (!this.userRole) return false;
        const role = this.userRole.toUpperCase();
        return role.includes('CLAIMS_MANAGER') || 
               role.includes('SALES_MANAGER') || 
               role.includes('UNDERWRITING_MANAGER');
    }

    ngOnInit() {
        this.ensureDateRange();
    }

    ngOnChanges() {
        this.ensureDateRange();
        if ((this.userRole && (this.userRole.includes('CLAIMS') || this.userRole.includes('SALES') || this.userRole.includes('UNDERWRITING'))) || 
            (this.selectedSourceTeam && this.selectedSourceTeam.trim() !== '')) {
            this.isTeamTimeline = true;
            this.days = [0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15];
            this.postExpiryDays = [];
        } else {
            this.isTeamTimeline = false;
            this.days = [75, 60, 45, 30, 15, 7, 3, 2, 1];
            this.postExpiryDays = [-1, -2, -3, -7, -15, -30, -45, -60, -75];
        }
    }

    ensureDateRange() {
        if (!this.minDate || !this.maxDate) {
            const now = new Date();
            const currentYear = now.getFullYear();
            const currentMonth = now.getMonth();

            // 1st day of last month (currentMonth - 1)
            const minDateObj = new Date(currentYear, currentMonth - 1, 1);
            const minY = minDateObj.getFullYear();
            const minM = String(minDateObj.getMonth() + 1).padStart(2, '0');
            this.minDate = `${minY}-${minM}-01`;

            // Last day of next month (currentMonth + 1)
            const maxDateObj = new Date(currentYear, currentMonth + 2, 0);
            const maxY = maxDateObj.getFullYear();
            const maxM = String(maxDateObj.getMonth() + 1).padStart(2, '0');
            const maxD = String(maxDateObj.getDate()).padStart(2, '0');
            this.maxDate = `${maxY}-${maxM}-${maxD}`;
        }
    }

    openDatePicker(inputEl: HTMLInputElement) {
        if (inputEl) {
            try {
                if (typeof inputEl.showPicker === 'function') {
                    inputEl.showPicker();
                } else {
                    inputEl.focus();
                }
            } catch (e) {
                inputEl.focus();
            }
        }
    }

    onDateChange(event: any) {
        const val = event.target.value;
        if (val) {
            if ((this.minDate && val < this.minDate) || (this.maxDate && val > this.maxDate)) {
                event.target.value = this.selectedDate || '';
                return;
            }
        }
        this.selectedDate = val;
        this.selectedDay = val ? 'custom-date' : null;
        this.dateSelected.emit(val);
    }

    clearDate() {
        this.selectedDate = '';
        this.selectedDay = null;
        this.dateSelected.emit('');
    }

    selectDay(day: number) {
        this.selectedDate = '';
        this.selectedDay = day;
        this.daySelected.emit(day);
    }

    select60Days() {
        this.selectedDate = '';
        this.selectedDay = 600; // Special magic number for 60-day range
        this.daySelected.emit(600);
    }
}
