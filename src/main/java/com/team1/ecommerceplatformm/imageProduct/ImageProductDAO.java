/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.imageProduct;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

/**
 *
 * @author boyvi
 */
public class ImageProductDAO extends AbstractDAO<ImageProductDTO> {

    @Override
    public ArrayList<ImageProductDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT  [image_id]\n"
                + "      ,[product_id]\n"
                + "      ,[url]\n"
                + "      ,[is_main_img]\n"
                + "  FROM [EcommmercePlatform].[dbo].[image_product]");

        ResultSet rs = stm.executeQuery();
        ArrayList<ImageProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            ImageProductDTO dto = new ImageProductDTO();
            dto.setImageID(rs.getInt("image_id"));
            dto.setProductID(rs.getInt("product_id"));
            dto.setUrl(rs.getString("url"));
            dto.setMainImage(rs.getBoolean("is_main_img"));
            list.add(dto);
        }
        stm.close();
        rs.close();
        return list;
    }

    @Override
    public Optional<ImageProductDTO> get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ImageProductDTO getMainImageByProductID(int productID) throws SQLException {
        return getAll().stream()
                .filter(i -> i.getProductID() == productID && i.isMainImage() == true)
                .findFirst().orElse(null);
    }

    public ArrayList<ImageProductDTO> getAllMainImages() throws SQLException {
        return (ArrayList<ImageProductDTO>) getAll().stream()
                .filter(i -> i.isMainImage() == true)
                .collect(Collectors.toList());
    }

    @Override
    public void save(ImageProductDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ImageProductDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ImageProductDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        try {
            ImageProductDAO dao = new ImageProductDAO();
            dao.getAll().forEach(i -> System.out.println(i));
            dao.getAll().forEach(System.out::println);
            System.out.println(dao.getMainImageByProductID(167));
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
