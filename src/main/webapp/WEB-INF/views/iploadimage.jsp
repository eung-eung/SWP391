 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <select form="imgupload" name="productid">
            <c:forEach items="${listproduct}" var="item">
                <option value="${item.getProductID()}">IDProduct:${item.getProductID()}-NameProduct:${item.getName()}</option>
            </c:forEach>
        </select>
        <form id="imgupload" action="./UploadImageFirebase" method="post" enctype="multipart/form-data" ></form>
        <input class="btn btn-success" form="imgupload"  class="m-t-30" type="file"  accept="image/*" name="img_item" id="file"  onchange="loadFile(event)" style="display: block;">
        <input class="btn btn-secondary"  name="upload_img" value="Upload Image" type="submit" form="imgupload" />
        <img form="imgupload"  id="output" width="200" />
        <a href="./UploadImageFirebase?data=1">Get Data</a>


        <table style="font-size: 12px" border="1">
            <thead>
                <tr>
                    <th>Image ID</th>
                    <th>Product ID</th>
                    <th>URL ID</th>
                    <th>Update</th>
                     <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listimage}" var="item">
                    <tr>
                        <td >${item.getImageID()}</td>
                        <td><input form="form${item.getImageID()}" type="text" value="${item.getProductID()}" name="productid"></td>
                        <td><img src="${item.getUrl()}" alt="alt" style="max-height: 240px;max-width: 240px;"> </td>
                        <td><form id="form${item.getImageID()}" action="./UpdateImage" method="post" enctype="multipart/form-data" ></form>
                            <input hidden="true" form="form${item.getImageID()}" type="text" value="${item.getImageID()}" name="imageid">
                            <input class="btn btn-success" form="form${item.getImageID()}"  class="m-t-30" type="file"  accept="image/*" name="img_item" id="file"  onchange="loadFile(event)" style="display: block;">
                            <input class="btn btn-secondary"  name="upload_img" value="Update Image" type="submit" form="form${item.getImageID()}" />
                        </td>
                        <td><a href="./DeleteImage?ImageID=${item.getImageID()}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
