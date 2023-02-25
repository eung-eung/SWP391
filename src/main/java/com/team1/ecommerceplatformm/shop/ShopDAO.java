/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.shop;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author boyvi
 */
public class ShopDAO extends AbstractDAO<ShopDTO> {

    @Override
    public ArrayList<ShopDTO> getAll() throws SQLException {
        ArrayList<ShopDTO> list = new ArrayList<>();
       PreparedStatement stm = conn.prepareStatement("select * from Shop");
        ResultSet rs = stm.executeQuery();
         ShopDTO dto = new ShopDTO();
        if (rs.next()) {
           
            dto.setShopID(rs.getInt(1));
            dto.setUserID(rs.getInt(2));
            dto.setCreateAt(rs.getDate(3));
            dto.setShopName(rs.getString(4));
            list.add(dto);
<<<<<<< Updated upstream
             System.err.println(dto.toString());
=======
//            System.err.println(dto.toString());
>>>>>>> Stashed changes
        }
        return list;
    }

    @Override
    public ShopDTO get(int id) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT  [shop_id]\n"
                + "      ,[user_id]\n"
                + "      ,[created_at]\n"
                + "      ,[shop_name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Shop] where [shop_id] = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        ShopDTO dto = new ShopDTO();
        if (rs.next()) {
            dto.setShopID(rs.getInt(1));
            dto.setUserID(rs.getInt(2));
            dto.setCreateAt(rs.getDate(3));
            dto.setShopName(rs.getString(4));
        }
        return dto;
    }
    
    public ShopDTO getByUserID(int id) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT  [shop_id]\n"
                + "      ,[user_id]\n"
                + "      ,[created_at]\n"
                + "      ,[shop_name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Shop]"
                + " where [user_id] = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        ShopDTO dto = new ShopDTO();
        if (rs.next()) {
            dto.setShopID(rs.getInt(1));
            dto.setUserID(rs.getInt(2));
            dto.setCreateAt(rs.getDate(3));
            dto.setShopName(rs.getString(4)); 
        }
        return dto;
    }

    @Override
    public void save(ShopDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ShopDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ShopDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
