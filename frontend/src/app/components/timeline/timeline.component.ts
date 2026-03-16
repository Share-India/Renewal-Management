import { Component, EventEmitter, Output, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'app-timeline',
    standalone: true,
    imports: [CommonModule],
    templateUrl: './timeline.component.html',
    styleUrls: ['./timeline.component.css']
})
export class TimelineComponent {
    @Output() daySelected = new EventEmitter<number>();
    @Input() counts: { [key: number]: number } = {};
    @Input() adminMode: boolean = false;

    days: number[] = [75, 60, 45, 30, 15, 7, 3, 2, 1];
    postExpiryDays: number[] = [-1, -2, -3, -7, -15, -30, -45, -60, -75];
    selectedDay: number | null = null;

    selectDay(day: number) {
        this.selectedDay = day;
        this.daySelected.emit(day);
    }
}
