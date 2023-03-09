/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import Core.SendMailv2;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.shop.ShopDAO;
import com.team1.ecommerceplatformm.shop.ShopDTO;
import com.team1.ecommerceplatformm.user.UserDTO;
import com.team1.ecommerceplatformm.utils.Constrants;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author boyvi
 */
@WebServlet(name = "ShopController", urlPatterns = {"/ShopController"})
public class ShopController extends HttpServlet {

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
        String shopAction = request.getParameter("shopAction");
        System.out.println("vào shop controller");
        switch (shopAction) {
            case "register": {
                System.out.println("vào shop controller case register  ");
                request.getRequestDispatcher(Constrants.SHOW_REGISTER_SHOP_PAGE).forward(request, response);
                break;
            }
            case "show": {
                try {
                    System.out.println("show");
                    int shopId = Integer.parseInt(request.getParameter("shopID"));
                    ProductDAO pDao = new ProductDAO();
                    ShopDAO sDao = new ShopDAO();
                    ShopDTO sDTO = sDao.get(shopId);
                    ArrayList<ProductDTO> list = pDao.getAllProductByShopId(shopId);
                    ShopDTO s2 = sDao.getShopQuantities(shopId);
                    ShopDTO s3 = sDao.getAvatar(shopId);
                    for (ProductDTO productDTO : list) {
                        System.out.println("dasd" + productDTO);
                    }
                    request.setAttribute("listProductsShop", list);
                    request.setAttribute("shop", sDTO);
                    request.setAttribute("total", s2.getTotal());
                    request.setAttribute("avatar", s3.getAvatar());
                    request.getRequestDispatcher(Constrants.SHOW_STORE_PAGE).forward(request, response);
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("redect") != null) {
            try {
                UserDTO userDTO = (UserDTO) request.getSession().getAttribute("user");
                ShopDTO shopDTO = new ShopDTO();
                shopDTO.setShopName(request.getParameter("shopName"));
                shopDTO.setUserID(userDTO.getUserID());
                new ShopDAO().save(shopDTO);
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
            System.err.println("Save Shop !");
            response.sendRedirect("MainController");
        } else {
            processRequest(request, response);
        }

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
        try {
            new SendMailv2(Constrants.URL_LOCALHOST + "EcommercePlatformm/ShopController?redect=1&shopName=" + request.getParameter("shopName")).StartSendMail(request.getParameter("gmail"), "confirm", "autocontent", Constrants.EMAIL_TK, Constrants.EMAIL_MK);
        } catch (Exception e) {
            System.err.println(e);
        }
        response.sendRedirect("MainController");
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
