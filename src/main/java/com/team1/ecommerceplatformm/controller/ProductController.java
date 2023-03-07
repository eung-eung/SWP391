/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import com.google.gson.Gson;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDTO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.utils.Constants;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author boyvi
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

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
        ProductDAO productDao = new ProductDAO();
        ImageProductDAO imageDao = new ImageProductDAO();
        String productAction = request.getParameter("productAction");
        String sort = request.getParameter("orderBy");
        System.out.println(productAction);
        boolean isForward = false;
        String url = "";
        Gson gson = new Gson();
        try {
            switch (productAction) {
                case "showByCateID": {
                    System.out.println("vào r");
                    int category_id = Integer.parseInt(request.getParameter("categoryID"));
                    ArrayList<ProductDTO> productListByCateID = new ArrayList<>();
                    ArrayList<ImageProductDTO> imageList = new ArrayList<>();
                    productListByCateID = productDao.getAllProductByCategoryID(category_id);
                    imageList = imageDao.getAllMainImages();
                    request.setAttribute("imageList", imageList);
                    request.setAttribute("productListByCateID", productListByCateID);
                    isForward = true;
                    url = Constants.SHOW_PRODUCT_PAGE;
                    
                    switch(sort){
                        case "asc" :
                            Collections.sort(productListByCateID, Comparator.comparing(ProductDTO::getPrice));
                            break;
                        case "desc" :
                            Collections.sort(productListByCateID, Comparator.comparing(ProductDTO::getPrice).reversed());
                            break;
                    }
                    break;
                }
                case "showDetail": {
                    int productID = Integer.parseInt(request.getParameter("productID"));
                    ArrayList<ImageProductDTO> listImgs = imageDao.getAllMainImages();
                    ArrayList<ImageProductDTO> listNotMainImg = imageDao.getAllImagesIsNotMain(productID);
                    ProductDTO pro = productDao.get(productID);
                    System.out.println("aaaaaaaaaaaa" + pro);
                    request.setAttribute("listNotMainImg", listNotMainImg);
                    request.setAttribute("listImgs", listImgs);
                    request.setAttribute("productDetail", pro);
                    isForward = true;
                    url = Constants.SHOW_PRODUCT_DETAIL_PAGE;
                    break;
                }
//                case "showName": {
//                    int productID = Integer.parseInt(request.getParameter("productID"));
//                    ProductDTO pro = productDao.get(productID);
//                    response.getWriter().println(gson.toJson(pro));
//                    break;
//                }
                case "showQuantity": {
                    int productID = Integer.parseInt(request.getParameter("productID"));
                    ProductDTO pro = productDao.get(productID);
                    System.out.println("aaaaaaaa" + pro.getQuanity());
                    response.getWriter().println(gson.toJson(pro.getQuanity()));
                    break;
                }
                case "showSameCategoryProduct": {
                    int categoryId = Integer.parseInt(request.getParameter("categoryID"));
                    ArrayList<ProductDTO> list20 = productDao.getTOP20BestSellingProductsByCategoryID(categoryId);
                    response.getWriter().println(gson.toJson(list20));
                    break;
                    
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if (isForward) {
            request.getRequestDispatcher(url).forward(request, response);
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
