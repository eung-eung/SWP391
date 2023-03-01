

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="vi-VN"/>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <!--<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">-->
        <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/ManagerProduct.css" />" />

        <style>
            /*            img{
                            width: 200px;
                            height: 120px;
                        }*/
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

        <style>
            .limited-textarea {
                width: 100%
            }
        </style>
    </head>
    <body>
        <div class="container1">
            <div class="nav-bar">
                <div class="nav-content">
                    <div class="home">
                        <i class="fa-solid fa-house"></i>
                        <a href="<c:url value="MainController"/>">Trang chủ</a>
                    </div>

                    <div class="nav-button active" id="manageProduct">
                        <i class="fa-solid fa-shop"></i>
                        <span>Quản lý cửa hàng</span>
                    </div>
                    <div class="nav-button" id="chartProduct">
                        <i class="fa-solid fa-chart-line"></i>
                        <span>Top 10 sản phẩm mua nhiều nhất</span>
                    </div>


                    <div class="nav-cursive"></div>
                </div>
            </div>
            <div id="render">

                <div class="table-wrapper">
                    <!--                    <div class="table-title">-->
                    <div class="row">

                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="fa-solid fa-plus"></i><span>Thêm sản phẩm</span></a>

                        </div>
                    </div>
                    <!--</div>-->
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>STT</th> 
                                <th hidden>Shop Name</th>
                                <th>Loại sản phẩm</th> 
                                <th>Giá</th>
                                <th>Tên sản phẩm</th>
                                <th>Mô tả</th>
                                <th>Số lượng</th>
                                <th>Ngày tạo</th> 
                                <th>Cập nhật</th>
                                <th>Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" begin="1" end="${prolist.size()}" step="1" varStatus="loop">
                                <tr>
                                    <td>${loop.index}</td>
                                    <td hidden>${prolist[loop.index - 1].getProductID()}</td>
                                    <td hidden>${prolist[loop.index - 1].getShopName()}</td>
                                    <td>${prolist[loop.index - 1].getCategoryName()}</td>
                                    <td> <fmt:formatNumber value="${prolist[loop.index - 1].getPrice()}" type="currency" /></td>
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
                                           href="./UpdateProduct?productid=${prolist[loop.index - 1].getProductID()}">Cập nhật</a>
                                    </td>
                                    <td>
                                        <a class="delete" style="padding: 14px;background-color: red; text-decoration: none;color: white;border-radius: 4px" 
                                           href="./DeleteProduct?productid=${prolist[loop.index - 1].getProductID()}">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>






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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
                                    const content = document.querySelector(".nav-content")
                                    const buttons = document.querySelectorAll(".nav-button")
                                    const cursive = document.querySelector(".nav-cursive")
                                    const manageProduct = document.querySelector("#manageProduct")
                                    const chartProduct = document.querySelector("#chartProduct")
                                    cursive.style.top = `\${buttons[0].offsetTop}px`
                                    function random_rgba() {
                                        var o = Math.round, r = Math.random, s = 255;
                                        return 'rgba(' + o(r() * s) + ',' + o(r() * s) + ',' + o(r() * s) + ',' + r().toFixed(1) + ')';
                                    }
                                    buttons.forEach(button => button.addEventListener("click", function (event) {
                                            cursive.style.top = `\${button.offsetTop}px`
                                            buttons.forEach(button => {
                                                button.classList.remove("active")
                                            })

                                            button.classList.toggle("active")
                                            if (chartProduct.classList.contains('active')) {
                                                document.querySelector("#render").innerHTML = `<div class="lds-ring"><div></div><div></div><div></div><div></div></div>`
                                                fetch('MainController?btnAction=dashboard')
                                                        .then(res => res.json())
                                                        .then(data => {
                                                            console.log(data)
                                                            document.querySelector("#render").innerHTML = `  
                                                    <div class="chart-container">
                                                        <canvas id="myChart"></canvas>
                                                            </div>`
                                                            let test_labels = data;
                                                            console.log(test_labels);
                                                            let label_main = [];
                                                            let data_main = [];
                                                            let rgba_main = [];
                                                            for (let i = 0; i < test_labels.length; i++) {
                                                                label_main.push(test_labels[i].name);
                                                                data_main.push(test_labels[i].soldCount);
                                                                rgba_main.push(random_rgba());
                                                            }
                                                            console.log(label_main);
                                                            console.log(data_main);
                                                            console.log(rgba_main);

                                                            let ctx = document.getElementById('myChart').getContext('2d');
                                                            let myChart = new Chart(ctx, {
                                                                type: 'bar',
                                                                data: {
                                                                    labels: label_main,
                                                                    datasets: [{
                                                                            label: label_main,
                                                                            data: data_main,
                                                                            backgroundColor: rgba_main,
                                                                            borderColor: [
                                                                                'rgba(255, 99, 132, 1)',
                                                                                'rgba(54, 162, 235, 1)',
                                                                                'rgba(255, 206, 86, 1)'
                                                                            ],
                                                                            borderWidth: 1
                                                                        }]
                                                                },
                                                                options: {
                                                                    scales: {
                                                                        yAxes: [{
                                                                                ticks: {
                                                                                    beginAtZero: true
                                                                                }
                                                                            }]
                                                                    }
                                                                }
                                                            });

                                                        })


                                            } else if (manageProduct.classList.contains("active")) {
                                                document.querySelector("#render").innerHTML = `
                        <div class="table-wrapper">
              
                    <div class="row">
                        
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="fa-solid fa-plus"></i><span>Add New Product</span></a>

                        </div>
                    </div>
               
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>STT</th> 
                            <th hidden>Shop Name</th>
                            <th>Loại sản phẩm</th> 
                            <th>Giá</th>
                            <th>Tên sản phẩm</th>
                            <th>Mô tả</th>
                            <th>Số lượng</th>
                            <th>Ngày tạo</th> 
                            <th>Cập nhật</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
            <c:forEach var="product" begin="1" end="${prolist.size()}" step="1" varStatus="loop">
                            <tr>
                                <td>${loop.index}</td>
                                <td hidden>${prolist[loop.index - 1].getProductID()}</td>
                                <td hidden>${prolist[loop.index - 1].getShopName()}</td>
                                <td>${prolist[loop.index - 1].getCategoryName()}</td> 
                                <td><fmt:formatNumber value="${prolist[loop.index - 1].getPrice()}" type="currency" /></td>
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
                                       href="./UpdateProduct?productid=${prolist[loop.index - 1].getProductID()}">Cập nhật</a>
                                </td>
                                <td>
                                    <a class='delete' style="padding: 14px;background-color: red; text-decoration: none;color: white;border-radius: 4px" 
                                       href="./DeleteProduct?productid=${prolist[loop.index - 1].getProductID()}">Xóa</a>
                                </td>
                            </tr>
            </c:forEach>
                    </tbody>
                </table>
               
            </div>            
                        `

                                            }
                                        }))
        </script>
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

        <script>

            $('.delete').click(function (event) {
                event.preventDefault();
                swal({
                    title: "Bạn có muốn xóa?",
                    //                    text: "Once deleted, you will not be able to recover this imaginary file!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                swal("Đã xóa thành công", {
                                    icon: "success",

                                });
                                window.location = $(this).attr('href');
                            } else {
                                swal("Xóa không thành công");
                            }
                        });

            });
        </script>

    </body>
</html>


