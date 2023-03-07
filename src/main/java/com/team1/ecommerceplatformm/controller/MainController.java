/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import com.team1.ecommerceplatformm.category.CategoryDAO;
import com.team1.ecommerceplatformm.category.CategoryDTO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.utils.Constants;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
//import com.twilio.Twilio;
//import com.twilio.rest.api.v2010.
//import com.twilio.type.p
        /**
 *
 * @author boyvi
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

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
        String btnAction = request.getParameter("btnAction");
        HttpSession session = request.getSession();
        ProductDAO proDAO = new ProductDAO();
        String url = "";
        try {
            if (btnAction == null) {
                CategoryDAO cateDAO = new CategoryDAO();
                ArrayList<CategoryDTO> listCategory = new ArrayList<>();
                ArrayList<CategoryDTO> listPopularCatetory = new ArrayList<>();
                listCategory = cateDAO.getAll();

                listPopularCatetory = cateDAO.getTop5CategoriesByTotalSoldCount();

                ArrayList<CategoryDTO> listCategoryHaveNoVerticalBanner = cateDAO.getAll();

                listCategoryHaveNoVerticalBanner.removeIf(cate -> cate.getBannerVertical() == null);
                request.setAttribute("listPopularCatetory", listPopularCatetory);
                session.setAttribute("listCategory", listCategory);
                request.setAttribute("listCategoryHaveNoVerticalBanner", listCategoryHaveNoVerticalBanner);
                request.setAttribute("listTop20ProductsHaveBannerVertical",
                        proDAO.getAllTOP20BestSellingProductsByCategoryIDs(listCategoryHaveNoVerticalBanner));
                url = Constants.HOME_PAGE;
            } else {
                switch (btnAction) {
                    case "user": {
                        url = Constants.USER_CONTROLLER;
                        break;
                    }
                    case "product": {
                        System.out.println("vào case product main");
                        url = Constants.PRODUCT_CONTROLLER;
                        break;
                    }
                    case "search": {
                        System.out.println("vao case search");
                        url = Constants.SEARCH_CONTROLLER;
                        break;
                    }
                    case "searchAjax": {
                        System.out.println("vào case searchAjax main");
                        url = Constants.SEARCH_AJAX_CONTROLLER;
                        break;
                    }
                    case "cart": {
                        System.out.println("vào add cart main");
                        url = Constants.CART_CONTROLLER;
                        break;
                    }
                    case "address": {
                        System.out.println("vào address main");
                        url = Constants.ADDRESS_CONTROLLER;
                        break;
                    }
                    case "shop": {
                        System.out.println("vào shop controlller main");
                        url = Constants.SHOP_CONTROLLER;
                        break;
                    }
                    case "manageProduct": {
                        url = Constants.PRODUCT_MANAGER_CONTROLLER;
                        break;
                    }
                    case "admin": {
                        System.out.println("vào showtable");
                        url = Constants.ADMIN_CONTROLLER;
                        break;
                    }
                    case "dashboard": {
//                        System.out.println("vào showtable");
                        url = Constants.DASHBOARD_CONTROLLER;
                        break;
                    }
//                    case "renderTable": {
//                        url = Constants.ADMIN_CONTROLLER;
//                        break;
//                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println(url);
        request.getRequestDispatcher(url).forward(request, response);

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
