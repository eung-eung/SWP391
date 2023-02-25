<%-- 
    Document   : storePage
    Created on : Feb 5, 2023, 10:24:44 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi-VN"/>
<!DOCTYPE html>
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
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/cartPage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/storePage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/showProductByCategoryPage.css" />" />

        <title>Document</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">
            <div class="breadcrumbs">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">
                        <i class="fa-solid fa-house"></i>
                        <a href="#" class="breadcrumb-label">Home</a>
                    </li>
                    <li class="breadcrumb-item">
                        <i class="fa-solid fa-angle-right"></i>
                        <a href="<c:url value="MainController?btnAction=shop&shopAction=show&shopID=${shop.shopID}"/>" class="breadcrumb-label">${shop.shopName}</a>
                    </li>

                </ul>
            </div>
            <div class="body">
                <div class="store-header">
                    <div class="store-header-name">
                        <div class="store-header-avatar">
                            <img src="${avatar}" alt="">
                        </div>
                        <div class="store-header-name">
                      ${shop.shopName}
                        </div>
                    </div>

                    <div class="store-overviews">
                        <div class="store-overview">
                            <i class="fa-solid fa-store"></i>
                            <span class="overview-title">Sản phẩm:</span>
                            <span class="overview-text">${total}</span>
                        </div>

                        <div class="store-overview">
                            <i class="fa-solid fa-star"></i>
                            <span class="overview-title">Đánh giá:</span>
                            <span class="overview-text">4</span>
                        </div>
                        <div class="store-overview">
                            <a href="#">
                                <i class="fa-regular fa-comments"></i>
                                <span>Chat</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="store-products">
                    <h3 class="store-products-title">Các sản phẩm</h3>
                    <div class="products-list">

                        <c:forEach items="${listProductsShop}" var="p">
                            <div class="product">
                                <div class="product-block">
                                    <div class="product-content">
                                        <div class="top-block">
                                            <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=${p.productID}"></c:url>" class="product-content-image">
                                                <img src="${p.mainImg.url}" alt="">
                                            </a>

                                        </div>
                                        <div class="bottom-block">
                                            <h4 class="card-title">
                                                <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=${productByName.productID}"></c:url>">${p.name}</a>
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
                                                <span class="price price-after-discount"><fmt:formatNumber value="${p.price}" type="currency" /></span>
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
    </body>
    <script <c:url value="/assets/Javascript/handleMenuCategories.js" />></script>



</html>