package com.entrance.identity_service.controller;

import com.entrance.identity_service.dto.request.ProductCreationRequest;
import com.entrance.identity_service.entity.Product;
import com.entrance.identity_service.service.CustomerService;
import com.entrance.identity_service.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;
    @GetMapping
    public ResponseEntity<List<ProductCreationRequest>> getAllProduct(){
        List<ProductCreationRequest> products = productService.getAllProduct();
        return ResponseEntity.ok(products);
    }
    @GetMapping("/{id}")
    public ResponseEntity<ProductCreationRequest> getProductById(@PathVariable("id") int productId) {
        Optional<Product> product = productService.getProductById(productId);
        if (product.isPresent()) {
            ProductCreationRequest productCreationRequest = new ProductCreationRequest(product.get());
            return ResponseEntity.ok(productCreationRequest);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
