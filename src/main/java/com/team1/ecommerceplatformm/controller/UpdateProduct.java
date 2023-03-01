package com.team1.ecommerceplatformm.controller;


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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductDAO se = new ProductDAO();
        ProductDTO temp = null;
        try {
            temp = se.get(Integer.parseInt(req.getParameter("productid")));
            temp.setPrice(Double.parseDouble(req.getParameter("price")));
            temp.setName(req.getParameter("pName"));
            temp.setDescription(req.getParameter("description"));
            temp.setQuanity(Integer.parseInt(req.getParameter("quantity")));
            temp.setDiscount(Float.parseFloat(req.getParameter("discount")));
            se.update(temp);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        resp.sendRedirect("ProductManagerController");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ProductDTO temp = new ProductDTO();
            temp = new ProductDAO().get(Integer.parseInt(req.getParameter("productid")));
            
            req.setAttribute("product", temp);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.err.println(req.getParameter("productid"));
        req.getRequestDispatcher(Constants.UPDATE_PRODUCT).forward(req, resp);
    }

}
