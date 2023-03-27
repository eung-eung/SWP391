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
            dto.setStatus(rs.getInt(5));
            list.add(dto);
//            System.err.println(dto.toString());
        }
        return list;
    }
    
    
       public ArrayList<ShopDTO> getAllShopHasAccepted() throws SQLException{
        PreparedStatement stm = conn.prepareStatement("SELECT [shop_id], [user_id],"
                + " [created_at], [shop_name], [status], [approve], [front_identity], [back_identity]"
                + " FROM Shop WHERE [status] <> 2 AND [approve] = 1");
        
        ResultSet rs = stm.executeQuery();
        ArrayList<ShopDTO> list = new ArrayList<>();
        while (rs.next()) {
            ShopDTO dto = new ShopDTO();
            dto.setShopID(rs.getInt("shop_id"));
            dto.setUserID(rs.getInt("user_id"));
            dto.setCreateAt(rs.getDate("created_at"));
            dto.setShopName(rs.getString("shop_name"));
            dto.setStatus(rs.getInt("status"));
            dto.setApprove(rs.getInt("approve"));
            dto.setFrontIdentity(rs.getString("front_identity"));
            dto.setBackIdentity(rs.getString("back_identity"));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;

    }
    
    public ArrayList<ShopDTO> getAllShopRegister() throws SQLException{
        PreparedStatement stm = conn.prepareStatement("SELECT [shop_id], [user_id],"
                + " [created_at], [shop_name], [status], [approve], [front_identity], [back_identity]"
                + " FROM Shop WHERE [approve] = 0");
        
        ResultSet rs = stm.executeQuery();
        ArrayList<ShopDTO> list = new ArrayList<>();
        while (rs.next()) {
            ShopDTO dto = new ShopDTO();
            dto.setShopID(rs.getInt("shop_id"));
            dto.setUserID(rs.getInt("user_id"));
            dto.setCreateAt(rs.getDate("created_at"));
            dto.setShopName(rs.getString("shop_name"));
            dto.setStatus(rs.getInt("status"));
            dto.setApprove(rs.getInt("approve"));
            dto.setFrontIdentity(rs.getString("front_identity"));
            dto.setBackIdentity(rs.getString("back_identity"));
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
                + "								where s.shop_id = ?  and p.authen = 1 and p.status = 1 group by s.shop_name");
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


    public double getTotalRevenue(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("  select sum(o.quantity * o.price) as total from OrderDetails o inner join Product p\n"
                + "  on o.product_id = p.product_id  where shop_id = ?");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getDouble(1);
        }
        return 0;
    }


    public void updateBanShopStatus(int shopId) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Shop SET [status] = 0 WHERE shop_id = ? ");
            stm.setInt(1, shopId);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }

    public void updateUnBanShopStatus(int shopId) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Shop SET [status] = 1 WHERE shop_id = ? ");
            stm.setInt(1, shopId);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }

    public void updateAcceptShopStatus(int shopId) throws SQLException{
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Shop SET [status] = 1, [approve] = 1 WHERE shop_id = ? ");
            stm.setInt(1, shopId);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }
    
    public void updateRejectShopStatus(int shopId) throws SQLException{
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Shop SET [status] = 2, [approve] = 1 WHERE shop_id = ? ");
            stm.setInt(1, shopId);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }
    @Override
    public void save(ShopDTO t) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement(""
                    + "  INSERT INTO [Shop] ([user_id],[created_at],[shop_name],[status],[approve], front_identity, back_identity)\n"
                    + "VALUES (?,GETDATE(),?,0,0,?,?)");

            stm.setInt(1, t.getUserID());
            stm.setString(2, t.getShopName());
            stm.setString(3, t.getFrontIdentity());
            stm.setString(4, t.getBackIdentity());

            stm.executeUpdate();
            stm.close();
            System.out.println(t.getUserID());
        } catch (Exception e) {
            System.err.println("Loi save SHop" + e.getMessage());
        }
    }

    @Override
    public void update(ShopDTO shopDTO) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement(""
                    + "UPDATE [Shop]\n"
                    + "   SET [user_id] = ? \n"
                    + "      ,[shop_name] = ?\n"
                    + "      ,[status] = ? \n"
                    + "      ,[front_identity] = ?\n"
                    + "      ,[back_identity] = ?\n"
                    + " WHERE shop_id = ?");

            stm.setInt(1, shopDTO.getUserID());
            stm.setString(2, shopDTO.getShopName());
            stm.setInt(3, shopDTO.getStatus());
            stm.setString(4, shopDTO.getFrontIdentity());
            stm.setString(5, shopDTO.getBackIdentity());
            stm.setInt(6, shopDTO.getShopID());
            stm.executeUpdate();
            stm.close();
            System.out.println(shopDTO.getUserID());
        } catch (Exception e) {
            System.err.println("Loi update SHop" + e.getMessage());
        }
    }

    public void update(int id, String name) {
        try {
            PreparedStatement stm = conn.prepareStatement(""
                    + "UPDATE [Shop]\n"
                    + "   SET  \n"
                    + "     [shop_name] = ?\n"
                    + " WHERE shop_id = ?");

            stm.setString(1, name);
            stm.setInt(2, id);
            stm.executeUpdate();
            stm.close();
        } catch (Exception e) {
            System.err.println("Loi update SHop" + e.getMessage());
        }
    }


    @Override
    public void delete(ShopDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
