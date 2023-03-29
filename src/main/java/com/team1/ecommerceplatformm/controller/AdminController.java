/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.team1.ecommerceplatformm.category.CategoryDAO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.shop.ShopDAO;
import com.team1.ecommerceplatformm.shop.ShopDTO;
import com.team1.ecommerceplatformm.user.UserDAO;
import com.team1.ecommerceplatformm.utils.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author boyvi
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

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
        String adminAction = request.getParameter("adminAction");
        switch (adminAction) {
            case "show": {
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
                break;
            }
            case "render": {
                try {
                    ShopDAO shopDao = new ShopDAO();
                    ProductDAO proDao = new ProductDAO();

                    List<ShopDTO> listShop = new ArrayList<>();
//                    ArrayList<ProductDTO> listProduct = new ArrayList<>();
                    listShop = shopDao.getAllShopHasAccepted();

                    for (ShopDTO shop : listShop) {
                        List<ProductDTO> listProduct = proDao.getAllProductByShopIdWithoutImage(shop.getShopID());
                        shop.setListProducts((ArrayList<ProductDTO>) listProduct);
                    }
                    Gson gson = new Gson();

                    response.getWriter().println(gson.toJson(listShop));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            case "dashboard": {
                try {
                    CategoryDAO cateDao = new CategoryDAO();
                    ProductDAO proDao = new ProductDAO();
                    UserDAO userDao = new UserDAO();

                    ArrayList<String> listName = new ArrayList<>();
                    ArrayList<Integer> listCount = new ArrayList<>();
                    ArrayList<Integer> listUser = new ArrayList<>();
                    ArrayList<String> listNameOfUser = new ArrayList<>();
                    listNameOfUser.add("Buyer");
                    listNameOfUser.add("Seller");
                    listNameOfUser.add("Admin");
                    ArrayList<String> listMonth = new ArrayList<>();
                    listMonth.add("January");
                    listMonth.add("February");
                    listMonth.add("March");
                    listMonth.add("April");
                    listMonth.add("May");
                    listMonth.add("June");
                    listMonth.add("July");
                    listMonth.add("August");
                    listMonth.add("September");
                    listMonth.add("October");
                    listMonth.add("November");
                    listMonth.add("December");
                    ArrayList<Integer> listCountByMonth = new ArrayList<>();

                    listName = cateDao.getNameOfCategory();
                    listCount = proDao.getCountByCategory();
                    listUser = userDao.getCountOfUser();
                    listCountByMonth = proDao.getCountByCreateDay();
                    Gson gson = new Gson();

                    JsonObject jsonObject = new JsonObject();
                    jsonObject.add("listName", gson.toJsonTree(listName));

                    JsonArray jsonArrayCount = new JsonArray();
                    for (int i = 0; i < listCount.size(); i++) {
                        jsonArrayCount.add(new JsonPrimitive(listCount.get(i)));
                    }
                    jsonObject.add("listCount", jsonArrayCount);

                    JsonArray jsonArrayUser = new JsonArray();
                    for (int i = 0; i < listUser.size(); i++) {
                        jsonArrayUser.add(new JsonPrimitive(listUser.get(i)));
                    }
                    jsonObject.add("listUser", jsonArrayUser);

                    JsonArray jsonArrayNameOfUser = new JsonArray();
                    for (String name : listNameOfUser) {
                        jsonArrayNameOfUser.add(new JsonPrimitive(name));
                    }
                    jsonObject.add("listNameOfUser", jsonArrayNameOfUser);

                    // Add listMonth to jsonObject
                    JsonArray jsonArrayMonth = new JsonArray();
                    for (String month : listMonth) {
                        jsonArrayMonth.add(new JsonPrimitive(month));
                    }
                    jsonObject.add("listMonth", jsonArrayMonth);

//                  Add listCountByMonth to jsonObject
                    JsonArray jsonArrayCountByMonth = new JsonArray();
                    for (int count : listCountByMonth) {
                        jsonArrayCountByMonth.add(new JsonPrimitive(count));
                    }
                    jsonObject.add("listCountByMonth", jsonArrayCountByMonth);

                    response.setContentType("application/json");
                    response.getWriter().println(jsonObject.toString());

                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            }
            case "updateBanShop" : {
                try{
                    int shopid = Integer.parseInt(request.getParameter("shopID"));
                
                ShopDAO shopDao = new ShopDAO();
                ProductDAO proDao = new ProductDAO();
                
                shopDao.updateBanShopStatus(shopid);
                proDao.updateBanProductStatusByShop(shopid);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
                break;
            }
            case "updateUnBanShop" : {
                try{
                    int shopid = Integer.parseInt(request.getParameter("shopID"));
                
                ShopDAO shopDao = new ShopDAO();
                ProductDAO proDao = new ProductDAO();
                
                shopDao.updateUnBanShopStatus(shopid);
                
                proDao.updateUnbanProductStatusByShop(shopid);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
                break;
            }
            case "updateBanProduct" : {
                try{
                    int productId = Integer.parseInt(request.getParameter("productId"));
                
                ProductDAO proDao = new ProductDAO();
                
                
                proDao.updateBanProductStatus(productId);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
                break;
            }
             case "updateUnBanProduct" : {
                try{
                    int productId = Integer.parseInt(request.getParameter("productId"));
                
                ProductDAO proDao = new ProductDAO();
                
                
                proDao.updateUnbanProductStatus(productId);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
                break;
            }
            
             case  "authenProduct":{
                 try{
                    ProductDAO proDao = new ProductDAO();
                    ArrayList<ProductDTO> listProduct = new ArrayList<>();
                    listProduct= proDao.getProductAuthen();
                    
                    Gson gson = new Gson();

                    response.getWriter().println(gson.toJson(listProduct));
                 }catch(SQLException ex){
                     Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                 }
                 
                 
             }
             case "approveProduct":{
                 try{
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    int userId = Integer.parseInt(request.getParameter("userId"));
                
                ProductDAO proDao = new ProductDAO();
                
                long millis=System.currentTimeMillis(); 
                java.sql.Date date = new java.sql.Date(millis); 
                proDao.updateAcceptProductAuthen(userId, date, productId);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
//chua biet thay link kieu giiiiii
                break;
             }
             case "rejectProduct":{
                 try{
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    int userId = Integer.parseInt(request.getParameter("userId"));
                
                ProductDAO proDao = new ProductDAO();
                
                long millis=System.currentTimeMillis(); 
                java.sql.Date date = new java.sql.Date(millis); 
                proDao.updateRejectProductAuthen(userId, date, productId);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);

                break;
             }
             case "authenShop" :{
                 
                
                try {
                    ShopDAO shopDao = new ShopDAO();
                    ArrayList<ShopDTO> listShop = new ArrayList<>();
                    listShop = shopDao.getAllShopRegister();
                    
                    Gson gson = new Gson();

                    response.getWriter().println(gson.toJson(listShop));
                    
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
             }

             case "approveShop":{
                 try{
                    int shopId = Integer.parseInt(request.getParameter("shopId"));
                
                ShopDAO shopDao = new ShopDAO();
                
                shopDao.updateAcceptShopStatus(shopId);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
//chua biet thay link kieu giiiiii
                break;
             }
             
             case "rejectShop":{
                 try{
                    int shopId = Integer.parseInt(request.getParameter("shopId"));
                    
                ShopDAO shopDao = new ShopDAO();
                
                shopDao.updateRejectShopStatus(shopId);
                
                }catch (SQLException ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(Constants.ADMIN_PAGE).forward(request, response);
//chua biet thay link kieu giiiiii
                break;
             }
             
            
            
            default:
                throw new AssertionError();
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
