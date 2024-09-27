package com.entrance.identity_service.controller;

import com.entrance.identity_service.dto.request.CustomerCreationRequest;
import com.entrance.identity_service.dto.request.ProductCreationRequest;
import com.entrance.identity_service.entity.Customer;
import com.entrance.identity_service.entity.Product;
import com.entrance.identity_service.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @PostMapping
    public ResponseEntity<Customer> createCustomer(@RequestBody CustomerCreationRequest request) {
        Customer customer = new Customer();
        customer.setName(request.getName());
        customer.setEmail(request.getEmail());
        customer.setPassword(request.getPassword());
        customer.setAddress(request.getAddress());
        customer.setPhone(request.getPhone());

        Customer createdCustomer = customerService.createCustomer(customer);

        return ResponseEntity.ok(createdCustomer);
    }
    @GetMapping
    public ResponseEntity<List<Customer>> getAllCustomers() {
        List<Customer> customers = customerService.getAllCustomers();
        return ResponseEntity.ok(customers);
    }

}
