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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author boyvi
 */
public class ProductDAO extends AbstractDAO<ProductDTO> {

    @Override
    public ArrayList<ProductDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement(" \n"
                + "SELECT p.[product_id]\n"
                + "      ,p.[shop_id]\n"
                + "	  ,s.shop_name\n"
                + "      ,p.[category_id]\n"
                + "	  ,c.[name] as 'category_name'\n"
                + "      ,p.[user_admin_id] \n"
                + "      ,p.[price]\n"
                + "      ,p.[name] as 'product_name'\n"
                + "      ,p.[description]\n"
                + "      ,p.[quantity]\n"
                + "      ,p.[status]\n"
                + "      ,p.[create_at]\n"
                + "      ,p.[approve_at]\n"
                + "      ,p.[discount]\n"
                + "      ,p.[sold_count]\n"
                + "      ,p.[authen]\n"
                + "  FROM [Product] p JOIN Shop s ON p.shop_id = s.shop_id \n"
                + "  JOIN Category c ON p.category_id = c.category_id");
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            ProductDTO dto = new ProductDTO();
            dto.setProductID(rs.getInt("product_id"));
            dto.setShopID(rs.getInt("shop_id"));
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setUserAdminID(rs.getInt("user_admin_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("product_name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));

<<<<<<< Updated upstream
            dto.setShopName(rs.getString("shop_name"));
            dto.setCategoryName(rs.getString("category_name"));
=======
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

    public ArrayList<ProductDTO> getTOP10ProductByName(String name) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT TOP(10) [product_id]\n"
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

    public ArrayList<ProductDTO> getTOP20BestSellingProductsByCategoryID(int categoryID) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT TOP (20) [product_id]\n"
                + "      ,[category_id]\n"
                + "      ,[price]\n"
                + "      ,[name]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Product] WHERE category_id = ?"
        );
        stm.setInt(1, categoryID);
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
            dto.setMainImg(imageProductDAO.getMainImageByProductID(productID));
>>>>>>> Stashed changes
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public ArrayList<ProductDTO> getAllByIdUser(int user, int status) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(""
                + " \n"
                + "SELECT p.[product_id]\n"
                + "      ,p.[shop_id]\n"
                + "	  ,s.shop_name\n"
                + "      ,p.[category_id]\n"
                + "	  ,c.[name] as 'category_name'\n"
                + "      ,p.[user_admin_id] \n"
                + "      ,p.[price]\n"
                + "      ,p.[name] as 'product_name'\n"
                + "      ,p.[description]\n"
                + "      ,p.[quantity]\n"
                + "      ,p.[status]\n"
                + "      ,p.[create_at]\n"
                + "      ,p.[approve_at]\n"
                + "      ,p.[discount]\n"
                + "      ,p.[sold_count]\n"
                + "      ,p.[authen]\n"
                + "  FROM [Product] p JOIN Shop s ON p.shop_id = s.shop_id \n"
                + "  JOIN Category c ON p.category_id = c.category_id\n"
                + "  where p.[user_admin_id] = ? "
                + "AND  p.[status] = ?"
                + "");
        stm.setInt(1, user);
        stm.setInt(2, status);
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            ProductDTO dto = new ProductDTO();
            dto.setProductID(rs.getInt("product_id"));
            dto.setShopID(rs.getInt("shop_id"));
            dto.setCategoryID(rs.getInt("category_id"));
            dto.setUserAdminID(rs.getInt("user_admin_id"));
            dto.setPrice(rs.getDouble("price"));
            dto.setName(rs.getString("product_name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));

            dto.setShopName(rs.getString("shop_name"));
            dto.setCategoryName(rs.getString("category_name"));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public ArrayList<ProductDTO> getAllProductByCategoryID(int categoryID) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(""
                + " \n"
                + "SELECT p.[product_id]\n"
                + "      ,p.[shop_id]\n"
                + "	  ,s.shop_name\n"
                + "      ,p.[category_id]\n"
                + "	  ,c.[name] as 'category_name'\n"
                + "      ,p.[user_admin_id] \n"
                + "      ,p.[price]\n"
                + "      ,p.[name] as 'product_name'\n"
                + "      ,p.[description]\n"
                + "      ,p.[quantity]\n"
                + "      ,p.[status]\n"
                + "      ,p.[create_at]\n"
                + "      ,p.[approve_at]\n"
                + "      ,p.[discount]\n"
                + "      ,p.[sold_count]\n"
                + "      ,p.[authen]\n"
                + "  FROM [Product] p JOIN Shop s ON p.shop_id = s.shop_id \n"
                + "  JOIN Category c ON p.category_id = c.category_id "
                + " where c.category_id = ?");
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
            dto.setName(rs.getString("product_name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
<<<<<<< Updated upstream

            dto.setShopName(rs.getString("shop_name"));
            dto.setCategoryName(rs.getString("category_name"));
=======
            dto.setMainImg(imageProductDAO.getMainImageByProductID(rs.getInt("product_id")));
>>>>>>> Stashed changes
            list.add(dto);
        }
        return list;
    }

    public ArrayList<ProductDTO> getAllProductByName(String name) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(""
                + " \n"
                + "SELECT p.[product_id]\n"
                + "      ,p.[shop_id]\n"
                + "	  ,s.shop_name\n"
                + "      ,p.[category_id]\n"
                + "	  ,c.[name] as 'category_name'\n"
                + "      ,p.[user_admin_id] \n"
                + "      ,p.[price]\n"
                + "      ,p.[name] as 'product_name'\n"
                + "      ,p.[description]\n"
                + "      ,p.[quantity]\n"
                + "      ,p.[status]\n"
                + "      ,p.[create_at]\n"
                + "      ,p.[approve_at]\n"
                + "      ,p.[discount]\n"
                + "      ,p.[sold_count]\n"
                + "      ,p.[authen]\n"
                + "  FROM [Product] p JOIN Shop s ON p.shop_id = s.shop_id \n"
                + "  JOIN Category c ON p.category_id = c.category_id "
                + " where p.[name] like ?");
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
            dto.setName(rs.getString("product_name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));

            dto.setShopName(rs.getString("shop_name"));
            dto.setCategoryName(rs.getString("category_name"));
            list.add(dto);
        }
        return list;
    }

    public ArrayList<ProductDTO> getTOP10ProductByName(String name) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(""
                + " \n"
                + "SELECT  TOP(10)\n"
                + "	   p.[product_id]\n"
                + "      ,p.[shop_id]\n"
                + "	  ,s.shop_name\n"
                + "      ,p.[category_id]\n"
                + "	  ,c.[name] as 'category_name'\n"
                + "      ,p.[user_admin_id] \n"
                + "      ,p.[price]\n"
                + "      ,p.[name] as 'product_name'\n"
                + "      ,p.[description]\n"
                + "      ,p.[quantity]\n"
                + "      ,p.[status]\n"
                + "      ,p.[create_at]\n"
                + "      ,p.[approve_at]\n"
                + "      ,p.[discount]\n"
                + "      ,p.[sold_count]\n"
                + "      ,p.[authen]\n"
                + "  FROM [Product] p JOIN Shop s ON p.shop_id = s.shop_id \n"
                + "  JOIN Category c ON p.category_id = c.category_id  "
                + " where p.[name] like ?");
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
            dto.setName(rs.getString("product_name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));

            dto.setShopName(rs.getString("shop_name"));
            dto.setCategoryName(rs.getString("category_name"));
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
            try {
                dto.setMainImg(imageProductDAO.getMainImageByProductID(productID));
            } catch (Exception e) { 
            }

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
        PreparedStatement stm = conn.prepareStatement(""
                + "SELECT p.[product_id]\n"
                + "      ,p.[shop_id]\n"
                + "	  ,s.shop_name\n"
                + "      ,p.[category_id]\n"
                + "	  ,c.[name] as 'category_name'\n"
                + "      ,p.[user_admin_id] \n"
                + "      ,p.[price]\n"
                + "      ,p.[name] as 'product_name'\n"
                + "      ,p.[description]\n"
                + "      ,p.[quantity]\n"
                + "      ,p.[status]\n"
                + "      ,p.[create_at]\n"
                + "      ,p.[approve_at]\n"
                + "      ,p.[discount]\n"
                + "      ,p.[sold_count]\n"
                + "      ,p.[authen]\n"
                + "  FROM [Product] p JOIN Shop s ON p.shop_id = s.shop_id \n"
                + "  JOIN Category c ON p.category_id = c.category_id"
                + " where p.product_id = ?");
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
            dto.setName(rs.getString("product_name"));
            dto.setDescription(rs.getString("description"));
            dto.setQuanity(rs.getInt("quantity"));
            dto.setStatus(rs.getBoolean("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));

            dto.setShopName(rs.getString("shop_name"));
            dto.setCategoryName(rs.getString("category_name"));
<<<<<<< Updated upstream
            dto.setMainImg(imgDao.getMainImageByProductID(rs.getInt("product_id")));
            
=======
            dto.setMainImg(imgDao.getMainImageByProductID(dto.getProductID()));
            System.out.println(dto.getMainImg().getUrl());
>>>>>>> Stashed changes
            dto.setImgs(imgDao.getAllImagesIsNotMain(id));
            
        }
        return dto;
    }

<<<<<<< Updated upstream
    @Override
    public void save(ProductDTO t) {
        try {
            PreparedStatement stm = conn.prepareStatement("INSERT INTO Product (shop_id, category_id, user_admin_id, price, name, description, quantity, status, create_at, approve_at, discount, sold_count, authen) \n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, null, 0, 1);");
            stm.setInt(1, t.getShopID());
            stm.setInt(2, t.getCategoryID());
            stm.setInt(3, t.getUserAdminID());
            stm.setDouble(4, t.getPrice());
            stm.setString(5, t.getName());
            stm.setString(6, t.getDescription());
            stm.setInt(7, t.getQuanity());
            stm.setBoolean(8, t.isStatus());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            stm.setString(9, dtf.format(now));
            stm.setString(10, dtf.format(now));
=======
//    public ArrayList<ArrayList<ProductDTO>> getAllTOP20BestSellingProductsByCategoryIDs(ArrayList<CategoryDTO> listCate) throws SQLException {
//        ArrayList<ArrayList<ProductDTO>> list = new ArrayList<>();
//        for (CategoryDTO category : listCate) {
//            list.add(getTOP20BestSellingProductsByCategoryID(category.getCategoryID()));
//        }
//        return list;
//    }
//    @Override
//    public ProductDTO get(int id) throws SQLException {
//        PreparedStatement stm = conn.prepareStatement(""
//                + "SELECT p.[product_id]\n"
//                + "      ,p.[shop_id]\n"
//                + "	  ,s.shop_name\n"
//                + "      ,p.[category_id]\n"
//                + "	  ,c.[name] as 'category_name'\n"
//                + "      ,p.[user_admin_id] \n"
//                + "      ,p.[price]\n"
//                + "      ,p.[name] as 'product_name'\n"
//                + "      ,p.[description]\n"
//                + "      ,p.[quantity]\n"
//                + "      ,p.[status]\n"
//                + "      ,p.[create_at]\n"
//                + "      ,p.[approve_at]\n"
//                + "      ,p.[discount]\n"
//                + "      ,p.[sold_count]\n"
//                + "      ,p.[authen]\n"
//                + "  FROM [Product] p JOIN Shop s ON p.shop_id = s.shop_id \n"
//                + "  JOIN Category c ON p.category_id = c.category_id"
//                + " where p.product_id = ?");
//        stm.setInt(1, id);
//        ResultSet rs = stm.executeQuery();
//        ImageProductDAO imgDao = new ImageProductDAO();
//        ProductDTO dto = new ProductDTO();
//        if (rs.next()) {
//            dto.setProductID(rs.getInt("product_id"));
//            dto.setShopID(rs.getInt("shop_id"));
//            dto.setCategoryID(rs.getInt("category_id"));
//            dto.setUserAdminID(rs.getInt("user_admin_id"));
//            dto.setPrice(rs.getDouble("price"));
//            dto.setName(rs.getString("product_name"));
//            dto.setDescription(rs.getString("description"));
//            dto.setQuanity(rs.getInt("quantity"));
//            dto.setStatus(rs.getBoolean("status"));
//            dto.setCreateAt(rs.getDate("create_at"));
//            dto.setApproveAt(rs.getDate("approve_at"));
//            dto.setDiscount(rs.getFloat("discount"));
//            dto.setSoldCount(rs.getInt("sold_count"));
//            dto.setAuthen(rs.getBoolean("authen"));
//
//            dto.setShopName(rs.getString("shop_name"));
//            dto.setCategoryName(rs.getString("category_name"));
//            dto.setMainImg(imgDao.getMainImageByProductID(dto.getProductID()).getUrl());
//
//            dto.setImgs(imgDao.getAllImagesIsNotMain(id));
//
//        }
//        return dto;
//    }
    public int getProductIdNew(ProductDTO productDTO) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(""
                + "SELECT TOP 1  p.[product_id] \n"
                + "FROM [Product] p\n"
                + "WHERE \n"
                + "    p.shop_id = ? \n"
                + "AND p.category_id = ?\n"
                + "ORDER BY p.[product_id] DESC");
        stm.setInt(1, productDTO.getShopID());
        stm.setInt(2, productDTO.getCategoryID());
//        stm.setInt(3, productDTO.getUserAdminID());
        ResultSet rs = stm.executeQuery();
        ImageProductDAO imgDao = new ImageProductDAO();
        ProductDTO dto = new ProductDTO();
        if (rs.next()) {
            return rs.getInt("product_id");
        }
        return -1;
    }

    @Override
    public void save(ProductDTO t) {
        try {
//            PreparedStatement stm = conn.prepareStatement(""
//                    + "INSERT INTO Product ("
//                    + "shop_id, category_id, "
//                    + "price, name, "
//                    + "description, "
//                    + "quantity, status, "
//                    + "create_at, approve_at, "
//                    + "discount, sold_count, "
//                    + "authen) \n"
//                    + "VALUES (?, ?, "
//                    + "?, ?, "
//                    + "?, ?, "
//                    + "?, ?, "
//                    + "null, null, "
//                    + "0, 0);");
//            stm.setInt(1, t.getShopID());
//            stm.setInt(2, t.getCategoryID());
//            stm.setDouble(3, t.getPrice());
//            stm.setString(4, t.getName());
//            stm.setString(5, t.getDescription());
//            stm.setInt(6, t.getQuanity());
//            stm.setBoolean(7, t.isStatus());
//            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
//            LocalDateTime now = LocalDateTime.now();
//            stm.setString(8, dtf.format(now));
////            stm.setString(9, dtf.format(now));

            PreparedStatement stm = conn.prepareStatement(""
                    + "INSERT INTO Product ("
                    + "shop_id, category_id, "
                    + "  price,"
                    + " name, description, "
                    + "quantity, status, "
                    + "create_at, approve_at, "
                    + "discount, sold_count, "
                    + "authen) \n"
                    + "VALUES (?, ?, "
                    + "  ?, "
                    + "?, ?, "
                    + "?, ?, "
                    + "?, null, "
                    + "null, 0, "
                    + "1);");
            int count = 1;
            stm.setInt(count++, t.getShopID());
            stm.setInt(count++, t.getCategoryID());
//            stm.setInt(count++, t.getUserAdminID());
            stm.setDouble(count++, t.getPrice());
            stm.setString(count++, t.getName());
            stm.setString(count++, t.getDescription());
            stm.setInt(count++, t.getQuanity());
            stm.setBoolean(count++, t.isStatus());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            stm.setString(count++, dtf.format(now));
//            stm.setString(10, dtf.format(now));
>>>>>>> Stashed changes
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O SAVE:" + e);
        }

    }

    @Override
    public void update(ProductDTO t) throws SQLException {
        try {

            PreparedStatement stm = conn.prepareStatement("update Product set price= ? ,name=?,description=?,quantity=?,discount=?, status=? where product_id = ?");
            System.err.println(stm.toString());
            stm.setDouble(1, t.getPrice());
            stm.setString(2, t.getName());
            stm.setString(3, t.getDescription());
            stm.setInt(4, t.getQuanity());
            stm.setDouble(5, t.getDiscount());
            stm.setBoolean(6, t.isStatus());
            stm.setDouble(7, t.getProductID());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }

    @Override
    public void delete(ProductDTO t) throws SQLException {
        try {

            PreparedStatement stm = conn.prepareStatement("delete from Product where product_id = '149'");
            System.err.println(stm.toString());
            stm.setDouble(1, t.getProductID());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O delete:" + e);
        }
    }

//    public static void main(String[] args) {
//        try {
//            ProductDAO dao = new ProductDAO();
//            CategoryDAO cdao = new CategoryDAO();
//            ArrayList<CategoryDTO> lt = cdao.getAll();
////            ProductDTO dtoa = dao.get(449);
////            System.out.println(dtoa);
//
//            dao.getTOP20BestSellingProductsByCategoryID(2).forEach(System.out::println);
//            ArrayList<ArrayList<ProductDTO>> lsit = dao.getAllTOP20BestSellingProductsByCategoryIDs(lt);
//
//            for (ArrayList<ProductDTO> productDTO : lsit) {
//                System.out.println(productDTO.toString());
//            }
//            ProductDTO temp = lsit.get(1).get(0);
//            temp.setName("Test Add Function1");
//            temp.setShopID(6);
//            temp.setProductID(8);
//            temp.setUserAdminID(68);
//            System.err.println("day này------------------------------:" + temp);
//           
//
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class
//                    .getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    public int getProductIdNew(ProductDTO productDTO) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(""
                + "SELECT TOP 1  p.[product_id] \n"
                + "FROM [Product] p\n"
                + "WHERE \n"
                + "    p.shop_id = ? \n"
                + "AND p.category_id = ?\n"
                + "AND p.user_admin_id = ?\n"
                + "ORDER BY p.[product_id] DESC");
        stm.setInt(1, productDTO.getShopID());
        stm.setInt(2, productDTO.getCategoryID());
        stm.setInt(3, productDTO.getUserAdminID());
        ResultSet rs = stm.executeQuery();
        ImageProductDAO imgDao = new ImageProductDAO();
        ProductDTO dto = new ProductDTO();
        if (rs.next()) {
            return rs.getInt("product_id");
        }
        return -1;
    }

}
