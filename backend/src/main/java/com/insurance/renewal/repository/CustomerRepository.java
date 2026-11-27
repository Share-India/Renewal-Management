package com.insurance.renewal.repository;

import com.insurance.renewal.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    boolean existsByEmail(String email);

    List<Customer> findByPhone(String phone);

    Optional<Customer> findByEmail(String email);

    Optional<Customer> findByCustomerCode(String customerCode);

    @Query(value = "SELECT customer_code FROM customers " +
            "WHERE customer_code IS NOT NULL AND customer_code != '' " +
            "AND LOWER(TRIM(CONCAT(COALESCE(first_name, ''), ' ', COALESCE(last_name, '')))) = LOWER(TRIM(:fullName)) " +
            "LIMIT 1", nativeQuery = true)
    String findCustomerCodeByName(@Param("fullName") String fullName);

    @Query("SELECT DISTINCT c FROM Customer c WHERE " +
            "LOWER(c.customerCode) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "LOWER(CONCAT(COALESCE(c.firstName, ''), ' ', COALESCE(c.lastName, ''))) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
            "c.phone LIKE CONCAT('%', :query, '%') OR " +
            "LOWER(c.email) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<Customer> searchCustomers(@Param("query") String query);

    @Query(value = "SELECT COALESCE(MAX(CAST(SUBSTRING(customer_code, 7) AS UNSIGNED)), 0) " +
            "FROM customers WHERE customer_code LIKE 'SIIBPL%'", nativeQuery = true)
    Long findMaxCustomerCodeNumber();
}
