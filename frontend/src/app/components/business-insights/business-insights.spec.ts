import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BusinessInsights } from './business-insights';

describe('BusinessInsights', () => {
  let component: BusinessInsights;
  let fixture: ComponentFixture<BusinessInsights>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BusinessInsights]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BusinessInsights);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
