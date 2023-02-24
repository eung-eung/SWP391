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
    public List<ShopDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT "
                + "[shop_id]"
                + " , [user_id]"
                + " ,[created_at]"
                + " , [shop_name]"
                + " , [status]"
                + "FROM [Shop]");
        ResultSet rs = stm.executeQuery();
        ArrayList<ShopDTO> list  = new ArrayList<>();
        while (rs.next()){
            ShopDTO dto = new ShopDTO();
            dto.setShopID(rs.getInt("shop_id"));
            dto.setUserID(rs.getInt("user_id"));
            dto.setShopName(rs.getString("shop_name"));
            dto.setCreateAt(rs.getDate("created_at"));
            dto.setStatus(rs.getBoolean("status"));
            list.add(dto);
        }
        rs.close();
        stm.close();
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
