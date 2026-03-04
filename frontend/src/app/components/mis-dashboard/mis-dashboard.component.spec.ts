import { ComponentFixture, TestBed } from '@angular/core/testing';
import { provideHttpClient } from '@angular/common/http';
import { provideHttpClientTesting } from '@angular/common/http/testing';
import { provideRouter } from '@angular/router';

import { MisDashboardComponent } from './mis-dashboard.component';

describe('MisDashboardComponent', () => {
  let component: MisDashboardComponent;
  let fixture: ComponentFixture<MisDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MisDashboardComponent],
      providers: [
        provideHttpClient(),
        provideHttpClientTesting(),
        provideRouter([])
      ]
    })
      .compileComponents();

    fixture = TestBed.createComponent(MisDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should filter policies by policy number', () => {
    // Given
    component.pendingPolicies = [
      { policyNumber: 'POL-123', customer: { firstName: 'John' } },
      { policyNumber: 'POL-456', customer: { firstName: 'Jane' } }
    ];
    component.viewMode = 'pending';
    component.searchTerm = '123';

    // When
    component.applyFilter();

    // Then
    expect(component.filteredPolicies.length).toBe(1);
    expect(component.filteredPolicies[0].policyNumber).toBe('POL-123');
  });

  it('should filter policies by customer name (case insensitive)', () => {
    // Given
    component.pendingPolicies = [
      { policyNumber: 'POL-123', customer: { firstName: 'John' } },
      { policyNumber: 'POL-456', customer: { firstName: 'Jane' } }
    ];
    component.viewMode = 'pending';
    component.searchTerm = 'jane';

    // When
    component.applyFilter();

    // Then
    expect(component.filteredPolicies.length).toBe(1);
    expect(component.filteredPolicies[0].customer.firstName).toBe('Jane');
  });

  it('should show empty list when no match found', () => {
    // Given
    component.pendingPolicies = [
      { policyNumber: 'POL-123', customer: { firstName: 'John' } }
    ];
    component.viewMode = 'pending';
    component.searchTerm = 'XYZ';

    // When
    component.applyFilter();

    // Then
    expect(component.filteredPolicies.length).toBe(0);
  });
});
