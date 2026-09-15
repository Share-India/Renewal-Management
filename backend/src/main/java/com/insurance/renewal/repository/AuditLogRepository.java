package com.insurance.renewal.repository;

import com.insurance.renewal.entity.AuditLog;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AuditLogRepository extends JpaRepository<AuditLog, Long> { 
    List<AuditLog> findByPolicyIdIn(List<Long> policyIds);
    List<AuditLog> findByPolicyIdOrderByUpdatedAtDesc(Long policyId);
}
