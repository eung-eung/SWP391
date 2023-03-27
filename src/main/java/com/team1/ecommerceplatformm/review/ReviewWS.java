/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.team1.ecommerceplatformm.review;

import com.google.gson.Gson;
import com.team1.ecommerceplatformm.orderDetails.OrderDetailsDAO;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author boyvi
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
class ReviewRequestDTO {

    private int reviewId;
    private int userId;
    private int productId;
    private String comment;
    private int rating;
    private int orderId;
    private Date createAt;
    private boolean status;

    public ReviewDTO map() {
        ReviewDTO review = new ReviewDTO();
        review.setUserId(userId);
        review.setProductId(productId);
        review.setComment(comment);
        review.setRating(rating);
        review.setReviewId(reviewId);
        review.setCreateAt(new Date());
        review.setOrderId(orderId);
        
//        review.setCreateAt();

        return review;
    }
}

@ServerEndpoint("/review/{productId}")
public class ReviewWS {

    private static final Map<Integer, Set<Session>> rooms = new ConcurrentHashMap<>();
    private static final Gson gson = new Gson();
    private static final ReviewDAO reviewDAO = new ReviewDAO();

    @OnOpen
    public void onOpen(Session session, @PathParam("productId") int roomId) {
        System.out.println("roomId: " + roomId);
        System.out.println("connection id: " + session.getId());
        rooms.computeIfAbsent(roomId, k -> ConcurrentHashMap.newKeySet()).add(session);

    }

    @OnClose
    public void onClose(Session session, @PathParam("productId") int roomId) {
        Set<Session> sessions = rooms.get(roomId);
        System.out.println("Close");
        if (sessions != null) {
            sessions.remove(session);
            if (sessions.isEmpty()) {
                rooms.remove(roomId);
            }
        }
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("productId") int roomId) throws IOException, EncodeException, SQLException {

        ReviewRequestDTO dto = gson.fromJson(message, ReviewRequestDTO.class);
        if (dto.getUserId() == 0) {
            return;
        }

//        int productId = Integer.parseInt(roomId);
        dto.setProductId(roomId);
        System.out.println("dto:" + dto);
        ReviewDTO review = dto.map();
        System.out.println("review" + review);
        reviewDAO.save(review);
//        System.out.println("session id");
//        if (review.getReviewId() == -1) {
//            reviewDAO.save(review);
//        } else {
//            reviewDAO.update(review);
//        }
        Set<Session> onlineUsers = rooms.get(roomId);
        if (onlineUsers != null) {
            for (Session s : onlineUsers) {
                s.getBasicRemote().sendText(gson.toJson(review));
            }
        }
    }

    @OnError
    public void onError(Session session, Throwable t) {
        t.printStackTrace();
    }
}
