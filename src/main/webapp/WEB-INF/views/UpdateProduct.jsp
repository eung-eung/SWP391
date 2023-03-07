
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Crud</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<c:url value="/assets/css/ManagerProduct.css" />" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="editInfo" action="./UpdateProduct" method="post"></form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Update Product</h4>
                            <a href="./ProductManagerController"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                        </div>
                        <div class="modal-body">					
                            <div hidden class="form-group">
                                <label>ID</label>
                                <input form="editInfo" value="${product.getProductID()}" name="productid" type="text" class="form-control" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Shop Name</label>
                                <input form="editInfo" value="${product.getShopName()}" name="name" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Category Name</label>
                                <input form="editInfo" value="${product.getCategoryName()}" name="image" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input form="editInfo" value="${product.getPrice()}" name="price" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Product Name</label>
                                <textarea form="editInfo" name="pName" class="form-control" required>${product.getName()}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea form="editInfo" name="description" class="form-control" required>${product.getDescription()}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Quanity</label>
                                <input form="editInfo" value="${product.getQuanity()}" name="quantity" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Discount</label>
                                <input form="editInfo" value="${product.getDiscount()}" name="discount" type="number" class="form-control" required>
                            </div>
                            <form id="imgupload"  action="./UpdateImage?idProduct=${product.getProductID()}" method="post" enctype="multipart/form-data"  ></form>
                            <div class="form-group">
                                <label>MainImg:</label><br/>

                                <input hidden="true" form="imgupload" type="text" value="${product.getMainImg()}" name="imageid">
                                <img   src="${product.getMainImg().getUrl()}" alt="alt" style="max-height: 240px;max-width: 240px;"> 
                                <label><br/>
                                    <input class="" form="imgupload"  type="file" value="Update Image"
                                           accept="image/*" name="img_item" id="file1" style="display:none" onchange="submitFormById('imgupload')" >
                                    <input type="button" value="Update Img" onclick="triggerClick('file1')">
                                </label> <br/>
                                <div class="form-group">
                                    <label>Img:  </label>
                                    <label> <br/>
                                        <form id="imgupload2"  action="./UploadImageFirebase?productid=${product.getProductID()}" method="post" enctype="multipart/form-data"  ></form>

                                        <input class="" form="imgupload2"  type="file" value="Update Image"
                                               accept="image/*" name="img_item" id="file2" style="display:none" onchange="submitFormById('imgupload2')" >
                                        <input type="button" value="Add more Img" onclick="triggerClick('file2')">
                                    </label>
                                    <c:forEach var="item" items="${product.getImgs()}">
                                        <br/>
                                        <form id="imgupload_${item.getImageID()}"  action="./UpdateImage?idProduct=${product.getProductID()}" method="post" enctype="multipart/form-data"  ></form>
                                        <input hidden="true" form="imgupload_${item.getImageID()}" type="text" value="${item.getImageID()}" name="imageid"> 
                                        <img src="${item.getUrl()}" alt="alt" style="max-height: 240px;max-width: 240px;">
                                        <label><br/>
                                            <input class="" form="imgupload_${item.getImageID()}"  type="file" value="Update Image"
                                                   accept="image/*" name="img_item" id="file_${item.getImageID()}" style="display:none" onchange="submitFormById('imgupload_${item.getImageID()}')" >
                                            <input style="background-color: greenyellow" type="button" value="Update Img" onclick="triggerClick('file_${item.getImageID()}')">
                                        </label> 
                                        <a href="./DeleteImage?ImageID=${item.getImageID()}&idProduct=${product.getProductID()}"><button style="background-color: red">Delete</button> </a>
                                        <br/>  </c:forEach>  
                                    </div> 
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Edit" form="editInfo" >
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <script>
                function triggerClick(s) {
                    document.getElementById(s).click();
                }

                function submitFormById(formId) {
                    // Lấy đối tượng form
                    var form = document.getElementById(formId);

                    // Kiểm tra nếu form tồn tại
                    if (form) {
                        // Submit form
                        form.submit();
                    }
                }




                // Lấy thẻ img và nút tải lên
                const imgElement = document.querySelector('.form-group img');
                const uploadButton = document.querySelector('.form-group input[type="submit"]');

                // Khi người dùng chọn một tệp tin ảnh mới để tải lên
                uploadButton.addEventListener('click', () => {
                    const fileInput = document.createElement('input');
                    fileInput.type = 'file';
                    fileInput.accept = 'image/*';
                    fileInput.onchange = () => {
                        // Nếu người dùng đã chọn tệp tin ảnh mới, thay đổi giá trị src của thẻ img
                        const file = fileInput.files[0];
                        const reader = new FileReader();
                        reader.readAsDataURL(file);
                        reader.onload = () => {
                            imgElement.src = reader.result;
                        };
                    };
                    fileInput.click();
                });
            </script>

            <script src="<c:url value="/assets/Javascript/ManagerProduct.js" />"></script> 
    </body>
</html>

