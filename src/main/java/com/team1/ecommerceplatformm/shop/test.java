/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.shop;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author omach
 */
public class test {
    public static void main(String[] args) throws SQLException {
        ShopDAO shopDao = new ShopDAO();
        ArrayList<ShopDTO> list = new ArrayList<>();
        list = shopDao.getAllShopRegister();
        System.out.println(list);
    }
}
