package com.insurance.renewal.repository;

import com.insurance.renewal.entity.CallHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CallHistoryRepository extends JpaRepository<CallHistory, Long> {
    List<CallHistory> findByPolicyIdOrderByCallDateDesc(Long policyId);

    List<CallHistory> findByPolicyCustomerIdOrderByCallDateDesc(Long customerId);

    CallHistory findFirstByPolicyIdAndCallDateBeforeOrderByCallDateDesc(Long policyId, java.time.LocalDateTime callDate);

    List<CallHistory> findByAgentNameAndCallDateBetween(String agentName, java.time.LocalDateTime start, java.time.LocalDateTime end);

    void deleteByPolicyId(Long policyId);
}
