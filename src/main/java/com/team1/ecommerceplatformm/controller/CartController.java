/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.team1.ecommerceplatformm.order.OrderDAO;
import com.team1.ecommerceplatformm.order.OrderDTO;
import com.team1.ecommerceplatformm.orderDetails.OrderDetailsDTO;
import com.team1.ecommerceplatformm.shop.ShopDAO;
import com.team1.ecommerceplatformm.shop.ShopDTO;
import com.team1.ecommerceplatformm.user.UserDTO;
import com.team1.ecommerceplatformm.utils.Constants;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author boyvi
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cartAction = request.getParameter("cartAction");
        HttpSession session = request.getSession();

        Gson gson = new Gson();
        switch (cartAction) {
            case "view": {
                request.getRequestDispatcher(Constants.SHOW_CART_PAGE).forward(request, response);
                break;

            }

            case "render": {
                try {
                    ShopDAO shopDao = new ShopDAO();

                    int shopID = Integer.parseInt(request.getParameter("shopID"));
                    System.out.println("shopid" + shopID);
                    ShopDTO dto = shopDao.get(shopID);
                    response.getWriter().println(gson.toJson(dto));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            case "orderPaypal": {
                try {
                    int paymentId = 1;
                    UserDTO dto = (UserDTO) session.getAttribute("user");
                    int userId = dto.getUserID();
                    String wardId = dto.getWardID();
                    String address = dto.getAddress();
//                    double transactionFee = Double.parseDouble(request.getParameter("total"));
//                    Map<String, String> m = new HashMap<>();
                    String m = request.getParameter("cart");
                    System.out.println("m " + m);
                    Map<Integer, Integer> map = new HashMap<>();
                    ArrayList<OrderDetailsDTO> listDetail = new ArrayList<>();
                    Type type = new TypeToken<Map<Integer, Integer>>() {
                    }.getType();
                    map = gson.fromJson(m, type);
                    System.out.println("a");
                    map.forEach((k, v) -> {
                        OrderDetailsDTO dDto = new OrderDetailsDTO();
                        dDto.setProductId(k);
                        dDto.setQuantity(v);
                        listDetail.add(dDto);
                        System.out.println("k ="+k +",v= "+ v);
                    });

                    //                    ArrayList<OrderDetailsDTO> l = new ArrayList<>();
                    //                    l = re
//                    System.out.println("fee"+transactionFee);
//                tạo new order
                    OrderDAO orderDAO = new OrderDAO();
                    OrderDTO orderDTO = new OrderDTO();
                    orderDTO.setAddress(address);
                    orderDTO.setWardId(wardId);
//                    orderDTO.setTransactionFee(transactionFee);
                    orderDTO.setUserId(userId);
                    orderDTO.setPaymentId(paymentId);
                    orderDTO.setOrderDetails(listDetail);
                    orderDAO.save(orderDTO);
//                    System.out.println("total: " + transactionFee);

                    System.out.println("Vào order case của cart controller");
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
