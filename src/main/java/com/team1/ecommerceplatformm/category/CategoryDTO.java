/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.category;

import java.sql.SQLException;
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

public class CategoryDTO {

    private int categoryID;
    private String name;
    private String icon;
    private String banner;
    private String bannerVertical;
    
}
