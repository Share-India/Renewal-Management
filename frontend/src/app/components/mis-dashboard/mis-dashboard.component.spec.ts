import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MisDashboardComponent } from './mis-dashboard.component';

describe('MisDashboardComponent', () => {
  let component: MisDashboardComponent;
  let fixture: ComponentFixture<MisDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MisDashboardComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(MisDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
