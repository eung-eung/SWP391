/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.gson.Gson;
import com.team1.ecommerceplatformm.category.CategoryDAO;
import com.team1.ecommerceplatformm.category.CategoryDTO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.shop.ShopDAO;
import com.team1.ecommerceplatformm.shop.ShopDTO;
import com.team1.ecommerceplatformm.user.UserDTO;
import com.team1.ecommerceplatformm.utils.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "ShopController", urlPatterns = {"/ShopController"})
public class ShopController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String shopAction = request.getParameter("shopAction");
        System.out.println("vào shop controller");
        int a = 0;
        Gson gson = new Gson();
        switch (shopAction) {
            case "register": {
                System.out.println("vào shop controller case register  ");
                request.getRequestDispatcher(Constants.SHOW_REGISTER_SHOP_PAGE).forward(request, response);
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
                    request.getRequestDispatcher(Constants.SHOW_STORE_PAGE).forward(request, response);
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            case "currentTotal": {
                try {
                    
                    int userId = Integer.parseInt(request.getParameter("userId"));
                    ShopDAO shopDao = new ShopDAO();
                    ShopDTO shopDto = shopDao.getByUserID(userId);
                    int shopId = shopDto.getShopID();
                    shopDto = shopDao.getShopQuantities(shopId);
                    System.out.println("aaaa");
                    response.getWriter().println(gson.toJson(shopDto.getTotal()));
                    
                    break;
                } catch (SQLException ex) {
                    
                    Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            case "getTotalSoldCount": {
                try {
                    ProductDAO proDao = new ProductDAO();
                    int userId = Integer.parseInt(request.getParameter("userId"));
                    ShopDAO shopDao = new ShopDAO();
                    ShopDTO shopDto = shopDao.getByUserID(userId);
                    int shopId = shopDto.getShopID();
                    int soldCount = proDao.getTotalSoldCount(shopId);
                    
                    response.getWriter().println(gson.toJson(soldCount));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            case "getTotalRevenue": {
                try {
                    ShopDAO shopDao = new ShopDAO();
                    int userId = Integer.parseInt(request.getParameter("userId"));
                    ShopDTO shopDto = shopDao.getByUserID(userId);
                    int shopId = shopDto.getShopID();
                    double totalRevenue = shopDao.getTotalRevenue(shopId);
                    response.getWriter().println(gson.toJson(totalRevenue));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
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
            UserDTO userDTO = (UserDTO) request.getSession().getAttribute("user");
            ShopDTO shopDTO = new ShopDTO();
            shopDTO.setShopName(request.getParameter("shopName"));
            shopDTO.setUserID(userDTO.getUserID());

            // xử lý ảnh
            byte[] img = null;
//            System.out.println(shopDTO.getShopName());
            List<Part> fileParts = (List<Part>) request.getParts();
            // lấy tất cả ảnh trả về từ giao diện
            FileInputStream serviceAccount;
            FirebaseOptions options;
            FirebaseApp firebaseApp = null;
            InputStream fileContent = null;
            FirebaseDatabase database = null;
            DatabaseReference rootRef = null;
            DatabaseReference studentsRef = null;
            boolean imgCount = true;
            for (Part filePart : fileParts) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null) {

                    // Xử lý ảnh tại đây
                    fileContent = filePart.getInputStream();
                    img = IOUtils.readFully(fileContent, fileContent.available());

                    try {
                        serviceAccount = new FileInputStream(Constants.URLFIREBASE);
                        options = new FirebaseOptions.Builder()
                                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                                .setDatabaseUrl(Constants.URLFIREBASE_URL)
                                .setStorageBucket("demo1")
                                .build();
                        firebaseApp = FirebaseApp.initializeApp(options);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    String encodedString = Base64.getEncoder().encodeToString(img);
                    String url = "data:image/png;base64," + encodedString;
                    if (imgCount) {
                        shopDTO.setFrontIdentity(url);
                    } else {
                        shopDTO.setBackIdentity(url);
                    }
                    database = FirebaseDatabase.getInstance(Constants.URLFIREBASE_URL);
                    rootRef = database.getReference("mynode");
                    studentsRef = rootRef.child(shopDTO.getShopName() + "");
                   
                    studentsRef.setValue(url, new DatabaseReference.CompletionListener() {
                        @Override
                        public void onComplete(DatabaseError databaseError, DatabaseReference databaseReference) {
                            if (databaseError != null) {
                                System.out.println("Data luu that bai" + databaseError.getMessage());
                            } else {
                                System.out.println("Data Luu thanh cong"); 
                            }
                        }
                    });
                    imgCount = false;
                } 
            }
             new ShopDAO().save(shopDTO);

//                new ShopDAO().save(shopDTO);
        } catch (Exception e) {
            System.err.println("Loi :  " + e.getMessage());
        }
        System.err.println("Save Shop !");
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
