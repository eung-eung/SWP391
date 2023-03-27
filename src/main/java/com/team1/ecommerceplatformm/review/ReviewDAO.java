/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.review;

import com.team1.ecommerceplatformm.common.AbstractDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author boyvi
 */
public class ReviewDAO extends AbstractDAO<ReviewDTO> {

    @Override
    public ArrayList<ReviewDTO> getAll() throws SQLException {
         PreparedStatement stm = conn.prepareStatement("SELECT [review_id],[rating],[comment],[user_id],[order_id],[product_id],[status],[create_at] FROM Review");
        ResultSet rs = stm.executeQuery();
        ArrayList<ReviewDTO> reviewList = new ArrayList<>();

        while (rs.next()) {
            ReviewDTO review = new ReviewDTO();
            int reviewId = rs.getInt("review_id");
            review.setReviewId(reviewId);
            review.setRating(rs.getInt("rating"));
            review.setComment(rs.getString("comment"));
            review.setUserId(rs.getInt("user_id"));
            review.setOrderId(rs.getInt("order_id"));
            review.setCreateAt(rs.getDate("create_at"));
            review.setProductId(rs.getInt("product_id"));
            review.setStatus(rs.getBoolean("status"));

            reviewList.add(review);
        }
        return reviewList;
    }

    @Override
    public ReviewDTO get(int id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<ReviewDTO> getAll(int productId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("SELECT [review_id]\n"
                + "      ,[rating]\n"
                + "      ,[comment]\n"
                + "      ,[user_id]\n"
                + "      ,[order_id]\n"
                + "      ,[create_at]\n"
                + "  FROM [EcommmercePlatform].[dbo].[Review]\n"
                + "  where product_id = ?\n");
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        ArrayList<ReviewDTO> reviewList = new ArrayList<>();

        while (rs.next()) {
            ReviewDTO review = new ReviewDTO();
            int reviewId = rs.getInt("review_id");
            review.setReviewId(reviewId);
            review.setRating(rs.getInt("rating"));
            review.setComment(rs.getString("comment"));
            review.setUserId(rs.getInt("user_id"));
            review.setOrderId(rs.getInt("order_id"));
            review.setCreateAt(rs.getDate("create_at"));
            review.setProductId(productId);

            reviewList.add(review);
        }
        return reviewList;
    }

    @Override
    public void save(ReviewDTO t) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(
                "INSERT INTO [dbo].[Review]\n"
                + "           ([rating]\n"
                + "           ,[comment]\n"
                + "           ,[user_id]\n"
                + "           ,[order_id]\n"
                + "           ,[product_id]\n"
                + "           ,[create_at]\n"
                + "           ,[status]\n)"
                + " VALUES "
                + "(?, ? , ?, ?, ?, ?,?) "
        );
        int paramCount = 1;
        stm.setInt(paramCount++, t.getRating());
        stm.setString(paramCount++, t.getComment());
        stm.setInt(paramCount++, t.getUserId());
        stm.setInt(paramCount++, t.getOrderId());
        stm.setInt(paramCount++, t.getProductId());
        stm.setDate(paramCount++, new java.sql.Date(t.getCreateAt().getTime()));
        stm.setBoolean(paramCount++, true);
        ResultSet rs = stm.executeQuery();

    }

    public void updateHideReview(int review_id) throws SQLException{
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Review SET [status] = 0 WHERE [review_id] = ? ");
            stm.setInt(1, review_id);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }
    
    public void updateUnhideReview(int review_id) throws SQLException{
        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE Review SET [status] = 1 WHERE [review_id] = ? ");
            stm.setInt(1, review_id);
            stm.executeUpdate();
            stm.close();
            conn.close();
        } catch (Exception e) {
            System.err.println("LOI NAY O Update:" + e);
        }
    }
    
    @Override
    public void update(ReviewDTO t) throws SQLException {
        PreparedStatement stm = conn.prepareStatement(
                "UPDATE [dbo].[Review]\n"
                + "           set [rating] = ? \n"
                + "           ,[comment] = ? \n"
                + "where [review_id] = ?"
        );
        int paramCount = 1;
        stm.setInt(paramCount++, t.getRating());
        stm.setString(paramCount++, t.getComment());
        stm.setInt(paramCount++, t.getReviewId());

    }

    public boolean isReviewed(int orderId, int productId) throws SQLException {
        PreparedStatement stm = conn.prepareStatement("select [review_id]\n"
                + "      ,[rating]\n"
                + "      ,[comment]\n"
                + "      ,[user_id]\n"
                + "      ,[order_id]\n"
                + "      ,[product_id]\n"
                + "      ,[status]\n"
                + "      ,[create_at] from Review where order_id = ? and product_id = ?");
        stm.setInt(1, orderId);
        stm.setInt(2, productId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return true;
        }
        return false;
    }

    @Override
    public void delete(ReviewDTO t) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) throws SQLException {
        ReviewDAO dao = new ReviewDAO();
        boolean a =dao.isReviewed(2,149);
        System.out.println(a);
    }
}
