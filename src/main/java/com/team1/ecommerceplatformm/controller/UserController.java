/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import com.google.gson.Gson;
import com.team1.ecommerceplatformm.order.OrderDAO;
import com.team1.ecommerceplatformm.order.OrderDTO;
import com.team1.ecommerceplatformm.user.UserDAO;
import com.team1.ecommerceplatformm.user.UserDTO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.team1.ecommerceplatformm.utils.Constants;
import java.util.ArrayList;

/**
 *
 * @author boyvi
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

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
        String userAction = request.getParameter("userAction");
        HttpSession session = request.getSession();
        UserDAO uDAO = new UserDAO();
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String url = "";
        try {
            if (userAction == null) {
                throw new IllegalArgumentException("\"action\" parameter is missing");

            }
            switch (userAction) {
                case "login": {
                    String email = request.getParameter("email");

                    if (email == null || email.isEmpty()) {
                        throw new IllegalArgumentException("\"email\" parameter is missing");
                    } else {
                        UserDTO user = uDAO.login(email);
                        if (user == null) {
                            //
                            String avatarURL = request.getParameter("picture");
                            String username = request.getParameter("username");
                            user = uDAO.insertNewUser(email, avatarURL, username);

                        }
                        System.out.println("luu session");
                        System.out.println(user);
                        session.setAttribute("user", user);
                        out.println(gson.toJson(user));
                    }

                    break;
                }
                case "logout": {
                    System.out.println("đã xóa session");
                    session.removeAttribute("user");
                    response.sendRedirect(Constants.MAIN_CONTROLLER);
                    break;
                }
                case "profile": {
                    request.getRequestDispatcher(Constants.SHOW_USER_PROFILE_PAGE).forward(request, response);
                    break;
                }
                case "updateProfile": {
                    String username = request.getParameter("username");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String urlAvatar = request.getParameter("urlAvatar").replace("/avatar/", "%2Favatar%2F");
                    System.out.println("username" + username);
                    System.out.println("phone" + phone);
                    System.out.println("email" + email);
                    System.out.println("urlAvatar" + urlAvatar);
                    uDAO.updateProfile(email, username, phone, urlAvatar);
                    UserDTO u = (UserDTO) session.getAttribute("user");
                    u.setPhone(phone);
                    u.setUsername(username);
                    u.setAvatarUrl(urlAvatar);

                    session.setAttribute("user", u);
                    break;
                }
                case "transaction": {
                    System.out.println("vào trans");
                    UserDTO u = (UserDTO) session.getAttribute("user");
                    OrderDAO dao = new OrderDAO();
                    ArrayList<OrderDTO> list = dao.getAllOrdersByUserId(u.getUserID());
                    request.setAttribute("histories", list);

                    request.getRequestDispatcher(Constants.SHOW_TRANSACTION_HISTORY_PAGE).forward(request, response);
                    break;
                }
                
            }

        } catch (IllegalArgumentException ex) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
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
