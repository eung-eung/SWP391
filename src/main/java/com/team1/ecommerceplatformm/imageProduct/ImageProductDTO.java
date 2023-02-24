/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.imageProduct;

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
public class ImageProductDTO {

    private int imageID;
    private int productID;
    private String url;
    private boolean isMainImage;
    
    public String CreateID(){
        int productid = this.getProductID();
        int imageid=this.getImageID();
        String temp = String.valueOf(productid)+String.valueOf(imageid);
        String list[]=temp.split("");
         String out ="";
        for (int i = 0; i < list.length; i++) {
            int a = Integer.parseInt(list[i]);
            out +="ABCDEFGHIJKLMNOPQRSTUVWXYZ".substring(a, a+1);
            
        }
        System.err.println(out);
        return out;
    }
}
