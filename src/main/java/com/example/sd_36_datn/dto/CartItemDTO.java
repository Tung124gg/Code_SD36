package com.example.sd_57_datn.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class CartItemDTO {
    private UUID id;
    private String quantity;

}
