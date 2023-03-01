package com.team1.ecommerceplatformm.controller;


import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDAO;
import com.team1.ecommerceplatformm.imageProduct.ImageProductDTO;
import com.team1.ecommerceplatformm.utils.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

 
@WebServlet(name = "DeleteImage", urlPatterns = {"/DeleteImage"})
public class DeleteImage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        FirebaseDatabase database = FirebaseDatabase.getInstance(Constants.URLFIREBASE_URL);
        DatabaseReference rootRef = database.getReference("mynode");
        DatabaseReference dataRef = rootRef.child(req.getParameter("ImageID"));
        // Call the removeValue() method to remove the child.
        dataRef.removeValue(new DatabaseReference.CompletionListener() {
            @Override
            public void onComplete(DatabaseError error, DatabaseReference ref) {
                if (error != null) {
                    System.out.println("Error removing value: " + error.getMessage());
                } else {
                    System.out.println("Value removed successfully.");
                }
            }
        });
        
        ImageProductDTO imgtemp = new ImageProductDTO();
        imgtemp.setImageID(Integer.parseInt(req.getParameter("ImageID")));  
        try {
            new ImageProductDAO().delete(imgtemp);
            System.err.println("Data delete ql:" + imgtemp.toString());
        } catch (SQLException ex) {
            Logger.getLogger(UpdateImage.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (req.getParameter("idProduct") != null) {
          resp.sendRedirect("UpdateProduct?productid="+req.getParameter("idProduct"));
        }else{
             resp.sendRedirect("UploadImageFirebase");
        }
       
    }

}
