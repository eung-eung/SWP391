/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.shop;

import com.team1.ecommerceplatformm.product.ProductDTO;
import java.sql.Date;
import java.util.ArrayList;
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
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ShopDTO {

    private int shopID;
    private int userID;
    private Date createAt;
    private String shopName;
    private boolean status;
    private int total;
    private String avatar;
    private ArrayList<ProductDTO> listProducts;
    private String paypalAccount;
}
