/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.category;

import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.user.UserDAO;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author omach
 */
public class test {
    public static void main(String[] args) throws SQLException {
         CategoryDAO cateDAO = new CategoryDAO();
         ProductDAO proDAO = new ProductDAO();
         UserDAO userDAO = new UserDAO();
         ArrayList<Integer> userCount =  new ArrayList<>();
         ArrayList<Integer> listcount =  new ArrayList<>();
         ArrayList<String> listname = new ArrayList<>();
         
         listname = cateDAO.getNameOfCategory();
         listcount = proDAO.getCountByCreateDay();
         userCount = userDAO.getCountOfUser();
         System.out.println(listcount);
         
    }
   
    
    
}
