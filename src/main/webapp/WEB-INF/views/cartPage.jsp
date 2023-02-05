<%-- 
    Document   : cartPage
    Created on : Feb 5, 2023, 10:26:25 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/homePage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/cartPage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />" />
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
        <div class="container">
            <h1 class="cart-title">Giỏ hàng của bạn</h1>
            <div class="cart-content">
                <table class="cart">
                    <thead class="cart-header">
                        <tr>
                            <th class="cart-header-item" colspan="2">Sản phẩm</th>
                            <th class="cart-header-item">Giá</th>
                            <th class="cart-header-item cart-header-quantity">Số lượng</th>
                            <th class="cart-header-item">Tổng</th>
                        </tr>
                    </thead>
                    <tbody class="cart-list">
                        <tr class="cart-item">
                            <td class="cart-item cart-item-image">
                                <img src="assets/images/bag-thumbnail1.jpg" alt="">
                            </td>
                            <td class="cart-item cart-item-title">
                                <p class="company"><a href="#">Adidas</a></p>
                                <h4 class="cart-item-name">
                                    <a href="#">
                                        avavavav
                                    </a>
                                </h4>
                            </td>
                            <td class="cart-item cart-item-price">
                                <span class="cart-item-price-value">500000vnd</span>
                            </td>
                            <td class="cart-item cart-item-quantity">
                                <div class="increment">
                                    <div style="display: flex; justify-content: center; align-items: center;">
                                        <div id="increase" onclick="increaseValue()"><i class="fa-solid fa-angle-up"></i>
                                        </div>
                                        <input class="form-input" type="number" id="quantity" value="1" min="1">

                                        <div id="decrease" onclick="decreaseValue()"><i class="fa-solid fa-angle-down"></i>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="cart-item cart-item-total">
                                <span class="cart-item-total">500000vnd</span>
                                <div class="close">
                                    <a href="#" class="modal-close-button fa-solid fa-x">
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <!--  -->
                        <tr class="cart-item">
                            <td class="cart-item cart-item-image">
                                <img src="assets/images/bag-thumbnail1.jpg" alt="">
                            </td>
                            <td class="cart-item cart-item-title">
                                <p class="company"><a href="#">Adidas</a></p>
                                <h4 class="cart-item-name">
                                    <a href="#">
                                        avavavav
                                    </a>
                                </h4>
                            </td>
                            <td class="cart-item cart-item-price">
                                <span class="cart-item-price-value">500000vnd</span>
                            </td>
                            <td class="cart-item cart-item-quantity">
                                <div class="increment">
                                    <div style="display: flex; justify-content: center; align-items: center;">
                                        <div id="increase" onclick="increaseValue()"><i class="fa-solid fa-angle-up"></i>
                                        </div>
                                        <input class="form-input" type="number" id="quantity" value="1" min="1">

                                        <div id="decrease" onclick="decreaseValue()"><i class="fa-solid fa-angle-down"></i>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="cart-item cart-item-total">
                                <span class="cart-item-total">500000vnd</span>
                                <div class="close">
                                    <a href="#" class="modal-close-button fa-solid fa-x">
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <!--  -->
                        <tr class="cart-item">
                            <td class="cart-item cart-item-image">
                                <img src="assets/images/bag-thumbnail1.jpg" alt="">
                            </td>
                            <td class="cart-item cart-item-title">
                                <p class="company"><a href="#">Adidas</a></p>
                                <h4 class="cart-item-name">
                                    <a href="#">
                                        avavavav
                                    </a>
                                </h4>
                            </td>
                            <td class="cart-item cart-item-price">
                                <span class="cart-item-price-value">500000vnd</span>
                            </td>
                            <td class="cart-item cart-item-quantity">
                                <div class="increment">
                                    <div style="display: flex; justify-content: center; align-items: center;">
                                        <div id="increase" onclick="increaseValue()"><i class="fa-solid fa-angle-up"></i>
                                        </div>
                                        <input class="form-input" type="number" id="quantity" value="1" min="1">

                                        <div id="decrease" onclick="decreaseValue()"><i class="fa-solid fa-angle-down"></i>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="cart-item cart-item-total">
                                <span class="cart-item-total">500000vnd</span>
                                <div class="close">
                                    <a href="#" class="modal-close-button fa-solid fa-x">
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <!--  -->
                        <tr class="cart-item">
                            <td class="cart-item cart-item-image">
                                <img src="assets/images/bag-thumbnail1.jpg" alt="">
                            </td>
                            <td class="cart-item cart-item-title">
                                <p class="company"><a href="#">Adidas</a></p>
                                <h4 class="cart-item-name">
                                    <a href="#">
                                        avavavav
                                    </a>
                                </h4>
                            </td>
                            <td class="cart-item cart-item-price">
                                <span class="cart-item-price-value">500000vnd</span>
                            </td>
                            <td class="cart-item cart-item-quantity">
                                <div class="increment">
                                    <div style="display: flex; justify-content: center; align-items: center;">
                                        <div id="increase" onclick="increaseValue()"><i class="fa-solid fa-angle-up"></i>
                                        </div>
                                        <input class="form-input" type="number" id="quantity" value="1" min="1">

                                        <div id="decrease" onclick="decreaseValue()"><i class="fa-solid fa-angle-down"></i>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="cart-item cart-item-total">
                                <span class="cart-item-total">500000vnd</span>
                                <div class="close">
                                    <a href="#" class="modal-close-button fa-solid fa-x">
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <!--  -->
                    </tbody>
                </table>

            </div>
            <div class="cart-totals-container">
                <ul class="cart-totals">
                    <li class="cart-total">
                        <div class="cart-total-label">
                            <strong>Địa chỉ giao hàng:</strong>
                        </div>
                        <div class="cart-total-value">
                            <a href="#">Thêm địa chỉ:</a>
                        </div>
                    </li>
                    <li class="cart-total">
                        <div class="cart-total-label">Tổng cộng:</div>
                        <div class="cart-total-value total">
                            <span>100000vnd</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="cart-action">
                <a href="#" class="checkout-button">Thanh Toán</a>
            </div>
        </div>
    </body>
    <script src="<c:url value="/assets/Javascript/handleDetailProductPage.js" />"></script>
     <script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>



</html>