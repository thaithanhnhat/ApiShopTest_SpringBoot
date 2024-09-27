package com.entrance.identity_service.controller;

import com.entrance.identity_service.dto.request.CartCreationRequest;
import com.entrance.identity_service.entity.Cart;
import com.entrance.identity_service.service.CartService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    // API thêm sản phẩm vào giỏ hàng
    @PostMapping
    public ResponseEntity<Cart> addProductToCart(@RequestBody CartCreationRequest request) {
        Cart newCartItem = cartService.addProductToCart(request);
        return ResponseEntity.ok(newCartItem);
    }


    @GetMapping("/{id}")
    public ResponseEntity<Cart> getCartById(@PathVariable Integer id) {
        Cart cart = cartService.getCartById(id);
        return ResponseEntity.ok(cart);
    }

    // API lấy toàn bộ giỏ hàng
    @GetMapping
    public ResponseEntity<List<Cart>> getAllCarts() {
        List<Cart> carts = cartService.getAllCarts();
        return ResponseEntity.ok(carts);
    }
}
