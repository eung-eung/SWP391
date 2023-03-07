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
        <jsp:include page="header.jsp" />

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

                            <a href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${productDetail.categoryID}&orderBy=popular"></c:url>" class="breadcrumb-label">
                                <c:forEach items="${sessionScope.listCategory}" var="cateBreadCrumb">
                                    <c:if test="${cateBreadCrumb.categoryID == productDetail.categoryID}">
                                        ${cateBreadCrumb.name}
                                    </c:if>
                                </c:forEach>
                            </a>

                        </li>
                        <li class="breadcrumb-item">
                            <i class="fa-solid fa-angle-right"></i>
                            <a href="#" class="breadcrumb-label">${productDetail.name}</a>
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
                                        <a class="nav-list-action" href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${categoryItem.categoryID}&orderBy=popular"></c:url>" class="menu-categories-item-action">
                                            ${categoryItem.icon}${categoryItem.name}
                                        </a>
                                    </li>
                                </c:forEach>
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
                                        <img id="image" src="${productDetail.getMainImg().getUrl()}" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- thumbnails -->
                            <div class="swiper mySwiper">
                                <ul class="swiper-wrapper product-view-thumbnails">
                                    <li class="swiper-slide product-view-thumbnail">
                                        <a href="#" class="product-view-thumnail-link active">
                                            <img class="img-thumbnail" src="${productDetail.getMainImg().getUrl()}" alt=""
                                                 onmouseover="hoverToShowImage(this)">
                                        </a>
                                    </li>
                                    <c:forEach items="${listNotMainImg}" var="img">
                                        <li class="swiper-slide product-view-thumbnail">
                                            <a href="#" class="product-view-thumnail-link">
                                                <img class="img-thumbnail" src="${img.getUrl()}" alt=""
                                                     onmouseover="hoverToShowImage(this)">
                                            </a>
                                        </li>
                                    </c:forEach>



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
                                <p class="product-view-company"></p>
                                <!-- name product -->
                                <h1 class="product-view-title">${productDetail.name}</h1>
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
                                    <span class="price price-after-discount">${productDetail.price}</span>
                                    <!--<span class="price price-without-discount">400000vnd</span>-->
                                    <script>document.querySelector(".price-after-discount").innerHTML = formatter.format(${productDetail.price})</script>
                                </div>
                                <!-- end product-price -->

                                <!-- product infor -->
                                <div class="product-view-info">
                                    <dl class="product-view-description-list">
                                        <dt class="product-view-name">Người bán</dt>
                                        <dd class="product-view-value">
                                            <a href="<c:url value="MainController?btnAction=shop&shopAction=show&shopID=${productDetail.shopID}" />"><span>${productDetail.shopName}</span></a>
                                        </dd>

                                        <dt class="product-view-name"></dt>
                                        <dd class="product-view-value">
                                            New
                                        </dd> 
                                    </dl>
                                </div>

                            </div>
                        </div>
                        <!-- product view option form -->
                        <div class="product-view-details">
                            <div class="product-view-option">
                                <!--                                <form id="product-view-option-form">-->
                                <div class="form-field">
                                    <label for="quantity" class="form-label">Số lượng:</label>
                                    <div class="form-in-de-crement">
                                        <input class="form-input" type="number" id="quantity" onchange="handleOnChange(this)" value="1" min="1">
                                        <div id="increase" onclick="increaseValue()"><i
                                                class="fa-solid fa-angle-up"></i></div>
                                        <div id="decrease" onclick="decreaseValue()"><i
                                                class="fa-solid fa-angle-down"></i></div>
                                    </div>
                                    <div class="form-action">
                                        <input type="submit" id="form-action-addToCart" class="addToCart-button"
                                               value="Thêm vào giỏ hàng">
                                        <input type="hidden" id="productID"value="${productDetail.productID}">
                                        <input type="hidden" id="shopID"value="${productDetail.shopID}">
                                    </div>
                                </div>
                                <!--</form>-->
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
                                    ${productDetail.description}

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
                        <div class="swiper-wrapper list-recom">

                            <!--  -->

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

<!--    <script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>-->

    <script src="<c:url value="/assets/Javascript/handleDetailProductPage.js" />"></script>

    <script>
            var user = ${empty sessionScope.user ? 1 : 2};
            function  stopAddCart(e) {
                if (${sessionScope.user.roleID ==3} || ${sessionScope.user.roleID ==4}) {
                    swal("", "Hãy chuyển sang tài khoản người mua", "warning");
                    e.preventDefault();
                }
            }
            function handleOnChange(btn) {
                if (btn.value < 0) {
                    btn.value = Math.abs(btn.value)
                } else if (btn.value == 0) {
                    btn.value = 1
                }
            }
            document.querySelector("#form-action-addToCart").addEventListener('click', function () {
                stopAddCart(this)
                let quantity = parseInt(document.querySelector("#quantity").value);
                let productID = document.querySelector("#productID").value;
                let srcImg = document.querySelector("#image").src;
                let price = document.querySelector(".price-after-discount").innerHTML;

                let shopID = document.querySelector("#shopID").value;
                let productName = document.querySelector(".product-view-title").innerHTML;
//                let productName = document.querySelector()
                console.log(shopID)
//                console.log("log" isLogined)

                if (user == 1) {
                    swal("", "Vui lòng đăng nhập để có thể thêm vào giỏ hàng", "warning");
                    return

                } else {
                    let arr = []
//                
                    let cart = JSON.parse(window.localStorage.getItem('cart'));


                    if (cart == null) {
                        let cartItem = new CartItem(productID, srcImg, quantity, price, shopID, productName);

                        window.localStorage.setItem('cart', JSON.stringify([cartItem]))


                    } else {
                        let inCart = false
                        cart.forEach(item => {
                            if (item.productID == productID) {
                                let currentQuantity = parseInt(item.quantity)
                                item.quantity = currentQuantity + quantity;
                                inCart = true
                            }

                        })
                        if (inCart == false) {
                            let cartItem = new CartItem(productID, srcImg, quantity, price, shopID, productName);
                            cart.push(cartItem)
                        }
                        window.localStorage.setItem('cart', JSON.stringify(cart))

                    }
                    swal("", "Thêm vào giỏ hàng thành công!", "success");
                }
            })

            fetch("MainController?btnAction=product&productAction=showSameCategoryProduct&categoryID=" + ${productDetail.categoryID}, {
                method: 'GET'
            })
                    .then(res => res.json())
                    .then(products => {
                        console.log(products)
                        let htmls = products.map(product => {
                            return `<div class="swiper-slide slide-product">
                                <div class="slide-product-block">
                                    <div class="slide-product-content">
                                        <div class="top-block">
                                            <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=\${product.productID}"></c:url>" class="slide-product-content-image">
                                                <img src="\${product.mainImg.url}" alt="">
                                            </a>

                                        </div>
                                        <div class="bottom-block">
                                            <h4 class="card-title">
                                                <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=\${product.productID}"></c:url>">\${product.name}</a>
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
                                                <span class="price price-after-discount">\${formatter.format(product.price)}</span>
                                         
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>`
                        })
                        document.querySelector(".list-recom").innerHTML = htmls.join("")
//                        document.querySelectorAll(".price")
                    }
                    )
    </script>
</html>