/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.order;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import com.team1.ecommerceplatformm.orderDetails.OrderDetailsDAO;
import com.team1.ecommerceplatformm.orderDetails.OrderDetailsDTO;
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
public class OrderDAO extends AbstractDAO<OrderDTO> {

    public ArrayList<OrderDTO> getAllOrdersByUserId(int userId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [order_id]\n"
                + "      ,[delivery_id]\n"
                + "      ,[payment_id]\n"
                + "      ,[user_id]\n"
                + "      ,[ward_id]\n"
                + "      ,[order_date]\n"
                + "      ,[shipped_date]\n"
                + "      ,[status]\n"
                + "      ,[address]\n"
                + "      ,[ship_fee]\n"
                + "      ,[transaction_fee]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Order] where [user_id] = ? order by [order_date] desc");
        stm.setInt(1, userId);
        OrderDetailsDAO odDao = new OrderDetailsDAO();
        ImageProductDAO iDao = new ImageProductDAO();
        ArrayList<OrderDTO> list = new ArrayList<>();
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            double total = 0;
            OrderDTO dto = new OrderDTO();
            dto.setOrderId(rs.getString("order_id"));
            dto.setDeliveryId(rs.getInt("delivery_id"));
            dto.setPaymentId(rs.getInt("payment_id"));
            dto.setUserId(rs.getInt("user_id"));
            dto.setWardId(rs.getString("ward_id"));
            dto.setOrderDate(rs.getDate("order_date"));
            dto.setShippedDate(rs.getDate("shipped_date"));
            dto.setStatus(rs.getInt("status"));
            dto.setAddress(rs.getString("address"));
            dto.setShipFee(rs.getDouble("ship_fee"));
            dto.setTransactionFee(rs.getDouble("transaction_fee"));
            dto.setOrderDetails(odDao.getAllOrderDetailsByOrderId(rs.getInt("order_id")));
            for (OrderDetailsDTO orderDetail : dto.getOrderDetails()) {
                total += orderDetail.getQuantity() * orderDetail.getPrice();
            }
            dto.setTotal(total);
            list.add(dto);
        }
        return list;
    }

    @Override
    public List<OrderDTO> getAll() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public OrderDTO get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void save(OrderDTO t) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [Order] "
                //                + "      [delivery_id]\n"
                + "      ([payment_id]\n"
                + "      ,[user_id]\n"
                + "      ,[ward_id]\n"
                //                + "      ,[shipped_date]\n"
                //                + "      ,[status]\n"
                + "      ,[address])\n"
                //                + "      ,[ship_fee]\n"
                //                + "      ,[transaction_fee])\n"
                + "VALUES (?,?,?,?) ");
        stm.setInt(1, t.getPaymentId());
        stm.setInt(2, t.getUserId());
        stm.setString(3, t.getWardId());
//        stm.setInt(4, t.getStatus());
        stm.setString(4, t.getAddress());
        stm.executeUpdate();

        stm.close();

        OrderDetailsDAO oDao = new OrderDetailsDAO();
        for (OrderDetailsDTO o : t.getOrderDetails()) {
            System.out.println(o);
//            oDao.save(o);
        }
        for (OrderDetailsDTO o : t.getOrderDetails()) {
//            System.out.println("");
            oDao.save(o);
        }
//        conn.close();
    }

    @Override
    public void update(OrderDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(OrderDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        try {
            OrderDAO d = new OrderDAO();
            ArrayList<OrderDTO> lis = d.getAllOrdersByUserId(144);
            lis.forEach(a -> System.out.println("a" + a));
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
