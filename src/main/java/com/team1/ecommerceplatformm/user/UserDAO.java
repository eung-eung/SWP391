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
                + "      ,[username]\n"
                + "  FROM [User]");
        ResultSet rs = stm.executeQuery();
        ArrayList<UserDTO> list = new ArrayList<>();
        while (rs.next()) {
            UserDTO u = new UserDTO();
            u.setUserID(rs.getInt("user_id"));
            u.setWardID(rs.getString("ward_id"));
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
            u.setUsername(rs.getString("username"));
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
    public UserDTO insertNewUser(String email, String imageUrl, String username) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("INSERT into [User]( [role_id] ,[email]  ,[avatar],[username])"
                + " values (?,?,?,?)");

        stm.setInt(1, 2);
        stm.setString(2, email);
        stm.setString(3, imageUrl);
        stm.setString(4, username);
        stm.executeUpdate();

        UserDTO dto = new UserDTO();
        dto.setAvatarUrl(imageUrl);
        dto.setEmail(email);
        dto.setUsername(username);

        stm.close();
        return dto;

    }

    public void updateProfile(String email, String username, String phone, String avatarURL) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("update [User]\n"
                + "  set phone = ?,username=?, avatar=? where email = ?");
        stm.setString(1, phone);
        stm.setString(2, username);
        stm.setString(3, avatarURL);
        stm.setString(4, email);
        stm.executeUpdate();
        stm.close();
    }

    public void updateWardAndAddress(String email, String wardID, String address) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("update [User]\n"
                + "  set ward_id = ?,address=? where email = ?");
        stm.setString(1, wardID);
        stm.setString(2, address);
        stm.setString(3, email);
        stm.executeUpdate();
        stm.close();
    }

    public static void main(String[] args) throws SQLException {
//        UserDAO udao = new UserDAO();
//        try {
//            udao.getAll().forEach(System.out::println);
//            udao.updateProfile("test", "test update dao", "113", "eqwerqwer");
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }

    }

    @Override
    public UserDTO get(int id) throws SQLException {
         PreparedStatement stm = conn.prepareStatement("SELECT "
                + "[user_id]\n"
                + "      ,[ward_id]\n"
                + "      ,[role_id]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[yob]\n"
                + "      ,[address]\n"
                + "      ,[avatar]\n"
                + "      ,[username]\n"
                + "  FROM [User]"
                 + " where [user_id] = ?");
         stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        UserDTO u = new UserDTO();
         if(rs.next()) {
            u.setUserID(rs.getInt("user_id"));
            u.setWardID(rs.getString("ward_id"));
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
            u.setUsername(rs.getString("username"));
           
        }
        rs.close();
        stm.close();
        return u;
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

//    public static void main(String[] args) throws SQLException {
//        UserDAO dao = new UserDAO();
//        dao.insertNewUser("adasd", "asdasdasd",
//                "saas");
//    }
}
