package com.team1.ecommerceplatformm.controller;


import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDTO;
import com.team1.ecommerceplatformm.product.ProductDAO;
import com.team1.ecommerceplatformm.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "UploadImageFirebase", urlPatterns = {"/UploadImageFirebase"})
public class UploadImageFirebase extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        byte[] img = null;
        jakarta.servlet.http.Part filePart = request.getPart("img_item");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        InputStream fileContent = filePart.getInputStream();
        img = IOUtils.readFully(fileContent, fileContent.available());
//TEST AREA
        FileInputStream serviceAccount;
        FirebaseOptions options;
        FirebaseApp firebaseApp = null;
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

        //
        String child__Product_ID = request.getParameter("productid");
        String encodedString = Base64.getEncoder().encodeToString(img);
        String url = "data:image/png;base64," + encodedString;
        System.err.println("Pre data:" + child__Product_ID + "," + url);
        //

        FirebaseDatabase database = FirebaseDatabase.getInstance(Constants.URLFIREBASE_URL);
        DatabaseReference rootRef = database.getReference("mynode");
        DatabaseReference studentsRef = rootRef.child(child__Product_ID);
        studentsRef.setValue(url, new DatabaseReference.CompletionListener() {
            @Override
            public void onComplete(DatabaseError databaseError, DatabaseReference databaseReference) {
                if (databaseError != null) {
                    System.out.println("Data luu that bai" + databaseError.getMessage());
                } else {
                    System.out.println("Data Luu thanh cong");
                    ImageProductDTO imgtemp = new ImageProductDTO();
                    imgtemp.setProductID(Integer.parseInt(child__Product_ID));
                    imgtemp.setMainImage(false);
                    imgtemp.setUrl(url);
                    System.err.println("Data saves ql:" + imgtemp.toString());
                    new ImageProductDAO().save(imgtemp);
                }
            }
        });

        resp.sendRedirect("UpdateProduct?productid=" + request.getParameter("productid"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("data") != null) {
            FileInputStream serviceAccount;
            FirebaseOptions options;
            FirebaseApp firebaseApp = null;
            try {
                serviceAccount = new FileInputStream(Constants.URLFIREBASE);
                options = new FirebaseOptions.Builder()
                        .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                        .setDatabaseUrl(Constants.URLFIREBASE_URL)
                        .setStorageBucket("demo1")
                        .build();
                firebaseApp = FirebaseApp.initializeApp(options);
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
            FirebaseDatabase database = FirebaseDatabase.getInstance(Constants.URLFIREBASE_URL);
            DatabaseReference rootRef = database.getReference("mynode");
            DatabaseReference dataRef = rootRef.child("students 2");
            dataRef.addListenerForSingleValueEvent(new ValueEventListener() {
                @Override
                public void onDataChange(DataSnapshot dataSnapshot) {
                    String value = dataSnapshot.getValue(String.class);
                    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Data retrieved: " + value);
                }

                @Override
                public void onCancelled(DatabaseError databaseError) {
                    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Read operation cancelled: " + databaseError.getMessage());
                }
            });
            return;
        }
        String url = "";
        url = Constants.UPLOAD_IMAGE;
        try {
            request.setAttribute("listimage", new ImageProductDAO().getAll());
//            new ImageProductDAO().getAll().get(0).getUrl()
        } catch (SQLException ex) {
            Logger.getLogger(UploadImageFirebase.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            request.setAttribute("listproduct", new ProductDAO().getAll());
//            new ProductDAO().getAll().get(0).ge
        } catch (SQLException ex) {
            Logger.getLogger(UploadImageFirebase.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    public class User {

        public String username;
        public String email;

        public User() {
            // Default constructor required for calls to DataSnapshot.getValue(User.class)
        }

        public User(String username, String email) {
            this.username = username;
            this.email = email;
        }
    }
}
