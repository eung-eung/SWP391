/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.category;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author boyvi
 */
public class CategoryDAO extends AbstractDAO<CategoryDTO> {

    @Override
    public ArrayList<CategoryDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [category_id]\n"
                + "      ,[name]\n"
                + "      ,[icon]\n"
                + "        ,[banner],[bannerVertical]"
                + "  FROM [EcommmercePlatform].[dbo].[Category]");
        ResultSet rs = stm.executeQuery();
        ArrayList<CategoryDTO> list = new ArrayList<>();
        while (rs.next()) {
            CategoryDTO dto = new CategoryDTO();
            dto.setName(rs.getString("name"));
            dto.setIcon(rs.getString("icon"));
            dto.setBanner(rs.getString("banner"));
            dto.setBannerVertical(rs.getString("bannerVertical"));
            dto.setCategoryID(rs.getInt("category_id"));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    public ArrayList<CategoryDTO> getTop5CategoriesByTotalSoldCount() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("  select top(5) sum(sold_count), \n"
                + "                 c.name, p.category_id, c.banner\n"
                + "                 from Product p right join Category c on p.category_id = c.category_id  \n"
                + "                 group by  c.icon, c.name, p.category_id,c.banner  order by sum(sold_count)  desc");

        ResultSet rs = stm.executeQuery();
        ArrayList<CategoryDTO> list = new ArrayList<>();
        while (rs.next()) {
            CategoryDTO dto = new CategoryDTO();
            dto.setName(rs.getString(2));
            dto.setCategoryID(rs.getInt(3));
            dto.setBanner(rs.getString(4));
            list.add(dto);
        }
        rs.close();
        stm.close();
        return list;
    }

    @Override
    public void save(CategoryDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(CategoryDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(CategoryDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        try {
            CategoryDAO dao = new CategoryDAO();
            ArrayList<CategoryDTO> list = new ArrayList<>();
            list = dao.getTop5CategoriesByTotalSoldCount();
            System.out.println(list);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public CategoryDTO get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
