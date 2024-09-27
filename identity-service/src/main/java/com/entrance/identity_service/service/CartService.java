package com.entrance.identity_service.service;

import com.entrance.identity_service.dto.request.CartCreationRequest;
import com.entrance.identity_service.entity.Cart;
import com.entrance.identity_service.entity.Customer;
import com.entrance.identity_service.entity.Product;
import com.entrance.identity_service.respository.CartRepository;
import com.entrance.identity_service.respository.CustomerRepository;
import com.entrance.identity_service.respository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CartService {

    private final CartRepository cartRepository;
    private final CustomerRepository customerRepository;
    private final ProductRepository productRepository;

    public CartService(CartRepository cartRepository, CustomerRepository customerRepository, ProductRepository productRepository) {
        this.cartRepository = cartRepository;
        this.customerRepository = customerRepository;
        this.productRepository = productRepository;
    }


    public Cart addProductToCart(CartCreationRequest request) {
        Optional<Customer> customerOpt = customerRepository.findById(request.getCustomerId());
        Optional<Product> productOpt = productRepository.findById(request.getProductId());

        if (customerOpt.isPresent() && productOpt.isPresent()) {
            Cart cart = new Cart();
            cart.setCustomer(customerOpt.get());
            cart.setProduct(productOpt.get());
            cart.setQuantity(request.getQuantity());

            return cartRepository.save(cart);
        } else {
            throw new RuntimeException("Customer or Product not found");
        }
    }


    public Cart getCartById(Integer id) {
        return cartRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Cart not found"));
    }


    public List<Cart> getAllCarts() {
        return cartRepository.findAll();
    }
}
