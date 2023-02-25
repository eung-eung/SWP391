

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/ManagerProduct.css" />" />

        <style>
            img{
                width: 200px;
                height: 120px;
            }
            .output {
                display: flex;
                flex-wrap: wrap;
                max-width: 500px;
            }

            .output img {
                width: 100px;
                height: 100px;
                margin: 5px;
                object-fit: cover;
            }
        </style>
        <script>
            function back() {
                window.location.href = "home";
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "delete?pid=" + id;
                }
            }
        </script>
        <style>
            .limited-textarea {
                width: 100%
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>STT</th> 
<<<<<<< Updated upstream
                            <th>Shop Name</th>
=======
                            <th hidden>Shop Name</th>
>>>>>>> Stashed changes
                            <th>Category Name</th> 
                            <th>Price</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Created At</th> 
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" begin="1" end="${prolist.size()}" step="1" varStatus="loop">
                            <tr>
                                <td>${loop.index}</td>
                                <td hidden>${prolist[loop.index - 1].getProductID()}</td>
<<<<<<< Updated upstream
                                <td>${prolist[loop.index - 1].getShopName()}</td>
=======
                                <td hidden>${prolist[loop.index - 1].getShopName()}</td>
>>>>>>> Stashed changes
                                <td>${prolist[loop.index - 1].getCategoryName()}</td> 
                                <td><fmt:formatNumber type="currency" value="${prolist[loop.index - 1].getPrice()}" currencySymbol="VND"/></td>
                                <td>
                                    ${prolist[loop.index - 1].getName()}
                                </td>
                                <td>
                                    <textarea readonly class="limited-textarea" form="form${prolist[loop.index - 1].getProductID()}"  name="Description" rows="4" cols="50">${prolist[loop.index - 1].getDescription()}</textarea> 
                                </td>
                                <td>${prolist[loop.index - 1].getQuanity()}</td>
                                <td>${prolist[loop.index - 1].getCreateAt()}</td> 
                                <td>
                                   <a style="padding: 14px;background-color: greenyellow; text-decoration: none;color: white;border-radius: 4px" 
                                       href="./UpdateProduct?productid=${prolist[loop.index - 1].getProductID()}">Update</a>
                                 </td>
                                <td>
                                    <a style="padding: 14px;background-color: red; text-decoration: none;color: white;border-radius: 4px" 
                                       href="./DeleteProduct?productid=${prolist[loop.index - 1].getProductID()}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!--                <div class="clearfix">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="manager?page=${page-1}">Previous</a></li>
                <c:forEach begin="1" end="${totalPage}" var="i">
                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="manager?page=${i}">${i}</a></li>
                </c:forEach>
            <li class="page-item"><a class="page-link" href="manager?page=${page+1}">Next</a></li>
        </ul>
    </div>-->
            </div>
            <a href="#">
                <!--<button type="button" class="btn btn-primary" onclick="back()">Back to home</button>-->

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="addProductForm" action="./ProductManagerController?userId=${userId}" method="POST" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                            <input type="text" hidden name="shop_id" value="${shop.getShopID()}"  readonly>

                            <div class="form-group">
                                <label for="shop_id">Shop: ${shop.getShopName()}</label>
                            </div>
                            <div class="form-group">
                                <label for="category_id">Category :</label>
                                <select name="category_id" id="category_id" class="form-select">
                                    <c:forEach items="${listcate}" var="category">
                                        <option value="${category.getCategoryID()}" >${category.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">Price:</label>
                                <input type="number" id="price" name="price"  class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <textarea id="name" name="name" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="description">Description:</label>
                                <textarea id="description" name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity"  class="form-control" required>
                            </div> 
                            <div class="form-group">
                                <label for="mainImage">Main Image:</label>
                                <input type="file" required accept="image/*" name="main_img_item" id="file"  onchange="loadFile(event, 1)" style="display: block;">
                                <div class="output" id="output1"></div>
                            </div>   
                            <div class="form-group">
                                <label for="mainImage">Image:</label>
                                <input type="file" required accept="image/*" name="img_item" id="file" onchange="loadFile2(event)" multiple style="display: block;">
                                <div class="output" id="output2"></div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <script src="<c:url value="/assets/Javascript/ManagerProduct.js" />"></script> 
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

                                    var loadFile2 = function (event) {
                                        var output = document.getElementById('output2');
                                        output.innerHTML = ""; // xóa nội dung trong #output để tạo lại các ảnh mới

                                        for (var i = 0; i < event.target.files.length; i++) {
                                            var reader = new FileReader();
                                            reader.onload = function () {
                                                var img = document.createElement('img');
                                                img.src = reader.result;
                                                output.appendChild(img); // thêm ảnh vào #output
                                            }
                                            reader.readAsDataURL(event.target.files[i]);
                                        }
                                    };

        </script>
    </body>
</html>


