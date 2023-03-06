package com.team1.ecommerceplatformm.controller;

import com.google.gson.Gson;
import com.team1.ecommerceplatformm.product.ProductByMonth;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.product.Top10bybenefit;
import com.team1.ecommerceplatformm.product.benefitbymonth;
import com.team1.ecommerceplatformm.shop.ShopDAO;
import com.team1.ecommerceplatformm.shop.ShopDTO;
import com.team1.ecommerceplatformm.user.UserDAO;
import com.team1.ecommerceplatformm.user.UserDTO;
import com.team1.ecommerceplatformm.utils.Constrants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "Dashboard", urlPatterns = {"/Dashboard"})
public class Dashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        if(request.getParameter("top10benefit") != null){
            String url = "";
            url = Constrants.DASHBOARD;
            ArrayList<Top10bybenefit> list = null;
            try {
                UserDTO user = (UserDTO) request.getSession().getAttribute("user");
                ShopDTO crshop = new ShopDAO().getByUserID(user.getUserID());
                list = new ProductDAO().Top10benefit(crshop.getShopID());
                for (Top10bybenefit item : list) {
                    System.out.println(item.toString());
                }
                Gson gson = new Gson();
                String json = gson.toJson(list);
                System.out.println(json);
                response.getWriter().println(json);
            } catch (SQLException ex) {
                Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if(request.getParameter("totalbymonth") != null){
            String url = "";
            url = Constrants.DASHBOARD;
            ArrayList<benefitbymonth> list = null;
            try {
                UserDTO user = (UserDTO) request.getSession().getAttribute("user");
                ShopDTO crshop = new ShopDAO().getByUserID(user.getUserID());
                list = new ProductDAO().getBenefitbymonth(crshop.getShopID());
                for (benefitbymonth item : list) {
                    System.out.println(item.toString());
                }
                Gson gson = new Gson();
                String json = gson.toJson(list);
                System.out.println(json);
                response.getWriter().println(json);
            } catch (SQLException ex) {
                Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if (request.getParameter("bymonth") != null) {
            String url = "";
            url = Constrants.DASHBOARD;
            ArrayList<ProductByMonth> list = null;
            try {
                UserDTO user = (UserDTO) request.getSession().getAttribute("user");
                ShopDTO crshop = new ShopDAO().getByUserID(user.getUserID());
                list = new ProductDAO().getProductbymonth(crshop.getShopID());
                for (ProductByMonth item : list) {
                    System.out.println(item.toString());
                }
                Gson gson = new Gson();
                String json = gson.toJson(list);
                System.out.println(json);
                response.getWriter().println(json);
            } catch (SQLException ex) {
                Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            String url = "";
            url = Constrants.DASHBOARD;
            ArrayList<ProductDTO> list = null;
            try {
                UserDTO user = (UserDTO) request.getSession().getAttribute("user");
                ShopDTO crshop = new ShopDAO().getByUserID(user.getUserID());
                list = new ProductDAO().getTop10ProductByShopId(crshop.getShopID());
                for (ProductDTO productDTO : list) {
                    System.out.println(productDTO.toString());
                }
                Gson gson = new Gson();
                String json = gson.toJson(list);
                System.out.println(json);
                response.getWriter().println(json);
            } catch (SQLException ex) {
                Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

//        list.get(0).getSoldCount()
//        request.setAttribute("listjson", json);
//        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
