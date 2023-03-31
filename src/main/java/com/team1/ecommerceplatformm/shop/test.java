/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.shop;

import com.team1.ecommerceplatformm.review.ReviewDAO;
import com.team1.ecommerceplatformm.review.ReviewDTO;
import com.team1.ecommerceplatformm.user.UserDAO;
import com.team1.ecommerceplatformm.user.UserDTO;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author omach
 */
public class test {
    public static void main(String[] args) throws SQLException {
        ReviewDAO reviewDao = new ReviewDAO();
        ArrayList<ReviewDTO> list = new ArrayList<>();
        list = reviewDao.getAll();
        System.out.println(list);
    }
}
