/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.order;

import com.team1.ecommerceplatformm.orderDetails.OrderDetailsDTO;
import java.sql.Date;
import java.util.List;
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
@AllArgsConstructor
@NoArgsConstructor
@Setter
@ToString
public class OrderDTO {

    private String orderId;
    private int deliveryId;
    private int userId;
    private String wardId;
    private Date orderDate;
    private double transactionFee;
    private double shipFee;
    private String address;
    private int status;
    private Date shippedDate;
    private int paymentId;
    private double total;
    private String mainImgUrl;
    private List<OrderDetailsDTO> orderDetails;
}
