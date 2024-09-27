package com.entrance.identity_service.dto.request;
import com.entrance.identity_service.entity.Color;
import com.entrance.identity_service.entity.Image;
import com.entrance.identity_service.entity.Product;
import com.entrance.identity_service.entity.Size;
import jakarta.persistence.CascadeType;


import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Set;
import java.util.stream.Collector;
import java.util.stream.Collectors;

public class ProductCreationRequest {
    private int productId;
    private int categoryId;
    private String productName;
    private String description;
    private BigDecimal price;
    private BigDecimal discountPrice;
    private int stockQuantity;
    private BigDecimal rating;
    private int viewCount;
    private LocalDateTime discountExpiry;

    private Set<ColorCreationRequest> colors;
    private Set<SizeCreationRequest> sizes;
    private Set<ImageCreationRequest> images;

    public ProductCreationRequest(Product product) {
        this.productId = product.getProductId();
        this.categoryId = product.getCategory().getCategoryId(); // Lấy categoryId từ Category
        this.productName = product.getProductName();
        this.description = product.getDescription();
        this.price = product.getPrice();
        this.discountPrice = product.getDiscountPrice();
        this.stockQuantity = product.getStockQuantity();
        this.rating = product.getRating();
        this.viewCount = product.getViewCount();
        this.discountExpiry = product.getDiscountExpiry();
        this.colors = product.getColors().stream()
                .map(color -> new ColorCreationRequest(color.getColorCode()))
                .collect(Collectors.toSet());
        this.sizes = product.getSizes().stream()
                .map(size -> new SizeCreationRequest(size.getSizeName()))
                .collect(Collectors.toSet());
        this.images = product.getImages().stream()
                .map(image -> new ImageCreationRequest(image.getImageUrl()))
                .collect(Collectors.toSet());
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public LocalDateTime getDiscountExpiry() {
        return discountExpiry;
    }

    public void setDiscountExpiry(LocalDateTime discountExpiry) {
        this.discountExpiry = discountExpiry;
    }

    public Set<ColorCreationRequest> getColors() {
        return colors;
    }

    public void setColors(Set<Color> colors) {
        this.colors =  colors.stream()
                .map(color -> new ColorCreationRequest(color.getColorCode()))
                .collect(Collectors.toSet());
    }

    public Set<SizeCreationRequest> getSizes() {
        return sizes;
    }

    public Set<ImageCreationRequest> getImage() {
        return images;
    }
}
