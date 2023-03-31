<%@page import="com.team1.ecommerceplatformm.user.UserDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.team1.ecommerceplatformm.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <style>

            .admin_page{
                display: flex;
                width: 100%;
                height: 100%;
                border-top: 1px solid black;
            }

            .admin_page_navbar{
                position: fixed;
                top: 0;
                width: 14%;
                height: 100vh;
                margin-right:10px;
                background: #ff5c00;
                border-top-right-radius: 15px;
                border-bottom-right-radius: 15px;
            }

            .admin_page_navbar div{
                width: 80%;
                margin: 20px 0 0 15px;
                color: black;
            }

            .admin_page_navbar_header{
                position: relative;
                padding: 7px 15px;
                background-color: #ff5c00;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-align: center;
                color: #fff !important;
                pointer-events: none;
                user-select: none;
            }

            .admin_page_navbar_header::before{
                content: '';
                position: absolute;
                width: 110%;
                border: 1px solid #fff;
                bottom: -30%;
                left: -5%;
                -ms-transform: rotate(90deg);
            }

            .admin_page_text{
                background: white;
                transition: 0.25s;
            }

            .admin_page_text:hover{
                transition: 0.25s;
                width: 82%;
                margin: 20px 0 0 13px;
                font-weight: 700;
                letter-spacing: 2px;
            }

            .admin_page_content{
                width: 85.8%;
                position: absolute;
                right: 0;
            }

            .admin_dashboard{
                display: none;
                border-top: 1px solid black;
                padding-top: 10px;
            }

            .admin_table{
                border-top: 1px solid black;
                padding-top: 10px;
            }

            .pieChart{
                width: 50%;
                height: 100%;
                display: flex;
            }

            .pieChartTotal{
                display: flex;
                justify-content: space-around;
            }

            .column_chart{
                margin-top: 50px;
                display: flex;
                justify-content: center;
            }

            .shop_request{
                display: none;
                border-top: 1px solid black;
                padding-top: 10px;
            }

            .product_request{
                display: none;
                border-top: 1px solid black;
                padding-top: 10px;
            }

            .review_table{
                display: none;
                border-top: 1px solid black;
                padding-top: 10px;
            }

            .btn_active{
                background-color: #f1f1f1;
                position: relative;
                font-weight: 700;
                color: black;
            }

            .prevent_click {
                pointer-events: none;
                opacity: 0.5;
            }

            .shop_request_list{
                width: 100%;
            }

            .child-row{
                padding-left:50px;
                margin: 0 auto;
            }

            .shop_detail{
                margin-top: 2%;
                height: 31%;
                width: 200%;
                border-top: 1px solid black;
                background-color: #3fd1ee;
                display: flex;
                align-items: center;
            }

            .shop_detail div{
                border-bottom: none;
            }

            .ban_btn{
                margin: 1px 0;
            }

            .image_modal{
                position: fixed;
                top: 0;
                bottom: 0;
                right: 0;
                left: 0;
                background-color: rgba(38, 38, 38, 0.3);
                z-index: 100;
            }

            .image_modal_content{
                position: relative;
                width: 50%;
                height: fit-content;
                margin: 10% auto;
                background-color: white;
                border-radius: 5px;
                max-height: 50%;
                max-width: 70%;
            }

            .image_modal_content_cancle{
                position: absolute;
                right : 1%;
                top : 1%;
            }

            .image_modal_content_image{
                display: flex;
                justify-content: center;
                height: fit-content;
                background-color: white;
                border-radius: 5px;
                padding: 30px;
            }

            .image_modal_content_image img{
                max-width:100%;
                max-height:100%;
                height:fit-content;
            }
        </style>

        <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
        <script
        src="https://www.paypal.com/sdk/js?client-id=AVPNRTv0apljAkWHaqZyMDTbKipmIQ_HpbKISKwAdC4_IJtCIVck8tSG8M7k6DgiCZEvrctor-faOGWT&currency=USD"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <title>Admin Page</title>
    </head>



    <body>
        <div class="admin_page">
            <div class="admin_page_navbar shadow">
                <div class="admin_page_navbar_header" >
                    Admin Option
                </div>

                <div class="admin_page_text shop_list btn btn_active">
                    Danh sách cửa hàng
                </div>
                <div class="admin_page_text dashboard btn">
                    Dashboard
                </div>
                <div class="admin_page_text shopRegis btn">
                    Các shop đăng ký
                </div>
                <div class="admin_page_text productRegis btn">
                    Các sản phẩm chờ duyệt
                </div>
                <div class="admin_page_text review-list btn">
                    Danh sách các review 
                </div>
            </div>

            <div class="admin_page_content">
                <jsp:include page="header.jsp" />
                <div class="admin_dashboard">
                    <div class="pieChart">
                        <canvas id="productChart" class="pieChart"></canvas>
                        <canvas id="userChart" class="pieChart"></canvas>
                    </div>
                    <div class="pieChartTotal">
                        <div class="pieChartFisrtTotal">
                        </div>
                        <div class="pieChartSecondTotal">
                        </div>
                    </div>
                    <div class="column_chart">
                        <canvas id="productPerMonthChart"></canvas>
                    </div>
                </div>

                <div class="admin_table">
                    <table id="shop_list" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th>ID cửa hàng</th>
                                <th>Tên cửa hàng</th>
                                <th>ID người dùng</th>
                                <th>Ngày tạo</th>
                                <th>Trạng thái</th>
                                <th>Cấm</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th></th>
                                <th>ID cửa hàng</th>
                                <th>Tên cửa hàng</th>
                                <th>ID người dùng</th>
                                <th>Ngày tạo</th>
                                <th>Trạng thái</th>
                                <th>Cấm</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="shop_request shopRegis">
                    <table id="shop_request" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID cửa hàng</th>
                                <th>ID người dùng</th>
                                <th>Tên Shop</th>
                                <th>Ngày Đăng ký</th>

                                <th>Mặt trước CCCD</th>
                                <th>Mặt sau CCCD</th>
                                <th>Duyệt</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>ID cửa hàng</th>
                                <th>ID người dùng</th>
                                <th>Tên Shop</th>
                                <th>Ngày Đăng ký</th>

                                <th>Mặt trước CCCD</th>
                                <th>Mặt sau CCCD</th>
                                <th>Duyệt</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="product_request productRegis">
                    <table id="product_request" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID cửa hàng</th>
                                <th>ID sản phẩm</th>
                                <th>Giá</th>
                                <th>Phân loại</th>
                                <th>Số lượng</th>
                                <th>ngày tạo</th>
                                <th>Duyệt</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>ID cửa hàng</th>
                                <th>ID sản phẩm</th>
                                <th>Giá</th>
                                <th>Phân loại</th>
                                <th>Số lượng</th>
                                <th>ngày tạo</th>
                                <th>Duyệt</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="review_table">
                    <table id="review_table" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID người dùng</th>
                                <th>Tên người dùng</th>
                                <th>ID Sản phẩm</th>
                                <th>ID đơn hàng</th>
                                <th>Đánh giá</th>
                                <th>Bình luận</th>
                                <th>Trạng thái</th>
                                <th>Ngày tạo</th>
                                <th>Cấm</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>ID người dùng</th>
                                <th>Tên người dùng</th>
                                <th>ID Sản phẩm</th>
                                <th>ID đơn hàng</th>
                                <th>Đánh giá</th>
                                <th>Bình luận</th>
                                <th>Trạng thái</th>
                                <th>Ngày tạo</th>
                                <th>Cấm</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </div>
        </div>

        <div class="image_modal" hidden>

        </div>
    </body>
    <script>
        function getcategories(index) {
            let categories = [
                "Quần áo",
                "Thực phẩm",
                "Giày dép",
                "Đồ gia dụng",
                "Trang trí",
                "Nước hoa",
                "Thú cưng",
                "Văn phòng phẩm",
                "Sách",
                "Khác",
            ];
            return categories[index]
        }
        const btnGroup = document.querySelectorAll(".admin_page_text");

        btnGroup.forEach((item) => {
            const table = document.querySelector(".admin_table");
            const dashboard = document.querySelector(".admin_dashboard");
            const shopRegis = document.querySelector(".shop_request");
            const productRegis = document.querySelector(".product_request");
            const reviewList = document.querySelector(".review_table");
            item.addEventListener("click", (event) => {
                if (event.target.classList.contains("shop_list")) {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "block";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "none";
                    productRegis.style.display = "none";
                    reviewList.style.display = "none";
                } else if (event.target.classList.contains("dashboard")) {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "none";
                    dashboard.style.display = "block";
                    shopRegis.style.display = "none";
                    productRegis.style.display = "none";
                    reviewList.style.display = "none";
                } else if (event.target.classList.contains("shopRegis")) {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "none";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "block";
                    productRegis.style.display = "none";
                    reviewList.style.display = "none";
                } else if (event.target.classList.contains("productRegis")) {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "none";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "none";
                    productRegis.style.display = "block";
                    reviewList.style.display = "none";
                } else {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "none";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "none";
                    productRegis.style.display = "none";
                    reviewList.style.display = "block";
                }
            });
        });

//      setup model
        let image_modal = document.querySelector(".image_modal");
        let image_button = document.querySelectorAll(".image_button");
        let image_button_cancle = document.querySelector(".image_modal_content_cancle");
        image_button.forEach((item) => {
            item.addEventListener("click", function () {
                image_modal.hidden = false;
            })
        })

        document.querySelector(".header-bottom").hidden = true;

        $(document).ready(async function () {
            await getShopProductData();
            await setChartData();
            await authenShop();
            await authenProduct();
            await getProductReviewData();
        });

        const setChartData = function () {
            fetch("MainController?btnAction=admin&adminAction=dashboard", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(async data => {
                        console.log(data);
                        let productAmount = 0;
                        for (let i = 0; i < data.listCount.length; i++) {
                            productAmount += data.listCount[i];
                        }

//                      chuyển sang tiếng việt
                        let listNameOfUser = [];
                        for (let i = 0; i < data.listNameOfUser.length; i++) {
                            switch (data.listNameOfUser[i]) {
                                case 'Buyer' :
                                    listNameOfUser.push("Người mua")
                                    break;
                                case 'Seller' :
                                    listNameOfUser.push("Người bán")
                                    break;
                                case 'Admin' :
                                    listNameOfUser.push("Quản trị viên")
                                    break;
                                default :
                                    listNameOfUser.push(listNameOfUser[i])

                            }
                        }

                        let userAmount = 0;
                        for (let i = 0; i < data.listUser.length; i++) {
                            userAmount += data.listUser[i];
                        }

//                      set piechart total

                        const firstPiechart = document.querySelector(".pieChartFisrtTotal");
                        const secondPiechart = document.querySelector(".pieChartSecondTotal");
                        firstPiechart.innerHTML = ("Tổng số : " + productAmount);
                        secondPiechart.innerHTML = ("Tổng số " + userAmount);
//                      add data to chart   
//                      product piechart

                        let productChart = new Chart("productChart", {
                            type: "pie",
                            data: {
                                labels: data.listName,
                                datasets: [{

                                        data: data.listCount
                                    }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: "Sản phẩm"
                                },
                                plugins: {
                                    title: {
                                        display: true,
                                        text: 'Sản phẩm',
                                        font: {
                                            size: 29
                                        }
                                    }
                                }
                            }
                        });
//                      user piechart
                        var userChart = new Chart("userChart", {
                            type: "pie",
                            data: {
                                labels: listNameOfUser,
                                datasets: [{

                                        data: data.listUser
                                    }]
                            },
                            options: {
                                title: {
                                    display: true,
                                    text: "Người dùng"
                                },
                                plugins: {
                                    title: {
                                        display: true,
                                        text: 'Người dùng',
                                        font: {
                                            size: 29
                                        }
                                    }
                                }
                            }
                        });
                        let productPerMonthChart = new Chart("productPerMonthChart", {
                            type: 'bar',
                            data: {
                                labels: data.listMonth,
                                datasets: [{
//                                        label: '',
                                        data: data.listCountByMonth,
                                        backgroundColor: "rgba(5,112,230,0.6)",
                                        borderColor: [
                                            'rgba(255, 99, 132, 1)',
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(54, 162, 235, 1)'
                                        ]
                                    }]
                            },
                            options: {
                                plugins: {
                                    title: {
                                        display: true,
                                        text: 'Sản phẩm đăng theo tháng',
                                        font: {
                                            size: 29
                                        }
                                    },
                                    legend: {
                                        display: false
                                    }
                                },
                                scales: {
                                    x: {
                                        display: false //this will remove all the x-axis grid lines
                                    }
                                }
                            }
                        });
//                      set data to chart
                        productChart.update();
                        userChart.update();
                        productPerMonthChart.update();
                    })
        };

        const authenProduct = function () {
            fetch("MainController?btnAction=admin&adminAction=authenProduct", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(data => {
        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            int userID = 0;
            if (user != null) {
                userID = user.getUserID();
            }
            session.setAttribute("userId", userID);
        %>
                        var userId = '<%= session.getAttribute("userId")%>';
                        console.log(data);
                        const table = $('#product_request').DataTable({

                            data: data
                            ,
                            'columns': [
                                {'data': 'shopID'},
                                {'data': 'productID'},
                                {'data': 'price'},
                                {
                                    'data': 'categoryID',
                                    render : function (data, type, row) {
                                       return getcategories(row.categoryID)
                                    }
                                },
                                {'data': 'quanity'},
                                {'data': 'createAt'},
                                {
                                    data: null,
                                    orderable: false,
                                    render: function (data, type, row) {
                                        return `<a type = "button" class = " ban_btn btn btn-success" onclick="return confirm('Bản muốn chấp nhận đơn đăng ký sản phẩm này ?')"  href="<c:url value="/MainController?btnAction=admin&adminAction=approveProduct&productId=\${row.productID}&userId=\${userId}"></c:url>">Chấp nhận</a>
                                        <a type = "button" class = " ban_btn btn btn-danger" onclick="return confirm('Bản muốn từ chối đơn đăng ký sản phẩm này?')" href="<c:url value="/MainController?btnAction=admin&adminAction=rejectProduct&productId=\${row.productID}&userId=\${userId}"></c:url>">Từ chối</a>`;
                                    }
                                }
                            ],
                            order: [[0, 'asc']]
                        });
                    });
        };

        const authenShop = function () {
            fetch("MainController?btnAction=admin&adminAction=authenShop", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(data => {
                        console.log(data)

        <%
            if (user != null) {
                userID = user.getUserID();
            }
            session.setAttribute("userId", userID);
        %>
                        var userId = '<%= session.getAttribute("userId")%>';
                        const table = $('#shop_request').DataTable({
                            data: data
                            ,
                            'columns': [
                                {'data': 'shopID'},
                                {'data': 'userID'},
                                {'data': 'shopName'},
                                {'data': 'createAt'},

                                {
                                    data: null,
                                    orderable: false,
                                    render: function (data, type, row) {
                                        return `<button type="button" class="ban_btn btn btn-info" style="color: white" onclick="addModel('\${row.frontIdentity}')">Xem</button>`;
                                    }
                                },
                                {
                                    data: null,
                                    orderable: false,
                                    render: function (data, type, row) {
                                        return `<button type="button" class="ban_btn btn btn-info" style="color: white" onclick="addModel('\${row.backIdentity}')">Xem</button>`;
                                    }
                                },
                                {
                                    data: null,
                                    orderable: false,
                                    render: function (data, type, row) {
                                        return `<a type = "button" class = "image_button ban_btn btn btn-success" onclick="return confirm('Bạn muốn chấp nhận đơn đăng ký của shop này?')"  href="<c:url value="/MainController?btnAction=admin&adminAction=approveShop&shopId=\${row.shopID}&userId=\${userId}"></c:url>">Chấp nhận</a>
                                        <a type = "button" class = " ban_btn btn btn-danger" onclick="return confirm('Bạn muốn từ chối đơn đăng ký của shop này ?')" href="<c:url value="/MainController?btnAction=admin&adminAction=rejectShop&shopId=\${row.shopID}&userId=\${userId}"></c:url>">Từ chối</a>`;
                                    }
                                }
                            ],
                            order: [[0, 'asc']]
                        });
                    })
//                    .catch(error => console.log(error));
        };

        const getShopProductData = function () {
            fetch("MainController?btnAction=admin&adminAction=render", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(data => {
                        console.log(data);
                        const table = $('#shop_list').DataTable({

                            data: data
                            ,
                            'columns': [
                                {
                                    className: 'dt-control',
                                    orderable: false,
                                    data: null,
                                    defaultContent: '',
                                },
                                {
                                    'data': 'shopID'
                                },
                                {'data': 'shopName'},
                                {'data': 'userID'},
                                {'data': 'createAt'},
                                {
                                    'data': 'status',
                                    render: function (data, type, row, meta) {
                                        return data ? "Đang hoạt động" : "Ngưng hoạt động";
                                    }

                                },
                                {
                                    data: null,
                                    orderable: false,
                                    render: function (data, type, row) {
                                        return row.status ? `<a type = "button" class = " ban_btn btn btn-danger" onclick="return confirm('Bạn muốn cấm cửa hàng này ?')"  
                                        href="<c:url value="/MainController?btnAction=admin&adminAction=updateBanShop&shopID=\${row.shopID}"></c:url>">Ban</a>` :
                                                `<a type = "button" class = " ban_btn btn btn-danger" onclick="return confirm('Bạn muốn bỏ cấm cửa hàng này ?')"  
                                        href="<c:url value="/MainController?btnAction=admin&adminAction=updateUnBanShop&shopID=\${row.shopID}"></c:url>">Unban</a>`;
                                    }
                                }
                            ],
                            order: [[0, 'asc']]
                        });
                        // Add event listener for opening and closing details
                        $('#shop_list tbody').on('click', 'td.dt-control', function () {

                            let tr = $(this).closest('tr');
                            let row = table.row(tr);
                            if (row.child.isShown()) {
                                // This row is already open - close it
                                row.child.hide();
                                tr.removeClass('shown');
                            } else {
                                // Open this row
                                row.child(format(row.data())).show();
                                tr.addClass('shown');
                            }


                        });
                    });
        };

        const getProductReviewData = function () {
            fetch("MainController?btnAction=admin&adminAction=viewReview", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(data => {
                        console.log(data);

                        for (var i = 0; i < data.reviews.length; i++) {
                            for (var j = 0; j < data.users.length; j++) {
                                if (data.reviews[i].userId === data.users[j].userID) {
                                    data.reviews[i].userName = data.users[j].username;
                                }
                            }
                        }
                        data = data.reviews
                        console.log(data);
                        const table = $('#review_table').DataTable({
                            data: data
                            ,
                            'columns': [
                                {'data': 'userId'},
                                {'data': 'userName'},
                                {'data': 'productId'},
                                {'data': 'orderId'},
                                {'data': 'rating'},
                                {'data': 'comment'},
                                {
                                    'data': 'status',
                                    render: function (data, type, row, meta) {
                                        return data ? "Chưa ẩn" : "Đã ẩn";
                                    }

                                },
                                {'data': 'createAt'},
                                {
                                    data: null,
                                    orderable: false,
                                    render: function (data, type, row) {
                                        return row.status ? `<a type = "button" class = " ban_btn btn btn-danger" onclick="return confirm('Bạn muốn ẩn đánh giá này ?')"  
                                        href="<c:url value="/MainController?btnAction=admin&adminAction=hideReview&reviewId=\${row.reviewId}"></c:url>">Ẩn</a>` :
                                                `<a type = "button" class = " ban_btn btn btn-danger" onclick="return confirm('Bạn muốn bỏ ẩn đánh giá này ?')"  
                                        href="<c:url value="/MainController?btnAction=admin&adminAction=unHideReview&reviewId=\${row.reviewId}"></c:url>">Bỏ Ẩn</a>`;
                                    }
                                }
                            ],
                            order: [[0, 'asc']]
                        });
                        // Add event listener for opening and closing details
                        $('#shop_list tbody').on('click', 'td.dt-control', function () {

                            let tr = $(this).closest('tr');
                            let row = table.row(tr);
                            if (row.child.isShown()) {
                                // This row is already open - close it
                                row.child.hide();
                                tr.removeClass('shown');
                            } else {
                                // Open this row
                                row.child(format(row.data())).show();
                                tr.addClass('shown');
                            }


                        });
                    });
        };

        function removeActive(list) {
            list.forEach((item) => {
                item.classList.remove("btn_active");
            })
        }

        function getProduct(element, status) {
            return (
                    '</tr>' +
                    '<td>' +
                    element.productID +
                    '</td>' +
                    '<td>' +
                    element.name +
                    '</td>' +
                    '<td>' +
                    element.price +
                    '</td>' +
                    '<td>' +
                    element.soldCount +
                    '</td>' +
                    '<td>' +
                    (element.status ? "Đang hoạt động" : "Ngưng hoạt động") +
                    '</td>' +
                    '<td>' +
                    (element.status ? '<a type = "button" class = " ban_btn btn btn-danger ' + (!status ? "prevent_click" : "") + '" onclick="return confirm(`Bạn muốn cấm sản phẩm này ?`)"  href="/EcommercePlatformm/MainController?btnAction=admin&adminAction=updateBanProduct&productId=' + (element.productID) + '" >Ban</a>' :
                            '<a type = "button" class = " ban_btn btn btn-danger ' + (!status ? "prevent_click" : "") + '" onclick="return confirm(`Bạn muốn bỏ cấm sản phẩm này ?`)"  href="/EcommercePlatformm/MainController?btnAction=admin&adminAction=updateUnBanProduct&productId=' + (element.productID) + '" >Unban</a>')
                    +
                    '</td>' +
                    '<tr>'
                    );
        }

        function getPercent(list, number) {
            let total = 0;
            for (let i = 0; i < list.length; i++) {
                total += list[i];
            }
            let percent = number / total * 100;
            return percent.toFixed();
        }

        function format(d) {
            // `d` is the original data object for the row
            let data = "";
            d.listProducts.forEach(element => {
                data = data + getProduct(element, d.status);
            });
            return (
                    '<table class="child-row" cellpadding="5" cellspacing="0" border="0">' +
                    '<tr>' +
                    '<td>Product ID</td>' +
                    '<td>Tên sản phẩm</td>' +
                    '<td>Giá</td>' +
                    '<td>Đã bán</td>' +
                    '<td>Trạng thái</td>' +
                    '<td>cấm</td>' +
                    data +
                    '</tr>' +
                    '</table>'
                    );
        }

        const addModel = function (image) {
            image_modal.hidden = false;
            image_modal.innerHTML = `
                <div class="image_modal_content"><div class="image_modal_content_cancle">X</div>
                    <div class="image_modal_content_image">
                        <img src="` + image + `" alt="">
                    </div>
                </div>
            `;
            image_button_cancle = document.querySelector(".image_modal_content_cancle");
            image_button_cancle.addEventListener("click", function () {
                image_modal.hidden = true;
            })
        }

    </script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</html>