package com.entrance.identity_service.respository;

import com.entrance.identity_service.entity.Cart;
import com.entrance.identity_service.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartRepository extends JpaRepository<Cart,Integer> {
}
