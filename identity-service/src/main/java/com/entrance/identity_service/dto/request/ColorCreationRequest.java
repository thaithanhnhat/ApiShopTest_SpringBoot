package com.entrance.identity_service.dto.request;

public class ColorCreationRequest {
    private String colorCode;


    public ColorCreationRequest(String colorCode) {
        this.colorCode = colorCode;
    }

    // Getter and Setter
    public String getColorCode() {
        return colorCode;
    }

    public void setColorCode(String colorCode) {
        this.colorCode = colorCode;
    }
}
