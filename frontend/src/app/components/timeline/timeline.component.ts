import { Component, EventEmitter, Output, Input, OnChanges } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-timeline',
    standalone: true,
    imports: [CommonModule],
    templateUrl: './timeline.component.html',
    styleUrls: ['./timeline.component.css']
})
export class TimelineComponent implements OnChanges {
    @Output() daySelected = new EventEmitter<number>();
    @Output() dateSelected = new EventEmitter<string>();
    @Input() counts: { [key: number]: number } = {};
    @Input() adminMode: boolean = false;
    @Input() userRole: string = '';
    @Input() selectedSourceTeam: string = '';
    @Input() selectedDate: string = '';
    @Input() isManager: boolean = false;

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

    ngOnChanges() {
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

    onDateChange(event: any) {
        const val = event.target.value;
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
