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
    @Input() counts: { [key: number]: number } = {};
    @Input() adminMode: boolean = false;
    @Input() userRole: string = '';

    days: number[] = [75, 60, 45, 30, 15, 7, 3, 2, 1];
    postExpiryDays: number[] = [-1, -2, -3, -7, -15, -30, -45, -60, -75];
    selectedDay: number | null = null;
    isTeamTimeline: boolean = false;

    ngOnChanges() {
        if (this.userRole && (this.userRole.includes('CLAIMS') || this.userRole.includes('SALES') || this.userRole.includes('UNDERWRITING'))) {
            this.isTeamTimeline = true;
            this.days = [0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15];
            this.postExpiryDays = [];
        } else {
            this.isTeamTimeline = false;
            this.days = [75, 60, 45, 30, 15, 7, 3, 2, 1];
            this.postExpiryDays = [-1, -2, -3, -7, -15, -30, -45, -60, -75];
        }
    }

    selectDay(day: number) {
        this.selectedDay = day;
        this.daySelected.emit(day);
    }

    select60Days() {
        this.selectedDay = 600; // Special magic number for 60-day range
        this.daySelected.emit(600);
    }
}
