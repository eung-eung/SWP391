/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.orderDetails;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
