<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
                rel="stylesheet">
            <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
            <script
                src="https://www.paypal.com/sdk/js?client-id=AVPNRTv0apljAkWHaqZyMDTbKipmIQ_HpbKISKwAdC4_IJtCIVck8tSG8M7k6DgiCZEvrctor-faOGWT&currency=USD"></script>
            <link type="text/css" rel="stylesheet" href="<c:url value=" /assets/css/homePage.css" />" />
            <link type="text/css" rel="stylesheet" href="<c:url value=" /assets/css/detailProduct.css" />"
            />
            <link type="text/css" rel="stylesheet" href="<c:url value=" /assets/css/cartPage.css" />" />


            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script type="text/javascript" charset="utf8"
                src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>
            <title>JSP Page</title>
        </head>


        <title>Document</title>
</head>



<body>
    <jsp:include page="header.jsp" />

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
</body>

<script>
    $(document).ready(function () {
        fetch("MainController?btnAction=admin&adminAction=render", {
            method: 'GET'
        })
            .then(rs => rs.json())
            .then(data => {

                console.log(data)
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
                        { 'data': 'shopID' },
                        { 'data': 'shopName' },
                        { 'data': 'userID' },
                        { 'data': 'createAt' },
                        { 'data': 'status' }
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
    })

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
</script>

</html>