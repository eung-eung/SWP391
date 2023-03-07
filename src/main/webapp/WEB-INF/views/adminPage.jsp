<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    map = new HashMap<Object, Object>();
    map.put("label", "Work");
    map.put("y", 44);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Gym");
    map.put("y", 9);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Leisure");
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Routines");
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Nap");
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Sleep");
    map.put("y", 29);
    list.add(map);

    String dataPoints = gsonObj.toJson(list);
%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
                  rel="stylesheet">
            <link type="text/css" rel="stylesheet" href="../assets/css/adminPage.css" />
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
            
            <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
            <script
            src="https://www.paypal.com/sdk/js?client-id=AVPNRTv0apljAkWHaqZyMDTbKipmIQ_HpbKISKwAdC4_IJtCIVck8tSG8M7k6DgiCZEvrctor-faOGWT&currency=USD"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>
            <title>Admin Page</title>
        </head>


        <title>Document</title>
    </head>



    <body>
        <jsp:include page="header.jsp" />

        <div class = "bottom_header">
            <div class="bottom_header_text shop_list">
                Shop list
            </div>
            <div class="bottom_header_text dashboard">
                Dashboard
            </div>
        </div>

        <div class="adminDashboard" style="display: none" >
            <div id="chartContainer" style="height: 370px; width: 100%"></div>
            <div id="chartContainer1" style="height: 370px; width: 100%"></div>
        </div>

        <div class = "adminTable">
            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th></th>
                        <th>Shop ID</th>
                        <th>Shop name</th>
                        <th>User ID</th>
                        <th>Created at</th>
                        <th>Status</th>
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

    </body>

    <script>

        document.querySelectorAll(".bottom_header_text").forEach((item) => {
            const table = document.querySelector(".adminTable");
            const dashboard = document.querySelector(".adminDashboard");
            item.addEventListener("click", (event) => {
                if (event.target.classList.contains("shop_list")) {
                    table.style.display = "block";
                    dashboard.style.display = "none";
                } else {
                    table.style.display = "none";
                    dashboard.style.display = "flex";
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
                                {
                                    className: 'dt-control',
                                    orderable: false,
                                    data: null,
                                    defaultContent: ''
                                },
                                {'data': 'shopID'},
                                {'data': 'shopName'},
                                {'data': 'userID'},
                                {'data': 'createAt'},
                                {'data': 'status'}
                            ],
                            order: [[1, 'asc']]
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
        });

        function format(d) {
            // `d` is the original data object for the row
            let data = "";
            d.product.forEach(element => {
                data = data + getProduct(element);
            });
            console.log(data);
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
        
        console.log(<%out.print(dataPoints);%>);

        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                theme: "light2", // "light1", "dark1", "dark2"
                animationEnabled: true,
                title: {
                    text: "user"
                },
                data: [{
                        type: "pie",
                        toolTipContent: "<b>{label}</b>: {y}%",
                        indexLabelFontSize: 16,
                        indexLabel: "{label} - {y}%",
                        dataPoints: <%out.print(dataPoints);%>
                    }]
            });
            
            var chart1 = new CanvasJS.Chart("chartContainer1", {
                theme: "light2", // "light1", "dark1", "dark2"
                animationEnabled: true,
                title: {
                    text: "user"
                },
                data: [{
                        type: "pie",
                        toolTipContent: "<b>{label}</b>: {y}%",
                        indexLabelFontSize: 16,
                        indexLabel: "{label} - {y}%",
                        dataPoints: <%out.print(dataPoints);%>
                    }]
            });
            
            chart.render();
            chart1.render();

        };
    </script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</html>