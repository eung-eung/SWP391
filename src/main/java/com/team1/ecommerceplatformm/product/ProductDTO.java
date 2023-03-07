/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.product;

import com.team1.ecommerceplatformm.imageProduct.ImageProductDTO;
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
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class ProductDTO {

    private int productID;
    private int shopID;
    private int categoryID;
    private int userAdminID;
    private double price;
    private String name;
    private String description;
    private int quanity;
    private boolean status;
    private Date createAt;
    private Date approveAt;
    private float discount;
    private int soldCount;
    private boolean authen;
    private ImageProductDTO mainImg;

//    private ImageProductDTO mainImg;
    private String shopName;
    private String categoryName;
    private List<ImageProductDTO> Imgs;

}
