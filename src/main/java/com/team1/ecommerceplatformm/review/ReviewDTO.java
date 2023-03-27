/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.review;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author boyvi
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class ReviewDTO {

    private int reviewId;
    private int userId;
    private int productId;
    private int orderId;
    private String comment;
    private int rating;
    private Date createAt;
    private boolean status;
}
