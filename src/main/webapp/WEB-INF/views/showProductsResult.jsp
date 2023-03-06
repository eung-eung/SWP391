<%-- 
    Document   : showProductsResult
    Created on : Feb 5, 2023, 10:26:01 PM
    Author     : boyvi
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="vi-VN"/>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
              rel="stylesheet">

        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/showProductByCategoryPage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />" />

        <title>Document</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        ${sessionScope.user}
        <c:if test="${empty sessionScope.listCategory}">
            <script>
                window.location.href = "<c:url value="/" />"
            </script>
        </c:if>
        <!-- body -->
        <div class="main-body">
            <div class="container">
                <!-- breadcrumbs -->
                <div class="breadcrumbs">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item">
                            <i class="fa-solid fa-house"></i>
                            <a href="<c:url value="/MainController" />" class="breadcrumb-label">Home</a>
                        </li>
                        <li class="breadcrumb-item">

                            <c:forEach items="${sessionScope.listCategory}" var="categoryItem3">
                                <c:if test="${categoryItem3.categoryID == param.categoryID}">
                                    <i class="fa-solid fa-angle-right"></i><a href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${categoryItem3.categoryID}"></c:url>"  class="breadcrumb-label">  ${categoryItem3.name}</a>
                                    </c:if>
                                </c:forEach>

                        </li>

                    </ul>
                </div>

                <!--  -->
                <div class="row-sidebar">
                    <!-- left: sidebar -->
                    <div class="sidebar-categories">
                        <div class="block-sidebar-title">
                            <h5 class="sidebar-title"><i class="fa-regular fa-gem"></i>Các loại sản phẩm</h5>
                        </div>
                        <div class="block-sidebar-content">
                            <ul class="nav-list">
                                <c:forEach items="${sessionScope.listCategory}" var="c">
                                    <li class="nav-list-item">
                                        <a class="nav-list-action" href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${c.categoryID}&orderBy=popular"></c:url>" class="menu-categories-item-action">
                                            ${c.icon}${c.name}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- right:detail-block -->
                    <div class="product-detail-container">
                        <c:if test="${ not empty param.searchValue}">
                            <h3 style="padding: 16px">Kết quả tìm kiếm cho `${param.searchValue}`</h3>
                        </c:if>

                        <div class="product-detail-by-category">
                            <div class="nav-product-detail">
                                <h3 class="product-category-title">
                                    <c:forEach items="${sessionScope.listCategory}" var="categoryItem2">
                                        <c:if test="${categoryItem2.categoryID == param.categoryID}">
                                            ${categoryItem2.name}
                                        </c:if>
                                    </c:forEach>
                                </h3>
                                <div class="sort-by">
                                    <label for="sort">Sort By:</label>
                                    <select id="sort">
                                        <option selected hidden value="">
                                            <c:set var="selectSort" value="${param.orderBy}" />
                                            <jsp:useBean id="selectSort" type="java.lang.String" />
                                            <c:if test='<%=selectSort.equalsIgnoreCase("popular")%>'>Phổ biến</c:if>
                                            <c:if test='<%=selectSort.equalsIgnoreCase("asc")%>'>Giá tăng dần</c:if>
                                            <c:if test='<%=selectSort.equalsIgnoreCase("desc")%>'>Giá giảm dần</c:if>
                                            </option>
                                            <option value="popular">Phổ biến</option>
                                            <option value="asc">Giá tăng dần</option>
                                            <option value="desc">Giá giảm dần</option>
                                        </select>

                                    </div>

                                    <script>
                                        document.querySelector('#sort').addEventListener('change', (event) => {
                                            let url = window.location.href;
                                            let locate = url.indexOf("&orderBy");
                                            if (locate === -1) {
                                                url = url + "&orderBy=" + event.target.value;
                                            } else {
                                                url = url.slice(0, locate) + "&orderBy=" + event.target.value;
                                            }

                                            location.href = url;
                                        });
                                    </script>

                                </div>
                                <div class="products-list">
                      
                                <c:forEach items="${productListByCateID}" varStatus="loop"  var="productByCateID">

                                    <div class="product">
                                        <div class="product-block">
                                            <div class="product-content">
                                                <div class="top-block">

                                                    <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=${productByCateID.productID}"></c:url>"class="product-content-image">
                                                        <c:forEach items="${imageList}" var="image">
                                                            <c:if test="${image.productID == productByCateID.productID}">
                                                                <img src="${image.url}" alt="">
                                                            </c:if>

                                                        </c:forEach>   

                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="<c:url value="/MainController?btnAction=product&productAction=showDetail&productID=${productByCateID.productID}" />">${productByCateID.name}</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="price-block">
                                                        <span class="price price-after-discount"><fmt:formatNumber value="${productByCateID.price}" type="currency" /></span>
                                                        <!--<span class="price price-without-discount">500000vnd</span>-->
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:forEach items="${listSearched}"  var="productByName">

                                    <div class="product">
                                        <div class="product-block">
                                            <div class="product-content">
                                                <div class="top-block">

                                                    <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=${productByName.productID}"></c:url>" class="product-content-image">
                                                        <c:forEach items="${listMainImg}" var="mainIMG">
                                                            <c:if test="${mainIMG.productID == productByName.productID}">
                                                                <img src="${mainIMG.url}" alt="">
                                                            </c:if>

                                                        </c:forEach>   

                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="<c:url value="/MainController?btnAction=product&productAction=showDetail&productID=${productByName.productID}" />">${productByName.name}</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i
                                                                        class="fa-solid fa-star rating-star-full"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="price-block">
                                                        <span class="price price-after-discount"><fmt:formatNumber value="${productByName.price}" type="currency" /></span>
                                                        <!--<span class="price price-without-discount">500000vnd</span>-->
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--  -->

                                <!--  -->
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </body>


</html>