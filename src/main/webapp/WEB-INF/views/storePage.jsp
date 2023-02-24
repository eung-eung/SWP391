<%-- 
    Document   : storePage
    Created on : Feb 5, 2023, 10:24:44 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <header class="header">
            <div class="header-top">
                <div class="container">

                    <div class="header-top-content">
                        <div class="row">
                            <div class="col-left">
                                <div class="col-left-content">Chào mừng Thiện đến với chúng tôi</div>
                            </div>
                            <div class="col-right">
                                <div class="navigation-user">
                                    <ul class="navigation-user-selection">
                                        <li class="navigation-user-item">
                                            <a href="#">
                                                <i class="fa-solid fa-lock"></i>
                                                Sign in
                                            </a>
                                        </li>
                                        <li class="navigation-user-item">
                                            <a href="#" class="navigation-user-action">
                                                <i class="fa-solid fa-user"></i>
                                                <span>My Account</span>
                                                <i class="fa-solid fa-angle-down"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End header top -->
            <div class="header-center">
                <div class="container">

                    <div class="header-center-row">
                        <div class="header-center-col">
                            <div class="header-logo-container">
                                <a href="" class="logo">
                                    <img class="header-logo" src="assets/images/logo3.png" alt="">
                                </a>
                            </div>

                        </div>
                        <div class="header-center-col">
                            <nav class="menu">
                                <ul class="menu-list">
                                    <li class="menu-list-item">
                                        <a class="menu-list-item-action" href="#">Home</a>
                                    </li>
                                    <!-- <li class="menu-list-item">
                                        <span class="badge-hot">Hot</span>
                                        <a class="menu-list-item-action" href="#">Big Deals</a>
                                    </li> -->
                                </ul>
                            </nav>
                        </div>
                        <div class="header-center-col">
                            <div class="contact-container">
                                <div class="contact-inner">
                                    <i class="fa-solid fa-headphones"></i>
                                    <div class="phone">
                                        <strong>Contact us: </strong>
                                        <span class="phone">9999999</span><br>
                                    </div>
                                    <div class="email">
                                        <span>Email: </span>
                                        <span>adasdasd@gmail.com</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="header-bottom">
                <div class="container">

                    <div class="row-header-bottom">
                        <div class="header-bottom-left">
                            <div>
                                <a class="menu-title">
                                    <i class="fa-solid fa-align-left"></i>
                                    <span>Các loại sản phẩm</span>
                                    <i class="fa-regular fa-circle-down down"></i>
                                </a>
                                <div class="menu-categories is-hover">
                                    <ul class="menu-categories-list">
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-shirt"></i>Fashion
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-kitchen-set"></i>Kitchen
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-computer"></i>Computer
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-bag-shopping"></i>Bags
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-regular fa-clock"></i>Watches
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-mobile"></i>Smartphone
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-cookie-bite"></i>Foods
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Cosmetics
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Cosmetics
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Cosmetics
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Cosmetics
                                            </a>
                                        </li>
                                        <li class="menu-categories-item loadmore">
                                            <div class="menu-categories-item-action">
                                                <i class="fa-solid fa-circle-plus"></i>
                                                <span class="more-view">More Categories</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="header-bottom-right">
                            <div class="row-header-bottom-right">
                                <div class="header-bottom-search">
                                    <div class="input-group">
                                        <input type="text" class="search-input" placeholder="Search">
                                        <div class="search-icon">
                                            <button type="submit" class="search-button"><i
                                                    class="fa-solid fa-magnifying-glass"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="header-bottom-cart">
                                    <a href="" class="cart-button"><i class="fa-solid fa-cart-shopping cart-icon"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="breadcrumbs">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">
                        <i class="fa-solid fa-house"></i>
                        <a href="#" class="breadcrumb-label">Home</a>
                    </li>
                    <li class="breadcrumb-item">
                        <i class="fa-solid fa-angle-right"></i>
                        <a href="#" class="breadcrumb-label">Tên seller</a>
                    </li>

                </ul>
            </div>
            <div class="body">
                <div class="store-header">
                    <div class="store-header-name">
                        <div class="store-header-avatar">
                            <img src="assets/images/logo.png" alt="">
                        </div>
                        <div class="store-header-name">
                            Tên seller
                        </div>
                    </div>
                    <div class="store-overviews">
                        <div class="store-overview">
                            <i class="fa-solid fa-store"></i>
                            <span class="overview-title">Sản phẩm:</span>
                            <span class="overview-text">10</span>
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
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                        <div class="product">
                            <div class="product-block">
                                <div class="product-content">
                                    <div class="top-block">
                                        <a href="#" class="product-content-image">
                                            <img src="assets/images/item-content.jpg" alt="">
                                        </a>

                                    </div>
                                    <div class="bottom-block">
                                        <h4 class="card-title">
                                            <a href="#">ABVBDU</a>
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
                                            <span class="price price-after-discount">300000vnd</span>
                                            <span class="price price-without-discount">500000vnd</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                    </div>
                </div>
            </div>
        </div>
    </body>
        <script <c:url value="/assets/Javascript/handleMenuCategories.js" />> </script>
 


</html>