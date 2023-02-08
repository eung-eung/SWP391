/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.user;

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
public class UserDAO extends AbstractDAO<UserDTO> {

    @Override
    public ArrayList<UserDTO> getAll() throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT "
                + "[user_id]\n"
                + "      ,[ward_id]\n"
                + "      ,[role_id]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[yob]\n"
                + "      ,[address]\n"
                + "      ,[avatar]\n"
                + "  FROM [User]");
        ResultSet rs = stm.executeQuery();
        ArrayList<UserDTO> list = new ArrayList<>();
        while (rs.next()) {
            UserDTO u = new UserDTO();
            u.setUserID(rs.getInt("user_id"));
            u.setWardID(rs.getInt("ward_id"));
            u.setRoleID(rs.getInt("role_id"));
            u.setEmail(rs.getString("email"));
            String phone = rs.getString("phone");
            if (phone != null) {
                phone = phone.trim();
            }
            u.setPhone(phone);
            u.setYob(rs.getDate("yob"));
            u.setAddress(rs.getString("address"));
            u.setAvatarUrl(rs.getString("avatar"));
            list.add(u);
        }
        rs.close();
        stm.close();
        return list;
    }

    public UserDTO login(String email) throws SQLException {
        return this.getAll().stream().filter(i -> i.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

//    

    public UserDTO insertNewUser(String email, String imageUrl) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("INSERT into [User]( [role_id] ,[email]  ,[avatar])"
                + " values (?,?,?)");

        stm.setInt(1, 2);
        stm.setString(2, email);
        stm.setString(3, imageUrl);
        stm.executeUpdate();

        UserDTO dto = new UserDTO();
        dto.setAvatarUrl(imageUrl);
        dto.setEmail(email);
        return dto;

    }
//    public static void main(String[] args) throws SQLException {
//        UserDAO udao = new UserDAO();
//        try {
//            udao.getAll().forEach(System.out::println);
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }

    @Override
    public Optional<UserDTO> get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void save(UserDTO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(UserDTO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(UserDTO t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        try {
            UserDAO dao = new UserDAO();
            dao.insertNewUser("adasd", "asdasdasd");
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
