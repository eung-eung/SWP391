/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.product;

import com.team1.ecommerceplatformm.category.CategoryDAO;
import com.team1.ecommerceplatformm.category.CategoryDTO;
import com.team1.ecommerceplatformm.common.AbstractDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author boyvi
 */
public class ProductDAO extends AbstractDAO<ProductDTO> {

    @Override
    public ArrayList<ProductDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[shop_id]\n"
                + "      ,[category_id]\n"
                + "      ,[user_admin_id]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "      ,[status]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at]\n"
                + "      ,[discount]\n"
                + "      ,[sold_count]\n"
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product]");
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            ProductDTO dto = new ProductDTO();
            dto.setProductID(rs.getInt("product_id"));
            dto.setShopID(rs.getInt("shop_id"));
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setUserAdminID(rs.getInt("user_admin_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public ArrayList<ProductDTO> getAllProductByCategoryID(int categoryID) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[shop_id]\n"
                + "      ,[category_id]\n"
                + "      ,[user_admin_id]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "      ,[status]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at]\n"
                + "      ,[discount]\n"
                + "      ,[sold_count]\n"
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where category_id = ?");
        stm.setInt(1, categoryID);
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            ProductDTO dto = new ProductDTO();
            dto.setProductID(rs.getInt("product_id"));
            dto.setShopID(rs.getInt("shop_id"));
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setUserAdminID(rs.getInt("user_admin_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
            list.add(dto);
        }
        return list;
    }

    public ArrayList<ProductDTO> getAllProductByName(String name) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[shop_id]\n"
                + "      ,[category_id]\n"
                + "      ,[user_admin_id]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "      ,[status]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at]\n"
                + "      ,[discount]\n"
                + "      ,[sold_count]\n"
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where name like ?");
        stm.setString(1, "%" + name + "%");
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            ProductDTO dto = new ProductDTO();
            dto.setProductID(rs.getInt("product_id"));
            dto.setShopID(rs.getInt("shop_id"));
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setUserAdminID(rs.getInt("user_admin_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
            list.add(dto);
        }
        return list;
    }

    public ArrayList<ProductDTO> getProductsByHavingBannerVertical() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[category_id]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Product] where category_id in (select [category_id] from Category where bannerVertical is not null)\n"
                + "  and sold_count >70");
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            ProductDTO dto = new ProductDTO();
            dto.setProductID(rs.getInt("product_id"));
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("name"));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public ArrayList<ProductDTO> getTOP20BestSellingProductsByCategoryID(int CategoryID) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT TOP (20) [product_id]\n"
                + "      ,[category_id]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Product] WHERE category_id = ?"
        );
        stm.setInt(1, CategoryID);
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        ImageProductDAO imageProductDAO = new ImageProductDAO();
        while (rs.next()) {
            ProductDTO dto = new ProductDTO();
            int productID = rs.getInt("product_id");
            dto.setProductID(productID);
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("name"));
            dto.setMainImg(imageProductDAO.getMainImageByProductID(productID).getUrl());
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public ArrayList<ArrayList<ProductDTO>> getAllTOP20BestSellingProductsByCategoryIDs(ArrayList<CategoryDTO> listCate) throws SQLException {
        ArrayList<ArrayList<ProductDTO>> list = new ArrayList<>();
        for (CategoryDTO category : listCate) {
            list.add(getTOP20BestSellingProductsByCategoryID(category.getCategoryID()));
        }
        return list;
    }

    @Override
    public ProductDTO get(int id) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[shop_id]\n"
                + "      ,[category_id]\n"
                + "      ,[user_admin_id]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[quantity]\n"
                + "      ,[status]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at]\n"
                + "      ,[discount]\n"
                + "      ,[sold_count]\n"
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where product_id = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        ImageProductDAO imgDao = new ImageProductDAO();
        ProductDTO dto = new ProductDTO();
        if (rs.next()) {

            dto.setProductID(rs.getInt("product_id"));
            dto.setShopID(rs.getInt("shop_id"));
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setUserAdminID(rs.getInt("user_admin_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
            dto.setMainImg(imgDao.getMainImageByProductID(rs.getInt("product_id")).getUrl());
        }
//        Optional<ProductDTO> result = ;
        return dto;

    }

    @Override
    public void save(ProductDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ProductDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ProductDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        try {
            ProductDAO dao = new ProductDAO();
            CategoryDAO cdao = new CategoryDAO();
            ArrayList<CategoryDTO> lt = cdao.getAll();
//            ProductDTO dtoa = dao.get(449);
//            System.out.println(dtoa);

            dao.getTOP20BestSellingProductsByCategoryID(2).forEach(System.out::println);
            ArrayList<ArrayList<ProductDTO>> lsit = dao.getAllTOP20BestSellingProductsByCategoryIDs(lt);

            for (ArrayList<ProductDTO> productDTO : lsit) {
                System.out.println(productDTO.toString());

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

}
