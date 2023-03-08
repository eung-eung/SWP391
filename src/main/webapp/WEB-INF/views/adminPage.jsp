<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                border-top: 1px solid black;
                padding: 10px 0;
            }

            .admin_page_navbar{
                width: 13%;
                height: 100vh;
                margin: 0 10px;
            }

            .admin_page_content{
                width: 90%;
            }

            .adminDashboard{
                display: none;
            }

            .adminAcception{
                display: none
            }

            .admin_page_navbar div{
                width: 80%;
                margin: 20px 0 0 15px;
                color: white;
            }

            .btn_active{
                background-color: #00b4d8;
                color: black;
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
                <div class="admin_page_text shop_list btn btn-info btn_active">
                    Shop list
                </div>
                <div class="admin_page_text dashboard btn btn-info">
                    Dashboard
                </div>
                <div class="admin_page_text shopRegis btn btn-info">
                    Shop register
                </div>
            </div>

            <div class="admin_page_content">

                <div class="adminAcception">
                    shop register accept
                </div>

                <div class="adminDashboard">
                    <div id="productChart" class="piechart" style="height: 370px; width: 100%"></div>
                    <div id="userChart" class="piechart" style="height: 300px; width: 100%"></div>
                </div>

                <div class="adminTable">
                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
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

    <script>

        const btnGroup = document.querySelectorAll(".admin_page_text");
        btnGroup.forEach((item) => {
            const table = document.querySelector(".adminTable");
            const dashboard = document.querySelector(".adminDashboard");
            const shopRegis = document.querySelector(".adminAcception");
            item.addEventListener("click", (event) => {
                if (event.target.classList.contains("shop_list")) {
                    removeActive(btnGroup)
                    event.target.classList.add("btn_active")
                    table.style.display = "block";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "none";
                } else if (event.target.classList.contains("dashboard")) {
                    removeActive(btnGroup)
                    event.target.classList.add("btn_active")
                    table.style.display = "none";
                    dashboard.style.display = "flex";
                    shopRegis.style.display = "none";
                } else {
                    removeActive(btnGroup)
                    event.target.classList.add("btn_active")
                    table.style.display = "none";
                    dashboard.style.display = "none";
                    shopRegis.style.display = "block";
                }
            })
        });

        document.querySelector(".header-bottom").hidden = true;

        $(document).ready(function () {

            fetch("MainController?btnAction=admin&adminAction=render", {
                method: 'GET'
            })
                    .then(rs => rs.json())
                    .then(data => {
                        const table = $('#example').DataTable({

                            data: data
                            ,
                            'columns': [
//                                {
//                                    className: 'dt-control',
//                                    orderable: false,
//                                    data: null,
//                                    defaultContent: ''
//                                },
                                {'data': 'shopID'},
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
                        $('#example tbody').on('click', 'td.dt-control', function () {
                            var tr = $(this).closest('tr');
                            var row = table.row(tr);
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
                        
//                      add data to chart   

                        var chart = new CanvasJS.Chart("productChart", {
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
                        var chart1 = new CanvasJS.Chart("userChart", {
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
                        chart.render();
                        chart1.render();
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

    </script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</html>