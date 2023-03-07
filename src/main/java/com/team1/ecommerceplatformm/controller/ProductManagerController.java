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
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDTO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.product.ProductDTO;
import com.team1.ecommerceplatformm.shop.ShopDAO;
import com.team1.ecommerceplatformm.shop.ShopDTO;
import com.team1.ecommerceplatformm.user.UserDAO;
import com.team1.ecommerceplatformm.user.UserDTO;
import com.team1.ecommerceplatformm.utils.Constants;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "ProductManagerController", urlPatterns = {"/ProductManagerController"})
public class ProductManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //require userid ? 
        String url = "";
        url = Constants.MANAGE_PRODUCT;
         // ngoại lệ với test ko sài gg đc vì local khác nhau
        if (request.getParameter("userid") != null) {
            try {
                UserDTO udto;
                udto = (new UserDAO()).get(Integer.parseInt(request.getParameter("userid")));
                request.getSession().setAttribute("user", udto);
            } catch (SQLException ex) {
                Logger.getLogger(ProductManagerController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("MainController");
        } else {
            List<ShopDTO> listShop = null;
            try {
                listShop = new ShopDAO().getAll();
            } catch (SQLException ex) {
                Logger.getLogger(ProductManagerController.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.err.println(listShop.size());
            request.setAttribute("listShop", listShop);
            UserDTO user = (UserDTO) request.getSession().getAttribute("user");
            ShopDTO crshop = null;
            try {

                crshop = new ShopDAO().getByUserID(user.getUserID());
//                crshop = new ShopDAO().getByUserID(Integer.parseInt(request.getParameter("userid")));
            } catch (SQLException ex) {
                Logger.getLogger(ProductManagerController.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<CategoryDTO> listcate = null;
            try {
                listcate = new CategoryDAO().getAll();
            } catch (SQLException ex) {
                Logger.getLogger(ProductManagerController.class.getName()).log(Level.SEVERE, null, ex);
            }
            ArrayList<ProductDTO> listProduct = null;
            try {
                listProduct = new ProductDAO().getAllByIdUser(user.getUserID(), 1);
            } catch (SQLException ex) {
                Logger.getLogger(ProductManagerController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("shop", crshop);
            request.setAttribute("listcate", listcate);
            request.setAttribute("prolist", listProduct);
            request.setAttribute("userId", crshop.getUserID());

            System.err.println(crshop.toString());
            System.err.println(listcate.toString());
            System.err.println(listProduct.size());
//        listProduct.get(0).getName()
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String shopId = request.getParameter("shop_id");
        String categoryId = request.getParameter("category_id");
        String price = request.getParameter("price");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        String user = request.getParameter("userId");
        ProductDTO temp = new ProductDTO();
        temp.setShopID(Integer.parseInt(shopId));
        temp.setCategoryID(Integer.parseInt(categoryId));
//        temp.setUserAdminID(Integer.parseInt(user));
        temp.setPrice(Double.parseDouble(price));
        temp.setName(name);
        temp.setStatus(true);
        temp.setDescription(description);
        temp.setQuanity(Integer.parseInt(quantity));
        System.out.println(temp.toString());
        new ProductDAO().save(temp);

        try {
            int pId = new ProductDAO().getProductIdNew(temp);

            // xử lý ảnh
            byte[] img = null;

            // ảnh chính
            String mainImage = null;
            // ảnh phụ 
            List<String> Images = new ArrayList<>();
            List<Part> fileParts = (List<Part>) request.getParts();
            // lấy tất cả ảnh trả về từ giao diện
            FileInputStream serviceAccount;
            FirebaseOptions options;
            FirebaseApp firebaseApp = null;
            InputStream fileContent = null;
            FirebaseDatabase database = null;
            DatabaseReference rootRef = null;
            DatabaseReference studentsRef = null;
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

                    database = FirebaseDatabase.getInstance(Constants.URLFIREBASE_URL);
                    rootRef = database.getReference("mynode");
                    studentsRef = rootRef.child(pId + "");
                    ImageProductDTO imgtemp = new ImageProductDTO();
                    imgtemp.setMainImage(false);
                    if (mainImage == null) {
                        mainImage = fileName;
                        imgtemp.setMainImage(true);
                    }
                    studentsRef.setValue(url, new DatabaseReference.CompletionListener() {
                        @Override
                        public void onComplete(DatabaseError databaseError, DatabaseReference databaseReference) {
                            if (databaseError != null) {
                                System.out.println("Data luu that bai" + databaseError.getMessage());
                            } else {
                                System.out.println("Data Luu thanh cong");

                                imgtemp.setProductID(pId);

                                imgtemp.setUrl(url);
                                System.err.println("Data saves ql:" + imgtemp.toString());
                                new ImageProductDAO().save(imgtemp);
                            }
                        }
                    });

                }

            }
        } catch (Exception ex) {
            Logger.getLogger(ProductManagerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("ProductManagerController?userid=" + user);
    }

}
