/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.orderDetails;

import com.team1.ecommerceplatformm.review.ReviewDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;


import lombok.NoArgsConstructor;
import lombok.Setter;


import lombok.ToString;

/**
 *
 * @author boyvi
 */
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderDetailsDTO {

    private int orderId;
    private int productId;
    private int quantity;
    private float discount;
    private double price;
    private int shopId;
    private String shopName;
    private String productName;
    private String mainImageUrl;
    private boolean isReviewed;

    public OrderDetailsDTO(int productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public boolean isIsReviewed() {
        return isReviewed;
    }

    public void setIsReviewed(boolean isReviewed) {
        this.isReviewed = isReviewed;
    }

    

    

}
