/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.team1.ecommerceplatformm.controller;

import com.google.gson.Gson;
import com.team1.ecommerceplatformm.city.CityDAO;
import com.team1.ecommerceplatformm.city.CityDTO;
import com.team1.ecommerceplatformm.district.DistrictDAO;
import com.team1.ecommerceplatformm.district.DistrictDTO;
import com.team1.ecommerceplatformm.user.UserDAO;
import com.team1.ecommerceplatformm.user.UserDTO;
import com.team1.ecommerceplatformm.ward.WardDAO;
import com.team1.ecommerceplatformm.ward.WardDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author boyvi
 */
@WebServlet(name = "AddressController", urlPatterns = {"/AddressController"})
public class AddressController extends HttpServlet {

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
        String addressAction = request.getParameter("addressAction");
        System.out.println("vào address controller");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        switch (addressAction) {
            case "ward": {
                try {
                    String districtID = request.getParameter("districtID");
                    WardDAO wardDao = new WardDAO();
                    List<WardDTO> wardList = wardDao.getWardByID(districtID);
                    out.println(gson.toJson(wardList));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            case "district": {
                try {
                    System.out.println("vào case district address controller");
                    String cityID = request.getParameter("cityID");
                    DistrictDAO disDao = new DistrictDAO();
                    List<DistrictDTO> disList = disDao.getDistrictByCityID(cityID);
                    out.println(gson.toJson(disList));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            case "city": {
                try {
                    CityDAO cityDao = new CityDAO();
                    List<CityDTO> cityList = cityDao.getAll();
                    out.println(gson.toJson(cityList));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            case "getDistrict": {
                try {
                    System.out.println("vào get district");
                    String districtID = request.getParameter("districtID");
                    DistrictDAO dao = new DistrictDAO();
                    DistrictDTO dto = dao.getADistrictByDistrictID(districtID);
                    System.out.println("dto: " + dto);
                    out.println(gson.toJson(dto));

                    break;
                } catch (Exception ex) {
//                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                    ex.printStackTrace();

                }
            }
            case "getWard": {
                try {
                    System.out.println("vào get district");
                    String wardID = request.getParameter("wardID");
                    WardDAO dao = new WardDAO();
                    WardDTO dto = dao.getAWardByWardID(wardID);
                    out.println(gson.toJson(dto));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            case "getCity": {
                try {
                    System.out.println("vào get city");
                    String cityID = request.getParameter("cityID");
                    CityDAO dao = new CityDAO();
                    CityDTO dto = dao.getCityByID(cityID);
                    out.println(gson.toJson(dto));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            case "update": {
                try {
                    String wardID = request.getParameter("wardID");
                    System.out.println("wardID" + wardID);

                    String address = request.getParameter("address");
                    System.out.println("add" + address);
                    HttpSession session = request.getSession();
                    UserDTO dto = (UserDTO) session.getAttribute("user");
                    System.out.println("ss addressL " + dto);
                    UserDAO dao = new UserDAO();
                    dao.updateWardAndAddress(dto.getEmail(), wardID, address);
                    dto.setWardID(wardID);
                    dto.setAddress(address);
                    session.setAttribute("user", dto);
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            case "getCityByWardName": {
                try {
                    WardDAO wDao = new WardDAO();
                    DistrictDAO dDao = new DistrictDAO();
                    CityDAO cDao = new CityDAO();
                    String wardName = request.getParameter("wardName");
                    ArrayList<WardDTO> wardList = wDao.getListWardByName(wardName);
                    ArrayList<DistrictDTO> districtList = new ArrayList<>();
                    
                    System.out.println("wardList"+ wardList);
                    ArrayList<CityDTO> cityList = new ArrayList<>();
                    for (WardDTO wardDTO : wardList) {
                        DistrictDTO districtDto = new DistrictDTO();
                        districtDto = dDao.getADistrictByDistrictID(wardDTO.getDistrictID());
                        districtList.add(districtDto);
                    }
                     System.out.println("districtList"+ districtList);
                    for (DistrictDTO districtDto : districtList) {
                        CityDTO cityDto = new CityDTO();
                        cityDto = cDao.getCityByID(districtDto.getCityID());
                        cityList.add(cityDto);
                    }
                      System.out.println("cityList"+ cityList);
                    out.println(gson.toJson(cityList));
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(AddressController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }


        }
        System.out.println("vào addresscontroller");
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
