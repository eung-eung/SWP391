<%-- 
    Document   : homePage
    Created on : Feb 5, 2023, 8:33:40 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/swiperHomePage.css" />" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
              rel="stylesheet">
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
                                             <span id="g_id_onload"
                                            data-client_id="1091790792976-ks6ah0826cgh92qtm3qo1k5n6cpov2mg.apps.googleusercontent.com"
                                            data-context="signin" data-ux_mode="popup" data-callback="loginByGoogle"
                                            data-auto_select="true" data-itp_support="true">
                                        </span>

                                        <span class="g_id_signin" data-type="icon" data-shape="circle"
                                            data-theme="outline" data-text="signin_with" data-size="medium">
                                        </span>
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
                                <div class="menu-categories">
                                    <ul class="menu-categories-list">
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-shirt"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-kitchen-set"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-computer"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-bag-shopping"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-regular fa-clock"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-mobile"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-cookie-bite"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên Loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item loadmore">
                                            <div class="menu-categories-item-action">
                                                <i class="fa-solid fa-circle-plus"></i>
                                                <span class="more-view">Xem thêm</span>
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
                                        <input type="text" class="search-input" placeholder="Tìm kiếm...">
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
        <section class="slideShow">
            <div class="container">
                <div class="row-slideShow">
                    <div class="col-slideShow-left">
                    </div>
                    <div class="col-slideShow-right">
                        <div class="row-sldeShow-right">
                            <div class="swiper mySlideShow slide-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide"><img src="assets/images/slide1.jpg" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/images/slide2.jpg" alt=""></div>
                                    <div class="swiper-slide"><img src="assets/images/slide3.jpg" alt=""></div>

                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                            <div class="banner-container">
                                <div class="banner">
                                    <a href="#">
                                        <img src="assets/images/banner1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="banner">
                                    <a>
                                        <img src="assets/images/banner2.jpg" alt="">
                                    </a>
                                </div>
                                <div class="banner">
                                    <a>
                                        <img src="assets/images/banner3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="main-body">
            <div class="container">
                <div class="main-body-full">
                    <div class="popular-categories">
                        <h5 class="block-title">
                            Các loại sản phẩm phổ biến
                        </h5>
                        <div class="block-content">
                            <div class="banner">
                                <div class="banner-image">
                                    <a href="#">
                                        <img src="assets/images/banner4.jpg" alt="">
                                    </a>
                                </div>
                                <div class="banner-caption">
                                    <div class="banner-caption-body">
                                        <h5 class="banner-caption-title">Loại Sản phấm</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="banner">
                                <div class="banner-image">
                                    <a href="#">
                                        <img src="assets/images/banner5.jpg" alt="">
                                    </a>
                                </div>
                                <div class="banner-caption">
                                    <div class="banner-caption-body">
                                        <h5 class="banner-caption-title">Loại Sản phấm</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="banner">
                                <div class="banner-image">
                                    <a href="#">
                                        <img src="assets/images/banner6.jpg" alt="">
                                    </a>
                                </div>
                                <div class="banner-caption">
                                    <div class="banner-caption-body">
                                        <h5 class="banner-caption-title">Loại Sản phấm</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="banner">
                                <div class="banner-image">
                                    <a href="#">
                                        <img src="assets/images/banner7.jpg" alt="">
                                    </a>
                                </div>
                                <div class="banner-caption">
                                    <div class="banner-caption-body">
                                        <h5 class="banner-caption-title">Loại Sản phấm</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="banner">
                                <div class="banner-image">
                                    <a href="#">
                                        <img src="assets/images/banner8.jpg" alt="">
                                    </a>
                                </div>
                                <div class="banner-caption">
                                    <div class="banner-caption-body">
                                        <h5 class="banner-caption-title">Loại Sản phấm</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-product">
                        <div class="list-product-header">
                            <h3 class="block-title">
                                <a href="#">Loại sản phẩm</a>
                            </h3>
                            <div class="list-header-tab">

                                <ul class="list-tabs">
                                    <li class="tab">
                                        <a href="#" class="tab-title">BestSelling</a>
                                    </li>
                                    <li class="tab">
                                        <a href="#" class="tab-title">Xem tất cả</a>
                                    </li>

                                </ul>

                            </div>

                        </div>
                        <!-- end header tab -->

                        <div class="list-product-tab">
                            <div class="list-product-image">
                                <div class="banner">
                                    <div class="banner-image">
                                        <a href="#"><img src="assets/images/verticalBanner1.jpg" alt=""></a>
                                    </div>
                                    <div class="gif-box">
                                        <div class="gif-background">
                                            <div class="gif-image"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="swiper mySwiper2 mySwiper2-css">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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

                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                                <!-- <div class="swiper-pagination"></div> -->
                            </div>
                        </div>

                    </div>
                    <!-- list 2 -->
                    <div class="list-product">
                        <div class="list-product-header">
                            <h3 class="block-title">
                                <a href="#">Loại sản phẩm</a>
                            </h3>
                            <div class="list-header-tab">
                                <ul class="list-tabs">
                                    <li class="tab">
                                        <a href="#" class="tab-title">BestSelling</a>
                                    </li>

                                    <li class="tab">
                                        <a href="#" class="tab-title">Xem tất cả</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <!-- end header tab -->
                        <div class="list-product-tab">
                            <div class="swiper mySwiper2 mySwiper2-css">
                                <div class="swiper-wrapper">
                                    <!-- sản phấm 1 -->
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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

                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
                                                        <img src="assets/images/item-content-electronic.jpg" alt="">
                                                    </a>

                                                </div>
                                                <div class="bottom-block">
                                                    <h4 class="card-title">
                                                        <a href="#">ABVBDU</a>
                                                    </h4>
                                                    <div class="ratings">
                                                        <div class="product-rating">
                                                            <span class="rating-small">
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                                <!-- <div class="swiper-pagination"></div> -->

                            </div>
                            <div class="list-product-image">
                                <div class="banner">
                                    <div class="banner-image">
                                        <a href="#"><img src="assets/images/verticalBanner2.jpg" alt=""></a>
                                    </div>
                                    <div class="gif-box">
                                        <div class="gif-background">
                                            <div class="gif-image"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--  -->
                    <!-- List 3 -->
                    <div class="list-product">
                        <div class="list-product-header">
                            <h3 class="block-title">
                                <a href="#">Loại sản phẩm</a>
                            </h3>
                            <div class="list-header-tab">
                                <ul class="list-tabs">
                                    <li class="tab">
                                        <a href="#" class="tab-title">BestSelling</a>
                                    </li>

                                    <li class="tab">
                                        <a href="#" class="tab-title">Xem tất cả</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <!-- end header tab -->
                        <div class="list-product-tab">
                            <div class="list-product-image">
                                <div class="banner">
                                    <div class="banner-image">
                                        <a href="#"><img src="assets/images/verticalBanner3.jpg" alt=""></a>
                                    </div>
                                    <div class="gif-box">
                                        <div class="gif-background">
                                            <div class="gif-image"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="swiper mySwiper2 mySwiper2-css">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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
                                    <div class="swiper-slide slide-product">
                                        <div class="slide-product-block">
                                            <div class="slide-product-content">
                                                <div class="top-block">
                                                    <a href="#" class="slide-product-content-image">
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
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
                                                                <span class="icon"><i class="fa-regular fa-star"></i></span>
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

                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>


                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

</body>

</html>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script>
    var swiperSlideShow = new Swiper(".mySlideShow", {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        // autoplay: {
        //     delay: 2500,
        //     disableOnInteraction: false,
        // },

    });

    // 
    var swiper = new Swiper(".mySwiper2", {
        slidesPerView: 4,
        grid: {
            rows: 2,
        },
        spaceBetween: 5,

        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        // autoplay: {
        //     delay: 3500,
        //     disableOnInteraction: false,
        // }
    });
</script>

    <script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"> </script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script>
 
    // function to get response
    function loginByGoogle(response) {
        console.log(response)
        const responsePayload = decodeJwtResponse(response.credential);
        console.log(responsePayload)
        const email = responsePayload.email;
        // fetch("<c:url value=" / MainController ? btnAction = login & func=loginGoogle & email="/>" + email, {
        //     method: "GET"
        // })
        //     .then(res => res.json())
        //     .then(res => {
        //         if (res == null) {
        //             localStorage.setItem("msg", "This email is not existed in our system, please login to another one");
        //             window.location.reload();
        //         } else {
        //             window.location.href = '<c:url value="/MainController"/>'
        //         }
        //     });
        //                img.src = responsePayload.picture;
        //                getName.innerHTML = responsePayload.name;
        //                id.innerHTML = responsePayload.sub;
        //                email.innerHTML = responsePayload.email;
        //                container.style.display = 'inline-block';
        //                googleButton.style.display = 'none'
    }
    window.onload = function () {
        // also display the One Tap dialog on right side
        // important for auto login
        google.accounts.id.prompt();
    }
    // function to decode the response.credential
    function decodeJwtResponse(token) {
        var base64Url = token.split('.')[1];
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        return JSON.parse(jsonPayload);
    }
    </script>
</html>