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

public class Top10bybenefit {
    
    private int shopID;
    private int productID ;
    private int quatity ;
    private int revenue;
    private String name;

}