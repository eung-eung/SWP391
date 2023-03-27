/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.orderDetails;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.shop.ShopDAO;
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
public class OrderDetailsDAO extends AbstractDAO<OrderDetailsDTO> {

    @Override
    public List<OrderDetailsDTO> getAll() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public OrderDetailsDTO get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<OrderDetailsDTO> getAllOrderDetailsByOrderId(int orderId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [order_id]\n"
                + "      ,[product_id]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "  FROM [EcommmercePlatform].[dbo].[OrderDetails] where order_id = ?");
        stm.setInt(1, orderId);
        ArrayList<OrderDetailsDTO> list = new ArrayList<>();
        ResultSet rs = stm.executeQuery();
        ProductDAO pDao = new ProductDAO();
        ImageProductDAO iDao = new ImageProductDAO();
        while (rs.next()) {
            ProductDTO pDto = pDao.get(rs.getInt("product_id"));
            OrderDetailsDTO dto = new OrderDetailsDTO();
            dto.setOrderId(rs.getInt("order_id"));
            dto.setProductId(rs.getInt("product_id"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setQuantity(rs.getInt("quantity"));
            dto.setPrice(rs.getDouble("price"));
            dto.setShopName(pDto.getShopName());
            dto.setProductName(pDto.getName());
            dto.setMainImageUrl(pDto.getMainImg().getUrl());
            dto.setShopId(pDto.getShopID());
            list.add(dto);
        }
        stm.close();
//        conn.close();
        return list;
    }

    public int getLastBoughtOrderIdBaseOnProductId(int productId, int userId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT TOP (1) o.[order_id]\n"
                + "  FROM [EcommmercePlatform].[dbo].[OrderDetails] od\n"
                + "  right join [Order] o on od.order_id = o.order_id \n"
                + "  left join Review r on r.order_id = od.order_id\n"
                + "  where od.product_id = ? and o.[user_id]= ? and r.rating is null\n"
                + "  order by od.order_id desc ");
        stm.setInt(1, productId);
        stm.setInt(2, userId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt("order_id");
        }
        return -1;
    }

    public static void main(String[] args) {
        try {
            OrderDetailsDAO dao = new OrderDetailsDAO();
            int d = dao.getLastBoughtOrderIdBaseOnProductId(149, 143);
            System.out.println("d" + d);
            ArrayList<OrderDetailsDTO> l = dao.getAllOrderDetailsByOrderId(17);
            for (OrderDetailsDTO orderDetailsDTO : l) {
                System.out.println(orderDetailsDTO);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void save(OrderDetailsDTO t) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("   insert into [OrderDetails]  "
                + "([order_id],[product_id],[quantity]) "
                + "values ((SELECT MAX(order_id)\n"
                + "FROM [Order]), ?,?)");
        stm.setInt(1, t.getProductId());
        stm.setInt(2, t.getQuantity());
        stm.executeUpdate();
        stm.close();
//        conn.close();

    }

    @Override
    public void update(OrderDetailsDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(OrderDetailsDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
