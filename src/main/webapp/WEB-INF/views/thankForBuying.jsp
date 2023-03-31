<%-- 
    Document   : thankForBuying
    Created on : Mar 31, 2023, 5:24:29 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .grid-thanks{
            display: grid;
            grid-template-columns: repeat(4,1fr);
        }
        .grid-thanks img{
            grid-column: 2/4;
            width: 100%;
        }
        .button-trans{
            align-self: center;
            width: 50%;
            background-color: #EA4C89;
            border-radius: 8px;
            border-style: none;
            box-sizing: border-box;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-block;
            font-family: "Haas Grot Text R Web", "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight: 500;
            height: 40px;
            line-height: 20px;
            list-style: none;
            margin: 0;
            outline: none;
            padding: 10px 16px;
            position: relative;
            text-align: center;
            text-decoration: none;
            transition: color 100ms;
            vertical-align: baseline;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }
        .button-trans:hover,
        .button-trans:focus {
            background-color: #F082AC;
        }
        .button-box{
            grid-column: 4/5;
            align-self: center;
        }
    </style>
    <body>
        <jsp:include page="../views/header.jsp"/>
        <div class="container">
            <div class="grid-thanks">
                <img src="assets/images/download.jpg" />
                <div class="button-box">
                    <a class="button-trans" href="<c:url value="/MainController?btnAction=user&userAction=transaction"/>">Lịch sử giao dịch</a>
                    <a class="button-trans" style="margin-top: 40px" href="<c:url value="/"/>">Home</a>
                </div>

            </div>

        </div>

    </body>
</html>
