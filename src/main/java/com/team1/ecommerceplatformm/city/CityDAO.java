/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.city;

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
public class CityDAO extends AbstractDAO<CityDTO> {

    @Override
    public List<CityDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [city_id]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[City]");
        ArrayList<CityDTO> list = new ArrayList<>();
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            CityDTO dto = new CityDTO();
            dto.setCityID(rs.getString(1));
            dto.setName(rs.getString(2));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public CityDTO getCityByID(String id) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [city_id]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[City] where [city_id] = ?");
        stm.setString(1, id);
        CityDTO dto = new CityDTO();
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            dto.setCityID(rs.getString(1));
            dto.setName(rs.getString(2));
        }
        rs.close();
        stm.close();
        return dto;
    }

    @Override
    public void save(CityDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(CityDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(CityDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public CityDTO get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public static void main(String[] args) {
        try {
            CityDAO dao = new CityDAO();
            List<CityDTO> l = dao.getAll();
            for (CityDTO cityDTO : l) {
                System.out.println(cityDTO);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
