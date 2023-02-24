/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.order;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import com.team1.ecommerceplatformm.orderDetails.OrderDetailsDAO;
import com.team1.ecommerceplatformm.orderDetails.OrderDetailsDTO;
import java.sql.PreparedStatement;
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
        conn.close();
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
            OrderDTO dto = new OrderDTO();
            dto.setPaymentId(1);
            dto.setUserId(69);
            dto.setWardId("00001");
            List<OrderDetailsDTO> t = new ArrayList<>();
            t.add(new OrderDetailsDTO(149, 12));
            t.add(new OrderDetailsDTO(150, 12));
            t.add(new OrderDetailsDTO(151, 12));

            dto.setOrderDetails(t);

            d.save(dto);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
