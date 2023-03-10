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
            body{
                position: relative;
            }

            .admin_page{
                display: flex;
                width: 100%;
                height: 100%;
                border-top: 1px solid black;
                padding: 10px 0;
            }

            .admin_page_navbar{
                position: sticky;
                top: 0;
                width: 14%;
                height: 100vh;
                margin-right:10px;
                background: #58ccfb;
            }

            .admin_page_navbar div{
                width: 80%;
                margin: 20px 0 0 15px;
                color: black;
            }

            .admin_page_navbar_header{
                position: relative;
                padding: 7px 15px;
                background-color: #58ccfb;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-align: center;
                color: white;
            }

            .admin_page_navbar_header::before{
                content: '';
                position: absolute;
                width: 110%;
                border: 1px solid #3c3d45;
                bottom: -30%;
                left: -5%;
                -ms-transform: rotate(90deg);
            }

            .admin_page_text{
                background: white;
            }

            .admin_page_text:hover{
                transition: 0.25s;
                width: 82%;
                margin: 20px 0 0 13px;
                gap: 1px;
            }

            .admin_page_content{
                width: 85.5%;
                position: absolute;
                right: 0;
            }

            .admin_dashboard{
                display: none;
            }

            .pieChart{
                width: 100%;
                height: 100%;
                display: flex;
            }

            .column_chart{
                margin-top: 50px;
                display: flex;
                justify-content: center;
            }

            .shop_request{
                display: none
            }

            .product_request{

            }

            .btn_active{
                background-color: #f1f1f1;
                color: black;
            }

            .chart{
                height: 370px;
                width: 100%;
            }

        </style>

        <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
        <script
        src="https://www.paypal.com/sdk/js?client-id=AVPNRTv0apljAkWHaqZyMDTbKipmIQ_HpbKISKwAdC4_IJtCIVck8tSG8M7k6DgiCZEvrctor-faOGWT&currency=USD"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>
        <title>Admin Page</title>
    </head>



    <body>
        <jsp:include page="header.jsp" />

        <div class="admin_page">
            <div class="admin_page_navbar rounded shadow">
                <div class="admin_page_navbar_header" >
                    Admin Option
                </div>

                <div class="admin_page_text shop_list btn btn_active">
                    Shop list
                </div>
                <div class="admin_page_text dashboard btn">
                    Dashboard
                </div>
                <div class="admin_page_text shopRegis btn">
                    Shop register
                </div>
                <div class="admin_page_text productRegis btn">
                    Product register
                </div>
            </div>

            <div class="admin_page_content">

                <div class="shop_request">
                    shop register accept
                </div>

                <div class="product_request">
                    product register accept
                </div>

                <div class="admin_dashboard">
                    <div class="pieChart">
                        <div id="productChart" class="piechart" style="height: 370px; width: 100%"></div>
                        <div id="userChart" class="piechart" style="height: 370px; width: 100%"></div>
                    </div>
                    <div class="column_chart">
                        <div id="productPerMonthChart" style="height: 370px; width: 100%;"></div>
                    </div>
                </div>

                <div class="admin_table">
                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Shop ID</th>
                                <th>Shop name</th>
                                <th>User ID</th>
                                <th>Created at</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th></th>
                                <th>Shop ID</th>
                                <th>Shop name</th>
                                <th>User ID</th>
                                <th>Created at</th>
                                <th>Status</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <!--?btnAction=product&productAction=showProductbyShopId&shopID=1-->
    <script>

        const btnGroup = document.querySelectorAll(".admin_page_text");
        btnGroup.forEach((item) => {
            const table = document.querySelector(".admin_table");
            const dashboard = document.querySelector(".admin_dashboard");
            const shopRegis = document.querySelector(".shop_request");
            const productRegis = document.querySelector(".product_request");
            item.addEventListener("click", (event) => {
                if (event.target.classList.contains("shop_list")) {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "block";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "none";
                    productRegis.style.display = "none";
                } else if (event.target.classList.contains("dashboard")) {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "none";
                    dashboard.style.display = "block";
                    shopRegis.style.display = "none";
                    productRegis.style.display = "none";
                } else if (event.target.classList.contains("shopRegis")) {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "none";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "block";
                    productRegis.style.display = "none";
                } else {
                    removeActive(btnGroup);
                    event.target.classList.add("btn_active");
                    table.style.display = "none";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "none";
                    productRegis.style.display = "block";
                }
            });
        });

        document.querySelector(".header-bottom").hidden = true;
        $(document).ready(function () {

//          get shop and product data
            fetch("MainController?btnAction=admin&adminAction=render", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(data => {
                        const table = $('#example').DataTable({

                            data: data
                            ,
                            'columns': [
                                {
                                    className: 'dt-control',
                                    orderable: false,
                                    data: null,
                                    defaultContent: '',
                                    shopID: data.shopID
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
                                        return '<a type = "button" class = " ban_btn btn btn-danger" onclick="return confirm(`Are you sure you want to delete this item?`)"  href="http://localhost:8080/EcommercePlatformm/MainController?btnAction=admin&adminAction=show">Ban</a>';
                                    }
                                }
                            ],
                            order: [[0, 'asc']]
                        });
                        // Add event listener for opening and closing details
                        $('#example tbody').on('click', 'td.dt-control', function (event) {
                              console.log(event);
                            fetch("MainController?btnAction=product&productAction=showProductbyShopId&shopID=1", {
                                method: 'GET'
                            }).then(rs => rs.json())
                                    .then(data => {
//                                        
                                        console.log(data);
//                                        let tr = $(this).closest('tr');
//                                        let row = table.row(tr);
//                                        if (row.child.isShown()) {
//                                            // This row is already open - close it
//                                            row.child.hide();
//                                            tr.removeClass('shown');
//                                        } else {
//                                            // Open this row
//                                            row.child(format(row.data())).show();
//                                            tr.addClass('shown');
//                                        }
                                    });

                        });
                    });


//          chart data
            fetch("MainController?btnAction=admin&adminAction=dashboard", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(data => {
                        console.log(data);

//                      set produt data

                        const listCount = data.listCount;
                        const listName = data.listName;
                        let productData = [];
                        for (let i = 0; i < listCount.length; i++) {
                            let obj = {
                                y: getPercent(listCount, listCount[i]),
                                label: listName[i]
                            };
                            productData[i] = obj;
                        }

//                      set user data

                        const listUser = data.listUser;
                        const listNameOfUser = data.listNameOfUser;
                        let userData = [];
                        for (let i = 0; i < listUser.length; i++) {
                            let obj = {
                                y: getPercent(listUser, listUser[i]),
                                label: listNameOfUser[i]
                            };
                            userData[i] = obj;
                        }

//                      set column data
                        const listMonth = data.listMonth;
                        const listCountByMonth = data.listCountByMonth;
                        let columnData = [];
                        for (let i = 0; i < listMonth.length; i++) {
                            let obj = {
                                y: listCountByMonth[i],
                                label: listMonth[i]
                            };
                            columnData[i] = obj;
                        }
//                      add data to chart   
//                      product piechart
                        var productChart = new CanvasJS.Chart("productChart", {
                            theme: "light2", // "light1", "dark1", "dark2"
                            animationEnabled: true,
                            title: {
                                text: "Product"
                            },
                            data: [{
                                    type: "pie",
                                    toolTipContent: "<b>{label}</b>: {y}%",
                                    indexLabelFontSize: 16,
                                    indexLabel: "{label} - {y}%",
                                    dataPoints: productData
                                }]
                        });
//                      user piechart
                        var userChart = new CanvasJS.Chart("userChart", {
                            theme: "light2", // "light1", "dark1", "dark2"
                            animationEnabled: true,
                            title: {
                                text: "User"
                            },
                            data: [{
                                    type: "pie",
                                    toolTipContent: "<b>{label}</b>: {y}%",
                                    indexLabelFontSize: 16,
                                    indexLabel: "{label} - {y}%",
                                    dataPoints: userData
                                }]
                        });
//                      column chart
                        var productPerMonthChart = new CanvasJS.Chart("productPerMonthChart", {
                            title: {
                                text: "Product post per month"
                            },
                            axisX: {
                                title: "Month"
                            },
                            axisY: {
                                title: "Amount",
                                includeZero: true
                            },
                            data: [{
                                    type: "column",
                                    yValueFormatString: "",
                                    dataPoints: columnData
                                }]
                        });
                        productChart.render();
                        userChart.render();
                        productPerMonthChart.render();
                    });
        });

        function format(d) {
            // `d` is the original data object for the row
            let data = "";
            d.product.forEach(element => {
                data = data + getProduct(element);
            });
            return (
                    '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
                    '<tr>' +
                    '<td>Product id:</td>' +
                    '<td>Name:</td>' +
                    '<td>Price:</td>' +
                    '<td>Sold count:</td>' +
                    data +
                    '</tr>' +
                    '</table>'
                    );
        }

        function getProduct(element) {
            return (
                    '</tr>' +
                    '<td>' +
                    element.id +
                    '</td>' +
                    '<td>' +
                    element.name +
                    '</td>' +
                    '<td>' +
                    element.price +
                    '</td>' +
                    '<td>' +
                    element.sold_count +
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

        function removeActive(list) {
            list.forEach((item) => {
                item.classList.remove("btn_active")
            })
        }

//      css function 
//        var header = document.querySelector(".admin_page_navbar");
//        var sticky = header.offsetTop;
//
//        function myFunction() {
//            if (window.pageYOffset > sticky) {
//                header.classList.add("sticky");
//            } else {
//                header.classList.remove("sticky");
//            }
//        }

    </script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</html>