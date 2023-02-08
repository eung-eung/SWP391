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
        <jsp:include page="header.jsp"/>
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

<script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script>

// function to get response
    function loginByGoogle(response) {
        console.log(response)
        const responsePayload = decodeJwtResponse(response.credential);
        console.log(responsePayload)
        const email = responsePayload.email;
        const avatar=responsePayload.picture;

        fetch("<c:url value="/MainController?btnAction=user&userAction=login&email="/>" + email + "&picture=" + avatar, {
            method: "GET"
        }).then(() => {

            window.location.href = '<c:url value="/MainController"/>'

        })


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
    let usernameDiv = document.querySelector('.email-need-split');
    let emailNeedSplit = document.querySelector('.email-need-split').dataset.email;
    let username = emailNeedSplit.substring(0, emailNeedSplit.lastIndexOf("@"));
    usernameDiv.innerHTML = username;
</script>
</html>