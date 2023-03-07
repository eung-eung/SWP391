package com.team1.ecommerceplatformm.controller;

import com.google.gson.Gson;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.utils.Constants;
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
        String url = "";
        url = Constants.DASHBOARD;
        ArrayList<ProductDTO> list = null;
        try {
            list = new ProductDAO().getTop10ProductByShopId(1);
            for (ProductDTO productDTO : list) {
                System.out.println("dtoaaaa: " + productDTO);

            }
            Gson gson = new Gson();
            String json = gson.toJson(list);
            System.out.println(json);
            response.getWriter().println(json);
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
        }

//        list.get(0).getSoldCount()
//        request.setAttribute("listjson", json);
//        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
