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

    public ArrayList<ImageProductDTO> getAllImagesIsNotMain(int id) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT  [image_id]\n"
                + "      ,[product_id]\n"
                + "      ,[url]\n"
                + "      ,[is_main_img]\n"
                + "  FROM [EcommmercePlatform].[dbo].[image_product] where is_main_img = 0 and product_id = ?");
        stm.setInt(1, id);
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
    public ImageProductDTO get(int id) throws SQLException {
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
    public void save(ImageProductDTO t) {
        try {
            PreparedStatement stm = conn.prepareStatement("insert into image_product(product_id,url,is_main_img) values(?,?,?)");
            stm.setInt(1, t.getProductID());
            stm.setString(2, t.getUrl());
            stm.setBoolean(3, t.isMainImage());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("Loi ben save image product" + e);
        }
    }

    @Override
    public void update(ImageProductDTO t) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("update image_product set url=? where image_id =?");
            stm.setString(1, t.getUrl());
            stm.setInt(2, t.getImageID());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("Loi ben update image product" + e);
        }
    }

    @Override
    public void delete(ImageProductDTO t) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("delete from image_product where image_id = ?");
            stm.setInt(1, t.getImageID());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("Loi ben delete image product" + e);
        }
    }

    public static void main(String[] args) {
        try {
            ImageProductDAO dao = new ImageProductDAO();
            ArrayList<ImageProductDTO> l = dao.getAllImagesIsNotMain(452);
            for (ImageProductDTO imageProductDTO : l) {
                System.out.println(imageProductDTO);
            }
//            System.out.println(dao.getMainImageByProductID(167));
        } catch (SQLException ex) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
