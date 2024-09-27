package com.entrance.identity_service.dto.request;

public class ImageCreationRequest {
    private String imageUrl;

    public ImageCreationRequest(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
