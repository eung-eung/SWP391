<%-- 
    Document   : registerShopPage
    Created on : Feb 24, 2023, 7:17:36 AM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/userDetailPage.css" />" />   
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/registerShopPage.css" />" />
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="main-body">
            <div class="container">
                <div class="form">
                    <h2>Đăng ký trở thành cửa hàng của chúng tôi</h2>
                    <form id="resgis" action="./ShopController" method="post"></form>
                    <div class="register-items">
                        <div class="register-item">
                            <label for="shopName">Tên cửa hàng <i class="fa-solid fa-store"></i></label>
                        </div>
                        <div class="register-item">
                            <input form="resgis" required name="shopName"  id="shopName" type="text"/>
                        </div>
                    </div>
                    <div class="register-items">
                        <div class="register-item">
                            <label for="gmail">Gmail cửa hàng <i class="fa-solid fa-store"></i></label>
                        </div>
                        <div class="register-item">
                            <input form="resgis" required name="gmail"  id="gmail" type="text"/>
                        </div>
                    </div>



                    <div class="register-items">

                        <button form="resgis" type="submit" id="submit">Lưu</button>
                    </div>
                </div>
            </div>

        </div> 
    </body>
</html>
