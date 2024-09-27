package com.entrance.identity_service.dto.request;

public class SizeCreationRequest {
    private String sizeName;

    public SizeCreationRequest(String sizeName) {
        this.sizeName = sizeName;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }
}
