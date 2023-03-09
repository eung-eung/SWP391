/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.ward;

import com.team1.ecommerceplatformm.common.AbstractDAO;
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
public class WardDAO extends AbstractDAO<WardDTO> {

    @Override
    public List<WardDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [ward_id]\n"
                + "      ,[district_id]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Ward]");
        ArrayList<WardDTO> list = new ArrayList<>();
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            WardDTO dto = new WardDTO();
            dto.setWardID(rs.getString(1));
            dto.setName(rs.getString(2));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    ;
    

 
    public List<WardDTO> getWardByID(String id) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [ward_id]\n"
                + "      ,[district_id]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Ward] where [district_id] = ?");
        stm.setString(1, id);
        ResultSet rs = stm.executeQuery();
        List<WardDTO> list = new ArrayList<>();
        while (rs.next()) {
            WardDTO dto = new WardDTO();
            dto.setWardID(rs.getString(1));
            dto.setDistrictID(rs.getString(2));
            dto.setName(rs.getString(3));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public WardDTO getAWardByWardID(String wardID) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [ward_id]\n"
                + "      ,[district_id]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Ward] where ward_id = ?");
        stm.setString(1, wardID);
        ResultSet rs = stm.executeQuery();
        WardDTO dto = new WardDTO();
        if (rs.next()) {
            dto.setWardID(rs.getString(1));
            dto.setDistrictID(rs.getString(2));
            dto.setName(rs.getString(3));
        }
        stm.close();
        rs.close();
        return dto;
    }

    @Override
    public void save(WardDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(WardDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(WardDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {

    }

    @Override
    public WardDTO get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
