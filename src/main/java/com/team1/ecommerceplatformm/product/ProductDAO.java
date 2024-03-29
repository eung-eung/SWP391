/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.product;

import com.team1.ecommerceplatformm.category.CategoryDAO;
import com.team1.ecommerceplatformm.category.CategoryDTO;
import com.team1.ecommerceplatformm.common.AbstractDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import com.team1.ecommerceplatformm.shop.ShopDAO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where authen = 1 and status = 1");
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
            dto.setStatus(rs.getInt("status"));
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
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where category_id = ? and authen = 1 and status = 1 ");
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
            dto.setStatus(rs.getInt("status"));
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
        PreparedStatement stm = conn.prepareStatement("SELECT TOP (1000) [product_id]\n"
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
                + "      ,[authen]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Product]\n"
                + "  where name like ? and authen = 1 and status = 1");
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
            dto.setStatus(rs.getInt("status"));
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
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where name like ? and authen = 1 and status = 1");
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
            dto.setStatus(rs.getInt("status"));
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
                + "  where p.[shop_id] = ? "
                + "  AND  p.[status] = ? "
                + "  And p.[authen] = 1");
        stm.setInt(1, new ShopDAO().getByUserID(user).getShopID());
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
            dto.setStatus(rs.getInt("status"));
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

    public ArrayList<ArrayList<ProductDTO>> getAllTOP20BestSellingProductsByCategoryIDs(ArrayList<CategoryDTO> listCate) throws SQLException {
        ArrayList<ArrayList<ProductDTO>> list = new ArrayList<>();
        for (CategoryDTO category : listCate) {
            list.add(getTOP20BestSellingProductsByCategoryID(category.getCategoryID()));
        }
        return list;
    }

    public ArrayList<ProductDTO> getAllProductByShopId(int shopId) throws SQLException {
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
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where [shop_id] = ?");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        ImageProductDAO imgDao = new ImageProductDAO();
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
            dto.setStatus(rs.getInt("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
            dto.setMainImg(imgDao.getMainImageByProductID(rs.getInt("product_id")));
            list.add(dto);
        }
        return list;
    }
    
    public ArrayList<ProductDTO> getAllProductByShopIdWithoutImage(int shopId) throws SQLException {
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
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where [shop_id] = ?");
        stm.setInt(1, shopId);
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
            dto.setStatus(rs.getInt("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
            list.add(dto);
        }
        return list;
    }

    public ArrayList<Top10ByBenefit> Top10Benefit(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT \n"
                + "    S.shop_id,\n"
                + "    P.product_id,\n"
                + "	SUM(OD.quantity) AS quatity,\n"
                + "    SUM(OD.quantity * OD.price  ) AS revenue\n"
                + "FROM \n"
                + "    [dbo].[Order] O\n"
                + "    JOIN [dbo].[OrderDetails] OD ON O.order_id = OD.order_id\n"
                + "    JOIN [dbo].[Product] P ON OD.product_id = P.product_id\n"
                + "    JOIN [dbo].[Shop] S ON P.shop_id = S.shop_id\n"
                + "	where s.shop_id = ?\n"
                + "GROUP BY \n"
                + "    S.shop_id,\n"
                + "    P.product_id\n"
                + "Order by\n"
                + "revenue desc");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        ArrayList<Top10ByBenefit> list = new ArrayList<>();
        ProductByMonth pd = new ProductByMonth();
        int count = 1;
        while (rs.next()) {
            if (count == 10) {
                list.add(new Top10ByBenefit(rs.getInt("shop_id"), rs.getInt("product_id"), rs.getInt("quatity"), rs.getInt("revenue"), getNameProduct(rs.getInt("product_id"))));
                return list;
            }
            list.add(new Top10ByBenefit(rs.getInt("shop_id"), rs.getInt("product_id"), rs.getInt("quatity"), rs.getInt("revenue"), getNameProduct(rs.getInt("product_id"))));
            count++;

        }
        return list;
    }

    public ArrayList<ProductDTO> getTop10ProductByShopId(int shopId) throws SQLException {
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
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] where [shop_id] = ? order by sold_count desc");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductDTO> list = new ArrayList<>();
        ImageProductDAO imageProductDAO = new ImageProductDAO();
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
            dto.setStatus(rs.getInt("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));
            list.add(dto);
        }
        return list;
    }

    public ArrayList<BenefitByMonth> getBenefitbymonth(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT \n"
                + "    S.shop_id,\n"
                + "    MONTH(O.order_date) AS month, \n"
                + "	SUM(OD.quantity) AS quatity,\n"
                + "    SUM(OD.quantity * OD.price ) AS revenue\n"
                + "FROM \n"
                + "    [dbo].[Order] O\n"
                + "    JOIN [dbo].[OrderDetails] OD ON O.order_id = OD.order_id\n"
                + "    JOIN [dbo].[Product] P ON OD.product_id = P.product_id\n"
                + "    JOIN [dbo].[Shop] S ON P.shop_id = S.shop_id\n"
                + "	WHERE S.shop_id = ? \n"
                + "GROUP BY \n"
                + "    S.shop_id,\n"
                + "    MONTH(O.order_date)");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        ArrayList<BenefitByMonth> list = new ArrayList<>();
        ProductByMonth pd = new ProductByMonth();
        while (rs.next()) {
            list.add(new BenefitByMonth(rs.getInt("shop_id"), rs.getInt("month"), rs.getInt("quatity"), rs.getInt("revenue")));
        }
        return list;
    }

    public String getNameProduct(int pdid) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("select name from Product where product_id = ? ");
        stm.setInt(1, pdid);
        ResultSet rs = stm.executeQuery();
        rs.next();
        return rs.getString("name");
    }

    public ArrayList<Integer> getCountByCategory() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT COUNT(category_id) as count FROM Product GROUP BY category_id");
        ResultSet rs = stm.executeQuery();
        int count;
        ArrayList<Integer> list = new ArrayList<>();
        while (rs.next()) {
            count = rs.getInt("count");
            list.add(count);
        }
        rs.close();
        stm.close();
        return list;
    }

    public ArrayList<Integer> getCountByCreateDay() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT COUNT( MONTH(create_at)) as count FROM Product\n"
                + "GROUP BY MONTH(create_at)");
        ResultSet rs = stm.executeQuery();
        int count;
        ArrayList<Integer> list = new ArrayList<>();
        while (rs.next()) {
            count = rs.getInt("count");
            list.add(count);
        }
        rs.close();
        stm.close();
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
            dto.setStatus(rs.getInt("status"));
            dto.setCreateAt(rs.getDate("create_at"));
            dto.setApproveAt(rs.getDate("approve_at"));
            dto.setDiscount(rs.getFloat("discount"));
            dto.setSoldCount(rs.getInt("sold_count"));
            dto.setAuthen(rs.getBoolean("authen"));

            dto.setShopName(rs.getString("shop_name"));
            dto.setCategoryName(rs.getString("category_name"));
            dto.setMainImg(imgDao.getMainImageByProductID(dto.getProductID()));
            System.out.println(dto.getMainImg().getUrl());
            dto.setImgs(imgDao.getAllImagesIsNotMain(id));

        }
        return dto;
    }

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
                    + "quantity, "
                    + "create_at, approve_at, "
                    + "discount, sold_count) "
                    //                    + "authen) \n"
                    + "VALUES (?, ?, "
                    + "  ?, "
                    + "?, ?, "
                    + "?, ?, "
                    + " null, "
                    + "null, 0) ");
//                    + "1);");
            int count = 1;
            stm.setInt(count++, t.getShopID());
            stm.setInt(count++, t.getCategoryID());
//            stm.setInt(count++, t.getUserAdminID());
            stm.setDouble(count++, t.getPrice());
            stm.setString(count++, t.getName());
            stm.setString(count++, t.getDescription());
            stm.setInt(count++, t.getQuanity());
//            stm.setBoolean(count++, t.isStatus());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            stm.setString(count++, dtf.format(now));
//            stm.setString(10, dtf.format(now));
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O SAVE:" + e);
        }

    }

    public ArrayList<ProductByMonth> getProductByMonth(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT \n"
                + "    S.shop_id,\n"
                + "    P.product_id,\n"
                + "    YEAR(O.order_date) AS year,\n"
                + "    MONTH(O.order_date) AS month, \n"
                + "	SUM(OD.quantity) AS quatity,\n"
                + "    SUM(OD.quantity * OD.price * (1 - OD.discount)) AS revenue\n"
                + "FROM \n"
                + "    [dbo].[Order] O\n"
                + "    JOIN [dbo].[OrderDetails] OD ON O.order_id = OD.order_id\n"
                + "    JOIN [dbo].[Product] P ON OD.product_id = P.product_id\n"
                + "    JOIN [dbo].[Shop] S ON P.shop_id = S.shop_id\n"
                + "	WHERE S.shop_id = ? \n"
                + "GROUP BY \n"
                + "    S.shop_id,\n"
                + "    P.product_id,\n"
                + "    YEAR(O.order_date),\n"
                + "    MONTH(O.order_date)\n"
                + "ORDER BY \n"
                + "    S.shop_id,\n"
                + "    P.product_id,\n"
                + "    YEAR(O.order_date),\n"
                + "    MONTH(O.order_date)");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        ArrayList<ProductByMonth> list = new ArrayList<>();
        ProductByMonth pd = new ProductByMonth();
        while (rs.next()) {
            list.add(new ProductByMonth(rs.getInt("shop_id"), rs.getInt("product_id"), rs.getInt("year"), rs.getInt("month"), rs.getInt("quatity"), new ProductDAO().getNameProduct(rs.getInt("product_id"))));
        }
        return list;
    }

    public int getTotalSoldCount(int shopId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(" select sum(sold_count) from Product where shop_id = ? ");
        stm.setInt(1, shopId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;

    }

    public void updateBanProductStatusByShop(int shopId) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Product SET [status] = null	WHERE shop_id = ? ");
            stm.setInt(1, shopId);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }

    public void updateUnbanProductStatusByShop(int shopId) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Product SET [status] = 1 WHERE shop_id = ? ");
            stm.setInt(1, shopId);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }

    public void updateBanProductStatus(int productid) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Product SET [status] = 0 WHERE product_id = ? ");
            stm.setInt(1, productid);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }

    public void updateUnbanProductStatus(int productid) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Product SET [status] = 1 WHERE product_id = ? ");
            stm.setInt(1, productid);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }

    public ArrayList<ProductDTO> getProductAuthen() throws SQLException {
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
                + "      ,[authen]   FROM [EcommmercePlatform].[dbo].[Product] WHERE [authen] IS NULL");
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
            dto.setStatus(rs.getInt("status"));
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

    public void updateAcceptProductAuthen(int user_admin_id, Date aprrove_at, int product_id) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Product SET [authen] = 1, [status] = 1, [user_admin_id] = ?, [approve_at] = ?	WHERE [product_id] = ?");
            System.err.println(stm.toString());
            stm.setInt(1, user_admin_id);
            stm.setDate(2, aprrove_at);
            stm.setDouble(3, product_id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O delete:" + e);
        }
    }

    public void updateRejectProductAuthen(int user_admin_id, Date aprrove_at, int product_id) throws SQLException {
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Product SET [authen] = 1, [status] = 0, [user_admin_id] = ?, [approve_at] = ?	WHERE [product_id] = ?");
            System.err.println(stm.toString());
            stm.setInt(1, user_admin_id);
            stm.setDate(2, aprrove_at);
            stm.setDouble(3, product_id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O delete:" + e);
        }
    }

    @Override
    public void update(ProductDTO t) throws SQLException {
        try {

            PreparedStatement stm = conn.prepareStatement("update Product set price= ? ,name=?,description=?,quantity=?,discount=? where product_id = ?");
            System.err.println(stm.toString());
            stm.setDouble(1, t.getPrice());
            stm.setString(2, t.getName());
            stm.setString(3, t.getDescription());
            stm.setInt(4, t.getQuanity());
            stm.setDouble(5, t.getDiscount());
//            stm.setInt(6, t.isStatus());
            stm.setDouble(6, t.getProductID());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }
    // mơ sql server ho e

    @Override
    public void delete(ProductDTO t) throws SQLException {
        try {

            PreparedStatement stm = conn.prepareStatement(""
                    + "UPDATE [Product]\n"
                    + "   SET  [status] = 2\n"
                    + " WHERE product_id = ?");
            System.err.println(stm.toString());
            stm.setDouble(1, t.getProductID());
            stm.executeUpdate();
        } catch (Exception e) {
            System.err.println("LOI NAY O delete:" + e);
        }
    }

    public static void main(String[] args) {
        try {
            ProductDAO dao = new ProductDAO();
            CategoryDAO cdao = new CategoryDAO();
            ArrayList<CategoryDTO> lt = cdao.getAll();
//            ProductDTO dtoa = dao.get(449);
//            System.out.println(dtoa);
            int t = dao.getTotalSoldCount(1);
            ArrayList<ProductDTO> l = dao.getAllProductByName("a");
            for (ProductDTO productDTO : l) {
                System.out.println(productDTO);
            }
            System.out.println("t" + t);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

}
