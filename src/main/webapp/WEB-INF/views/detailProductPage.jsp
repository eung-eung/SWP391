<%-- 
    Document   : detailProductPage
    Created on : Feb 5, 2023, 10:25:14 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <script src="https://kit.fontawesome.com/330a21053c.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;1,100;1,300&display=swap"
              rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/swiperHomePage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />" />


        <title>Product</title>
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
                                                <i class="fa-solid fa-shirt"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-kitchen-set"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-computer"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-bag-shopping"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-regular fa-clock"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-mobile"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-cookie-bite"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item">
                                            <a href="" class="menu-categories-item-action">
                                                <i class="fa-solid fa-eye-dropper"></i>Tên loại
                                            </a>
                                        </li>
                                        <li class="menu-categories-item loadmore">
                                            <div class="menu-categories-item-action">
                                                <i class="fa-solid fa-circle-plus"></i>
                                                <span class="more-view">Xem Thêm</span>
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
                            <a href="#" class="breadcrumb-label">Tên loại</a>
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
                                <li class="nav-list-item">
                                    <a href="#" class="nav-list-action">Tên loại</a>
                                </li>

                                <li class="nav-list-item">
                                    <a href="#" class="nav-list-action">Tên loại</a>
                                </li>
                                <li class="nav-list-item">
                                    <a href="#" class="nav-list-action">Tên loại</a>
                                </li>
                                <li class="nav-list-item">
                                    <a href="#" class="nav-list-action">Tên loại</a>
                                </li>
                                <li class="nav-list-item">
                                    <a href="#" class="nav-list-action">Tên loại</a>
                                </li>
                                <li class="nav-list-item">
                                    <a href="#" class="nav-list-action">Tên loại</a>
                                </li>
                                <li class="nav-list-item">
                                    <a href="#" class="nav-list-action">Tên loại</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- right:detail-block -->
                    <div class="product-detail-container">

                        <!-- left: right-detail-block/images -->
                        <div class="product-view-images">
                            <div class="product-view-image">
                                <div class="product-view-image-main">
                                    <a href="#">
                                        <img id="image" src="assets/images/bag-thumbnail1.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- thumbnails -->
                            <div class="swiper mySwiper">
                                <ul class="swiper-wrapper product-view-thumbnails">
                                    <li class="swiper-slide product-view-thumbnail">
                                        <a href="#" class="product-view-thumnail-link active">
                                            <img class="img-thumbnail" src="assets/images/bag-thumbnail1.jpg" alt=""
                                                 onmouseover="hoverToShowImage(this)">
                                        </a>
                                    </li>
                                    <li class="swiper-slide product-view-thumbnail">
                                        <a href="#" class="product-view-thumnail-link">
                                            <img class="img-thumbnail" src="assets/images/bag-thumbnail2.jpg" alt=""
                                                 onmouseover="hoverToShowImage(this)">
                                        </a>
                                    </li>
                                    <li class="swiper-slide product-view-thumbnail">
                                        <a href="#" class="product-view-thumnail-link">
                                            <img class="img-thumbnail" src="assets/images/bag-thumbnail3.jpg" alt=""
                                                 onmouseover="hoverToShowImage(this)">
                                        </a>
                                    </li>
                                    <li class="swiper-slide product-view-thumbnail">
                                        <a href="#" class="product-view-thumnail-link">
                                            <img class="img-thumbnail" src="assets/images/item-fashion.jpg" alt=""
                                                 onmouseover="hoverToShowImage(this)">
                                        </a>
                                    </li>
                                    <li class="swiper-slide product-view-thumbnail">
                                        <a href="#" class="product-view-thumnail-link">
                                            <img class="img-thumbnail" src="assets/images/item-fashion.jpg" alt=""
                                                 onmouseover="hoverToShowImage(this)">
                                        </a>
                                    </li>

                                </ul>
                                <!-- <div class="swiper-pagination"></div> -->
                            </div>
                            <script>
                                var swiper = new Swiper(".mySwiper", {
                                    slidesPerView: 3,
                                    spaceBetween: 30,
                                    freeMode: true,
                                    pagination: {
                                        el: ".swiper-pagination",
                                        clickable: true,
                                    },
                                });
                            </script>
                        </div>
                        <!-- right: right-detail-block.details -->
                        <div class="product-view-details">
                            <div class="product-view-details-container">
                                <!-- company -->
                                <p class="product-view-company">Adidas</p>
                                <!-- name product -->
                                <h1 class="product-view-title">ABVBDU</h1>
                                <!-- rating + review form -->
                                <div class="product-view-ratings">
                                    <span class="icon fa-solid fa-star rating-star-full"></span>
                                    <span class="icon fa-solid fa-star rating-star-full"></span>
                                    <span class="icon fa-solid fa-star rating-star-full"></span>
                                    <span class="icon fa-solid fa-star rating-star-full"></span>
                                    <span class="icon fa-solid fa-star rating-star-full"></span>
                                    <span class="product-view-reviewLink">
                                        <a href="#" class="modal-review">Review</a>
                                    </span>
                                    <!-- form review -->
                                    <div id="modal-review-form">

                                    </div>
                                </div>
                                <!-- end ratings + form review -->

                                <!--  product-price -->
                                <div class="product-view-price">
                                    <span class="price price-after-discount">300000vnd</span>
                                    <span class="price price-without-discount">400000vnd</span>
                                </div>
                                <!-- end product-price -->

                                <!-- product infor -->
                                <div class="product-view-info">
                                    <dl class="product-view-description-list">
                                        <dt class="product-view-name">Người bán</dt>
                                        <dd class="product-view-value">
                                            <a href="#"><span>Adidas</span></a>
                                        </dd>
                                        <!-- 
                                        <dt class="product-view-name">Condition</dt>
                                        <dd class="product-view-value">
                                            New
                                        </dd> -->
                                    </dl>
                                </div>

                            </div>
                        </div>
                        <!-- product view option form -->
                        <div class="product-view-details">
                            <div class="product-view-option">
                                <form id="product-view-option-form">
                                    <div class="form-field">
                                        <label for="quantity" class="form-label">Số lượng:</label>
                                        <div class="form-in-de-crement">
                                            <input class="form-input" type="number" id="quantity" value="1" min="1">
                                            <div id="increase" onclick="increaseValue()"><i
                                                    class="fa-solid fa-angle-up"></i></div>
                                            <div id="decrease" onclick="decreaseValue()"><i
                                                    class="fa-solid fa-angle-down"></i></div>
                                        </div>
                                        <div class="form-action">
                                            <input type="submit" id="form-action-addToCart" class="addToCart-button"
                                                   value="Thêm vào giỏ hàng">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="product-view-description">
                            <ul class="tabs">
                                <li class="tab active">
                                    <a class="tab-title">Mô Tả</a>
                                </li>
                                <li class="tab">
                                    <a class="tab-title">Reviews</a>
                                </li>

                            </ul>
                            <div class="tabs-contents">
                                <div class="tab-content active" id="tab-description">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti doloremque
                                        numquam expedita iste nihil vero amet suscipit cum, dicta nobis aspernatur
                                        dolorum in esse, enim voluptate, ratione accusamus nemo. Illo!</p>
                                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Modi sapiente fugit
                                        sint, amet consequatur excepturi ipsam neque. Voluptatibus hic necessitatibus
                                        non tempore doloribus aut tenetur recusandae soluta pariatur dicta? Hic.</p>
                                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Odit eligendi nemo
                                        voluptatibus numquam veniam. Eveniet, sequi ea, perspiciatis dignissimos
                                        quisquam, dolor inventore vero harum vel asperiores natus possimus molestias a?
                                    </p>

                                </div>
                                <div class="tab-content" id="tab-review">
                                    <h4 class="tab-review-title">2 reviews</h4>
                                    <div class="tab-review-content" id="review-content">
                                        <ul class="review-list">
                                            <li class="product-review">
                                                <div class="review-container">
                                                    <header class="review-header">
                                                        <span class="product-ratings">
                                                            <span
                                                                class="fa-solid fa-star rating-star rating-star-full"></span>
                                                            <span
                                                                class="fa-solid fa-star rating-star rating-star-full"></span>
                                                            <span
                                                                class="fa-solid fa-star rating-star rating-star-full"></span>
                                                            <span
                                                                class="fa-solid fa-star rating-star rating-star-full"></span>
                                                            <span
                                                                class="fa-solid fa-star rating-star rating-star-full"></span>

                                                            <span class="rating-number">5</span>
                                                        </span>
                                                        <h5 class="product-review-title">Cực kì hài lòng</h5>
                                                        <p class="product-review-author">Thái Thanh Trần đã đánh giá vào
                                                            8/1/2023</p>
                                                    </header>
                                                    <p class="product-review-body">
                                                        Hàng sang xịn mịn ^^
                                                    </p>
                                                </div>
                                            </li>
                                            <!-- cmt 2 -->
                                            <li class="product-review">
                                                <div class="review-container">
                                                    <header class="review-header">
                                                        <span class="product-ratings">
                                                            <span class="fa-solid fa-star rating-star-full"></span>
                                                            <span class="fa-solid fa-star rating-star-full"></span>
                                                            <span class="fa-solid fa-star rating-star-full"></span>
                                                            <span class="fa-solid fa-star rating-star-full"></span>
                                                            <span class="fa-solid fa-star"></span>
                                                            <span class="rating-number">4</span>
                                                        </span>
                                                        <h5 class="product-review-title">Hài lòng</h5>
                                                        <p class="product-review-author">Thiện đã đánh giá vào
                                                            8/1/2023</p>
                                                    </header>
                                                    <p class="product-review-body">
                                                        Hàng sang xịn mịn ^^
                                                    </p>
                                                </div>
                                            </li>
                                            <!--  -->
                                        </ul>
                                    </div>
                                </div>
                                <!-- end tab review -->
                            </div>
                        </div>
                        <!-- related Product -->


                    </div>

                </div>
                <div class="related-product-container">
                    <div class="related-product-tab">
                        <h4 class="tab-title">Sản phẩm tương tự</h4>
                    </div>

                    <div class="swiper mySwiper2 related-product-list">
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
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
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
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
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
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
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
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
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
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
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
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
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
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
                                                        <span class="icon"><i
                                                                class="fa-solid fa-star rating-star-full"></i></span>
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

                    </div>
                </div>
            </div>
        </div>
        <div class="modal-review-form-background"></div>
        <div class="modal-review-form modal-review-form-open">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-header">
                        <h3 class="modal-header-title">Write a review</h3>
                    </div>
                    <div class="modal-close">
                        <a href="#" class="modal-close-button fa-solid fa-x">
                        </a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="product-detail-review-container">
                        <!-- image -->
                        <div class="product-detail-review-image">
                            <img src="assets/images/bag-thumbnail1.jpg">
                        </div>
                        <!-- product name -->
                        <h3 class="product-detail-review-name">ABVBDU</h3>
                    </div>
                    <div class="form-review-container">
                        <div class="form-field-review">
                            <!-- review rating -->
                            <div class="form-field-rating">
                                <label>Rating</label>
                                <span class="rating-title"></span>
                                <span class="icon fa-solid fa-star star-review"></span>
                                <span class="icon fa-solid fa-star star-review"></span>
                                <span class="icon fa-solid fa-star star-review"></span>
                                <span class="icon fa-solid fa-star star-review"></span>
                                <span class="icon fa-solid fa-star star-review"></span>
                            </div>
                            <!-- name user for review -->
                            <div class="form-field-review form-field-input">
                                <label for="name">Name</label>
                                <input type="text" id="name" class="form-input">
                            </div>
                            <div class="form-field-review form-field-input">
                                <label>Review title</label>
                                <div class="form-input" id="title"></div>
                            </div>
                            <div class="form-field-review form-field-input">
                                <label for="field-text">Comments</label>
                                <textarea id="field-text"></textarea>
                            </div>
                            <div class="form-field-review form-field-submit">
                                <input type="submit" class="submit-review-button" value="post review">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var swiper = new Swiper(" .mySwiper2", {slidesPerView: 6, spaceBetween: 5, });</script>
    </body>

    <script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>

    <script src="<c:url value="/assets/Javascript/handleDetailProductPage.js" />"></script>
</html>