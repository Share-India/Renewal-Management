import { Component, OnInit, OnDestroy, OnChanges, SimpleChanges, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ApiService } from '../../services/api.service';
import { Subscription, interval } from 'rxjs';

@Component({
  selector: 'app-work-progress',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './work-progress.component.html',
  styleUrls: ['./work-progress.component.css']
})
export class WorkProgressComponent implements OnInit, OnDestroy, OnChanges {
  @Input() branch: string = '';

  totalWork = 0;
  completedWork = 0;
  actualPercentage = 0;
  expectedPercentage = 0;

  feedbackTitle = '';
  feedbackDescription = '';
  feedbackClass = 'bg-secondary';
  iconClass = 'bi-clock';

  private dataSub?: Subscription;
  private timeSub?: Subscription;

  constructor(private apiService: ApiService) {}

  ngOnInit(): void {
    this.refreshProgress();
    
    // Update expected time-based percentage every minute
    this.timeSub = interval(60000).subscribe(() => {
      this.calculateFeedback();
    });
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['branch'] && !changes['branch'].isFirstChange()) {
      this.refreshProgress();
    }
  }

  ngOnDestroy(): void {
    if (this.dataSub) this.dataSub.unsubscribe();
    if (this.timeSub) this.timeSub.unsubscribe();
  }

  public refreshProgress() {
    this.dataSub = this.apiService.getTodaysWorkProgress(this.branch).subscribe({
      next: (data) => {
        this.totalWork = data.total;
        this.completedWork = data.completed;
        if (this.totalWork > 0) {
          this.actualPercentage = (this.completedWork / this.totalWork) * 100;
        } else {
          this.actualPercentage = 100; // If there's 0 work, it's 100% complete
        }
        this.calculateFeedback();
      },
      error: (err) => console.error('Error fetching work progress', err)
    });
  }

  private calculateFeedback() {
    const now = new Date();
    
    // For testing/mocking you could hardcode `now` to a specific time.
    // Uncomment for testing: 
    // now.setHours(14, 30);
    
    const h = now.getHours();
    const m = now.getMinutes();
    const decimalHours = h + (m / 60.0);

    // Schedule:
    // 10:00 AM : 0%
    // 11:00 AM : 14.29%
    // 12:00 PM : 28.57%
    // 1:00 PM : 42.86%
    // 2:00 PM : 42.86% (Break)
    // 3:00 PM : 57.14%
    // 4:00 PM : 71.43%
    // 5:00 PM : 85.71%
    // 6:00 PM : 100%

    let expected = 0;

    if (decimalHours < 10) {
      expected = 0;
    } else if (decimalHours >= 10 && decimalHours < 11) {
      expected = 0 + (14.29 * (decimalHours - 10)); // Interpolate roughly
    } else if (decimalHours >= 11 && decimalHours < 12) {
      expected = 14.29 + (14.28 * (decimalHours - 11));
    } else if (decimalHours >= 12 && decimalHours < 13) {
      expected = 28.57 + (14.29 * (decimalHours - 12));
    } else if (decimalHours >= 13 && decimalHours < 14) {
      expected = 42.86; // Break period starts. We just cap it here or let it interpolate to 42.86 at 2PM. Actually, interpolating 42.86 to 42.86 = flat line.
    } else if (decimalHours >= 14 && decimalHours < 15) {
      expected = 42.86 + (14.28 * (decimalHours - 14));
    } else if (decimalHours >= 15 && decimalHours < 16) {
      expected = 57.14 + (14.29 * (decimalHours - 15));
    } else if (decimalHours >= 16 && decimalHours < 17) {
      expected = 71.43 + (14.28 * (decimalHours - 16));
    } else if (decimalHours >= 17 && decimalHours < 18) {
      expected = 85.71 + (14.29 * (decimalHours - 17));
    } else {
      expected = 100;
    }

    this.expectedPercentage = Math.min(100, Math.max(0, expected));

    // Determine Feedback
    const diff = this.actualPercentage - this.expectedPercentage;
    
    // Total is 0 case handling
    if (this.totalWork === 0) {
       this.feedbackTitle = "All Caught Up!";
       this.feedbackDescription = "There is no scheduled work for today.";
       this.feedbackClass = "bg-success";
       this.iconClass = "bi-check-circle";
       return;
    }

    if (this.actualPercentage >= 100) {
      this.feedbackTitle = "Day Complete! 🎉";
      this.feedbackDescription = `Amazing! You've completed 100% of today's workload.`;
      this.feedbackClass = "bg-success";
      this.iconClass = "bi-trophy";
    } else if (diff >= 5) { // Ahead by >5%
      this.feedbackTitle = "Ahead of Schedule";
      this.feedbackDescription = `Great pace! You are trending ahead of the expected ${this.expectedPercentage.toFixed(1)}%.`;
      this.feedbackClass = "bg-success";
      this.iconClass = "bi-speedometer2";
    } else if (diff >= -5 && diff < 5) { // Within 5% tolerance
      this.feedbackTitle = "On Track";
      this.feedbackDescription = `Good momentum. You are right around the expected ${this.expectedPercentage.toFixed(1)}% mark.`;
      this.feedbackClass = "bg-primary";
      this.iconClass = "bi-bullseye";
    } else if (diff > -15 && diff < -5) { // Slightly behind
      this.feedbackTitle = "Slightly Behind";
      this.feedbackDescription = `You are currently at ${this.actualPercentage.toFixed(1)}%, slightly below the target of ${this.expectedPercentage.toFixed(1)}%.`;
      this.feedbackClass = "bg-warning text-dark";
      this.iconClass = "bi-exclamation-triangle";
    } else { // Far behind
      this.feedbackTitle = "Action Required";
      this.feedbackDescription = `You are trailing the day's cadence (Expected: ${this.expectedPercentage.toFixed(1)}%). Consider picking up the pace!`;
      this.feedbackClass = "bg-danger";
      this.iconClass = "bi-lightning-charge";
    }
  }
}
