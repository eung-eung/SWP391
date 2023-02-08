/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.product;

import java.sql.Date;
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

public class ProductDTO {
    private int product_id;
    private int shop_id;
    private int category_id;
    private int user_admin_id;
    private double price;
    private String name;
    private String description;
    private int quanity;
    private boolean status;
    private Date create_at;
    private Date approve_at;
    private float discount;
    private int sold_count;
    private boolean authen;
    



}
