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

        <!-- body -->
        <div class="main-body">
            <div class="container">
                <!-- breadcrumbs -->
                <div class="breadcrumbs">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item">
                            <i class="fa-solid fa-house"></i>
                            <a href="#" class="breadcrumb-label">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <i class="fa-solid fa-angle-right"></i>
                            <a href="#" class="breadcrumb-label">Tên loại sản phẩm</a>
                        </li>
                        <li class="breadcrumb-item">
                            <i class="fa-solid fa-angle-right"></i>
                            <a href="#" class="breadcrumb-label">Tên sản phẩm</a>
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


                                <c:forEach items="${sessionScope.listCategory}" var="categoryItem">
                                    <li class="nav-list-item">
                                        <a class="nav-list-action" href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${categoryItem.categoryID}"></c:url>" class="menu-categories-item-action">
                                            ${categoryItem.icon}${categoryItem.name}
                                        </a>

                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- right:detail-block -->
                    <div class="product-detail-container">
                        <div class="product-detail-by-category">
                            <div class="nav-product-detail">
                                <h3 class="product-category-title">Fashion</h3>
                                <div class="sort-by">
                                    <label for="sort">Sort By:</label>
                                    <select id="sort">
                                        <option selected value="rating-bestSelling">Phổ biến</option>
                                        <option value="price-ascending">Giá tăng dần</option>
                                        <option value="price-descending">Giá giảm dần</option>
                                    </select>

                                </div>
                            </div>
                            <div class="products-list">

                                <c:forEach items="${productListByCateID}" varStatus="loop"  var="productByCateID">

                                    <div class="product">
                                        <div class="product-block">
                                            <div class="product-content">
                                                <div class="top-block">

                                                    <a href="#" class="product-content-image">
                                                        <c:forEach items="${imageList}" var="image">
                                                            <c:if test="${image.productID == productByCateID.productID}">
                                                                <img src="${image.url}" alt="">
                                                            </c:if>

                                                        </c:forEach>   

                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">${productByCateID.name}</a>
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

                                <!--  -->

                                <!--  -->
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </body>

    <script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>
</html>