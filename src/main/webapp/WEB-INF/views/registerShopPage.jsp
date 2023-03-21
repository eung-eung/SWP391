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
                    <form action="./ShopController" method="post" enctype="multipart/form-data">
                         
                        <div class="register-items">
                            <div class="register-item">
                                <label for="shopName1">Tên cửa hàng <i class="fa-solid fa-store"></i></label>
                            </div>
                            <div class="register-item">
                                <input required name="shopName" id="shopName1" type="text"/>
                            </div>
                        </div>
                        <div class="register-items">
                            <div class="register-item">
                                <label for="gmail1">Gmail cửa hàng<i class="fa-solid fa-store"></i></label>
                            </div>
                            <div class="register-item">
                                <input required name="gmail" id="gmail1" type="text"/>
                            </div>
                        </div>
                        <div class="register-items">
                            <div class="form-group">
                                <label  for="mainImage">Chứng minh nhân dân mặt trước</label>
                                <input  type="file" required accept="image/*" multiple name="cmndmt_img_item" id="file"  onchange="loadFile(event, 1)" style="display: block;">
                                <div class="output" id="output1"></div>
                            </div> 
                        </div>                         

                        <div class="register-items">
                            <div class="form-group">
                                <label for="mainImage">Chứng minh nhân dân mặt sau</label>
                                <input type="file" required accept="image/*" multiple name="cmndms_img_item" id="file"  onchange="loadFile(event, 2)" style="display: block;">
                                <div class="output" id="output2"></div>
                            </div> 
                        </div> 
                        <div class="register-items">

                            <button form="resgis" type="submit">Lưu</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>  
    </body>
    <script>
        function loadFile(event, s) {
            var output = document.getElementById('output' + s);
            output.innerHTML = '';
            // Lặp qua từng file ảnh được chọn
            for (var i = 0; i < event.target.files.length; i++) {
                // Đọc file ảnh
                var file = event.target.files[i];
                var reader = new FileReader();
                // Khi đọc file thành công
                reader.onload = function () {
                    // Tạo một đối tượng Image mới
                    var img = new Image();
                    // Gán giá trị thuộc tính src cho đối tượng Image
                    img.src = reader.result;
                    // Thêm đối tượng Image vào trang web
                    output.appendChild(img);
                }

                // Đọc file ảnh dưới dạng URL
                reader.readAsDataURL(file);
            }
        }
    </script>
</html>
