package com.insurance.renewal.service;

import com.insurance.renewal.entity.Policy;
import com.insurance.renewal.repository.PolicyRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class RenewalServiceTest {

    @Mock
    private PolicyRepository policyRepository;

    @InjectMocks
    private RenewalService renewalService;

    @Test
    public void testGetPoliciesForTimeline() {
        // Given
        int days = 30;
        LocalDate targetDate = LocalDate.now().plusDays(days);
        Policy policy1 = new Policy();
        policy1.setPolicyNumber("POL-001");
        
        when(policyRepository.findPoliciesForTimeline(targetDate))
                .thenReturn(Arrays.asList(policy1));

        // When
        List<Policy> result = renewalService.getPoliciesForTimeline(days);

        // Then
        assertFalse(result.isEmpty());
        assertEquals(1, result.size());
        assertEquals("POL-001", result.get(0).getPolicyNumber());
    }

    @Test
    public void testSearchPolicies() {
        // Given
        String query = "John";
        Policy policy1 = new Policy();
        policy1.setPolicyNumber("POL-002");
        
        when(policyRepository.searchPolicies(query))
                .thenReturn(Arrays.asList(policy1));

        // When
        List<Policy> result = renewalService.searchPolicies(query);

        // Then
        assertEquals(1, result.size());
        assertEquals("POL-002", result.get(0).getPolicyNumber());
    }
}
