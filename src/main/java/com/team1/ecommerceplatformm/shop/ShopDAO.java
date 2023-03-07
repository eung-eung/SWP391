/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.shop;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author boyvi
 */
public class ShopDAO extends AbstractDAO<ShopDTO> {

    @Override
    public List<ShopDTO> getAll() throws SQLException {
        ArrayList<ShopDTO> list = new ArrayList<>();
        PreparedStatement stm = conn.prepareStatement("select * from Shop");
        ResultSet rs = stm.executeQuery();

        while (rs.next()) {
            ShopDTO dto = new ShopDTO();
            dto.setShopID(rs.getInt(1));
            dto.setUserID(rs.getInt(2));
            dto.setCreateAt(rs.getDate(3));
            dto.setShopName(rs.getString(4));
            list.add(dto);
//            System.err.println(dto.toString());
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

    public ShopDTO getShopQuantities(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("  select s.shop_name,count(p.product_id) from Shop s \n"
                + "								inner join Product p on p.shop_id = s.shop_id\n"
                + "								where s.shop_id = ? group by s.shop_name");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        ShopDTO dto = new ShopDTO();
        if (rs.next()) {
            dto.setShopName(rs.getString(1));
            dto.setTotal(rs.getInt(2));
        }
        return dto;
    }

    public ShopDTO getAvatar(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("   select u.avatar from Shop s inner join [User] u on s.user_id =  u.user_id \n"
                + "						\n"
                + "								where s.shop_id = ?");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        ShopDTO dto = new ShopDTO();
        if (rs.next()) {
            dto.setAvatar(rs.getString(1));
        }
        return dto;
    }

    public ShopDTO getShopByShopId(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [shop_id]\n"
                + "      ,[user_id]\n"
                + "      ,[created_at]\n"
                + "      ,[shop_name]\n"
                + "      ,[status]\n"
                + "      ,[paypal_account]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Shop] WHERE [shop_id] = ?");
        stm.setInt(1, shopId);
        ShopDTO dto = new ShopDTO();
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            dto.setShopID(rs.getInt("shop_id"));
            dto.setUserID(rs.getInt("user_id"));
            dto.setCreateAt(rs.getDate("created_at"));
            dto.setShopName(rs.getString("shop_name"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setPaypalAccount(rs.getString("paypal_account"));
        }
        stm.close();
        conn.close();
        return dto;

    }
    public static void main(String[] args) {
        try {
            ShopDAO dao = new ShopDAO();
            ShopDTO dto = dao.getShopByShopId(1);
            System.out.println(dto);
                System.out.println(dto.getShopName());
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
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
