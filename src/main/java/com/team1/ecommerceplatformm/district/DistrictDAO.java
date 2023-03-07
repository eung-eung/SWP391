/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.district;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import com.team1.ecommerceplatformm.ward.WardDTO;
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
public class DistrictDAO extends AbstractDAO<DistrictDTO> {

    @Override
    public List<DistrictDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [district_id]\n"
                + "      ,[city_id]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[District]");
        ArrayList<DistrictDTO> list = new ArrayList<>();
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            DistrictDTO dto = new DistrictDTO();
            dto.setDistrictID(rs.getString(1));
            dto.setCityID(rs.getString(2));
            dto.setName(rs.getString(3));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public List<DistrictDTO> getDistrictByCityID(String id) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [district_id]\n"
                + "      ,[city_id]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[District] where [city_id] = ?");
        stm.setString(1, id);

        ArrayList<DistrictDTO> list = new ArrayList<>();
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            DistrictDTO dto = new DistrictDTO();
            dto.setDistrictID(rs.getString(1));
            dto.setCityID(rs.getString(2));
            dto.setName(rs.getString(3));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public DistrictDTO getADistrictByDistrictID(String districtID) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("select district_id, city_id, [name] "
                + "from District "
                + "where district_id = ?");
        stm.setString(1, districtID);
        DistrictDTO dto = new DistrictDTO();
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            dto.setDistrictID(rs.getString(1));
            dto.setCityID(rs.getString(2));
            dto.setName(rs.getString(3));
        }
        return dto;
    }
    public static void main(String[] args) {
        try {
            DistrictDAO dao = new DistrictDAO();
            DistrictDTO dto = dao.getADistrictByDistrictID("26767");
            System.out.println(dto);
        } catch (SQLException ex) {
            Logger.getLogger(DistrictDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public DistrictDTO get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void save(DistrictDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(DistrictDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(DistrictDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
