package com.entrance.identity_service.service;

import com.entrance.identity_service.dto.request.ProductCreationRequest;
import com.entrance.identity_service.entity.Product;
import com.entrance.identity_service.respository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    public List<ProductCreationRequest> getAllProduct() {
        List<Product> products = productRepository.findAll();
        return products.stream().map(this::convertToDTO).collect(Collectors.toList());
    }

    private ProductCreationRequest convertToDTO(Product product) {
        ProductCreationRequest dto = new ProductCreationRequest(product);
        return dto;
    }
    public Optional<Product> getProductById(int productId) {
        return productRepository.findById(productId);
    }
}
