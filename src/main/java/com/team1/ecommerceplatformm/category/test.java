/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.category;

import com.team1.ecommerceplatformm.product.ProductDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author omach
 */
public class test {
    public static void main(String[] args) throws SQLException {
         CategoryDAO cateDAO = new CategoryDAO();
         ProductDAO proDAO = new ProductDAO();
         ArrayList<Integer> listcount =  new ArrayList<>();
         ArrayList<String> listname = new ArrayList<>();
         listname = cateDAO.getNameOfCategory();
         listcount = proDAO.getCountByCategory();
         System.out.println(listcount);
         
    }
   
    
    
}
