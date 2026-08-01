package com.insurance.renewal.repository;

import com.insurance.renewal.entity.PolicyDocument;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PolicyDocumentRepository extends JpaRepository<PolicyDocument, Long> {
}
