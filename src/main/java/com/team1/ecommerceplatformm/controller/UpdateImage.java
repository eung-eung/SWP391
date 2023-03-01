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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;

 
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "UpdateImage", urlPatterns = {"/UpdateImage"})
public class UpdateImage  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        byte[] img = null;
        jakarta.servlet.http.Part filePart = request.getPart("img_item");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        InputStream fileContent = filePart.getInputStream();
        img = IOUtils.readFully(fileContent, fileContent.available());
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
        String child__image_ID = request.getParameter("imageid");
        String encodedString = Base64.getEncoder().encodeToString(img);
        String url = "data:image/png;base64," + encodedString;
        System.err.println("Pre data:"+child__image_ID+","+url);
       
        
        FirebaseDatabase database = FirebaseDatabase.getInstance(Constants.URLFIREBASE_URL);
        DatabaseReference rootRef = database.getReference("mynode");
        DatabaseReference studentsRef = rootRef.child(child__image_ID);
        studentsRef.setValue(url, new DatabaseReference.CompletionListener() {
            @Override
            public void onComplete(DatabaseError databaseError, DatabaseReference databaseReference) {
                if (databaseError != null) {
                    System.out.println("Data luu that bai" + databaseError.getMessage());
                } else {
                    System.out.println("Data Luu thanh cong");
                    ImageProductDTO imgtemp = new ImageProductDTO();
                    imgtemp.setImageID(Integer.parseInt(child__image_ID) );
                    imgtemp.setUrl(url);
                    System.err.println("Data update ql:"+imgtemp.toString());
                    try {
                        new ImageProductDAO().update(imgtemp);
                    } catch (SQLException ex) {
                        Logger.getLogger(UpdateImage.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        });
        if (request.getParameter("idProduct") != null) {
            resp.sendRedirect("UpdateProduct?productid="+request.getParameter("idProduct"));
        }else{
             resp.sendRedirect("UploadImageFirebase");
        }
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    
}
