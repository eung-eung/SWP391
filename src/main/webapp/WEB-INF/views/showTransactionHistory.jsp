<%-- 
    Document   : showTransactionHistory
    Created on : Feb 24, 2023, 8:02:48 PM
    Author     : boyvi
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi-VN"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/showTransactionHistory.css" />" />

    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container">
            <h3 class="title">Đơn hàng của tôi</h3>
            <div>
                <div class="order-container">
                    <!--order-->

                    <c:forEach items="${histories}" var="history">
             
                        <div class="order-item">
                            <div class="order-item-header">
                                <span class="status"><i class="fa-solid fa-money-bills"></i>Thanh toán thành công</span>
                                <span class="status"><i class="fa-solid fa-calendar-days"></i>${history.orderDate}</span>
                            </div>
                            <div class="order-item-info">
                                <div>
                                    <!--product-->

                                    <c:forEach items="${history.orderDetails}" var="item">

                                        <div class="product">
                                            <div class="detail">
                                                <div class="product-img" style="background-image: url('${item.mainImageUrl}')">
                                                    <span class="quantity">x${item.quantity}</span>
                                                </div>
                                                <div class="product-info">
                                                    <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=${item.productId}" />" class="product-name">${item.productName}</a>
                                                    <div class="store">
                                                        <a href="<c:url value="MainController?btnAction=shop&shopAction=show&shopID=${item.shopId}" />"><i class="fa-solid fa-shop"></i>${item.shopName}</a>
                                                    </div>
                                                    <div class="product-review">
                                                        <!--<span>Chat với cửa hàng</span>-->
                                                       
                                        <c:if test="${!item.isIsReviewed()}">
                                                            <span class="rating-button" data-orderId="${item.orderId}" data-productId="${item.productId}">Đánh giá sản phẩm</span>
                                                        </c:if>
                                                            <c:if test="${item.isIsReviewed()}">
                                                            <span class="rating-button rated">Đã đánh giá</span>
                                                        </c:if>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="price">
                                                <span><fmt:formatNumber value="${item.price}" type="currency" /></span>
                                            </div>

                                        </div>
                                    </c:forEach>
                                    <div class="btn-more"><p>Xem thêm</p></div>
                                    <!--end product-->

                                </div>
                            </div>
                            <div class="total-order">
                                <div class="total-title">Tổng tiền</div>
                                <div class="total-price"><fmt:formatNumber value="${history.total}" type="currency" /></div>
                            </div>
                            <!--                            <div class="button-detail">
                                                            <div>Xem chi tiết</div>
                                                        </div>-->
                        </div>
                        <!--end order-->
                    </c:forEach>
                </div>

            </div>
        </div>
        <div class="modal-review-form-background"></div>
        <div id="modal-rating" class="modal-review-form modal-review-form-open">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-header">
                        <h3 class="modal-header-title">Hãy đánh giá</h3>
                    </div>
                    <div class="modal-close">
                        <a href="#" class="modal-close-button fa-solid fa-x">
                        </a>
                    </div>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </body>
<!--     <script src="<c:url value="/assets/Javascript/transactionPage.js" />"></script>-->
    <script>


        let background = document.querySelector(".modal-review-form-background");
        let linkOpenModalReview = document.querySelectorAll(".rating-button");
        let modalReviewForm = document.querySelector(".modal-review-form");
        let closeModalButton = document.querySelector(".modal-close-button");
        let modalBody = document.querySelector(".modal-body");
        linkOpenModalReview.forEach(l => l.addEventListener("click", (e) => {
                let orderId = event.target.getAttribute("data-orderid")
                let productId = event.target.getAttribute("data-productid")
                console.log("order id " + event.target.getAttribute("data-orderid"))
                console.log("product id " + event.target.getAttribute("data-productid"))
                const a = "/review"
                const params = new Proxy(new URLSearchParams(window.location.search), {
                    get: (searchParams, prop) => searchParams.get(prop),
                });
                const ws = new WebSocket('ws://' + 'localhost:8080/EcommercePlatformm' + '/review/' + event.target.getAttribute("data-productid"))
                //            web socket

                fetch('MainController?btnAction=product&productAction=ratingProduct&productID=' + event.target.getAttribute("data-productid"))
                        .then(res =>
                            res.json())
                        .then(data => {

                            modalBody.innerHTML = `
<div class="product-detail-review-container">
                                      
                                    <div class="product-detail-review-image">
                                    <img src="\${data.mainImg.url}">
                                    </div>
                               
                            <h3 class="product-detail-review-name">\${data.name}</h3>
                                </div>
                                <div class="form-review-container">
                                <div class="form-field-review">
                          
                            <div class="form-field-rating">
                            <label>Rating</label>
                                                            <span class="rating-title"></span>
                                                        <span class="icon fa-solid fa-star star-review"></span>
                    <span class="icon fa-solid fa-star star-review"></span>
        <span class="icon fa-solid fa-star star-review"></span>
        <span class="icon fa-solid fa-star star-review"></span>
            <span class="icon fa-solid fa-star star-review"></span>
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

        `;


                        })
                        .then(() => {
//                            console.log(object)
                            let stars = document.querySelectorAll(".star-review")
                            const reviewTitle = ["Rất không hài lòng", "Không hài lòng", "Bình Thường", "Hài Lòng", "Rất Hài Lòng"]
                            let fieldTitle = document.querySelector("#title")
                            // prevent input 

                            //hover
                            for (let i = 0; i < stars.length; i++) {
                                stars[i].addEventListener("mouseover", function (e) {
                                    stars.forEach(star => {
                                        star.classList.remove("rating-star-full");
                                    });
                                    for (let j = 0; j < i + 1; j++) {
                                        stars[j].classList.add("rating-star-full");
                                        fieldTitle.innerHTML = reviewTitle[j];
                                    }
                                });
                                // no hover
                                // stars[i].addEventListener("mouseout", function (e) {


                                // })

                                stars[i].addEventListener("click", function () {
                                    stars.forEach(star => {
                                        star.classList.remove("rating-star-full")
                                    });
                                    for (let j = 0; j <= i; j++) {
                                        stars[j].classList.add("rating-star-full")
                                        fieldTitle.innerHTML = reviewTitle[j]
                                    }
                                });
                                console.log(stars[i]);
                            }


                            // nếu orderId == -1 thì nó sẽ tìm thằng product được mua gần đây nhất
// để nó comment

                            background.style.display = "block";
                            modalReviewForm.classList.add("open");
                            if (modalReviewForm.classList.contains("open")) {
                                modalReviewForm.style.cssText = `
    display: block;
    opacicty: 1;
    visibility: visible;
    top: 150px;                                          
    left: 50%;
    margin: 0 auto;
    max-height: 90%;
    max-width: 95%;
    outline: 0;
    overflow: hidden;
    padding: 0;
    right: 0;
    top: 50% !important;
    transform: translate(-50%, -50%);
    position: fixed;
    overflow-y:scroll`;
                            }



//                const reviewTitle = ["Rất không hài lòng", "Không hài lòng", "Bình Thường", "Hài Lòng", "Rất Hài Lòng"]


                            console.log(ws)
                            document.querySelector(".submit-review-button").onclick = () => {
                                let review = document.querySelector("#field-text").value

                                console.log(orderId)
                                let starReview = document.querySelectorAll(".rating-star-full")
                                console.log(starReview.length)
                                const data = {
                                    userId: ${sessionScope.user.userID},
                                    rating: starReview.length,
                                    comment: review,
                                    orderId: orderId
                                }
                                ws.send(JSON.stringify(data))
                                window.location.href = "<c:url value="/MainController?btnAction=user&userAction=transaction" />"
                            }
                                

                        }




                        )
                      
                       


            }
            ))


        closeModalButton.addEventListener("click", () => {
            modalReviewForm.classList.remove("open");
            modalBody.innerHTML = ""
            background.style.display = "none";
            if (!modalReviewForm.classList.contains("open")) {
                modalReviewForm.style.cssText = ``;
            }
        }
        );







    </script>
    <script>
        let moreBtns = document.querySelectorAll(".btn-more")
        document.querySelectorAll(".order-item").forEach((o, index) => {
            let arrayProducts = o.children[1].children[0].children
            if (arrayProducts.length - 1 <= 2) {
                moreBtns[index].innerHTML = ""
            }
            console.log(arrayProducts)
            for (let i = 0; i < arrayProducts.length; i++) {
//                console.log(arrayProducts.length)

                if (i >= 2 && i !== arrayProducts.length - 1) {
                    arrayProducts[i].style.display = "none"

                }
            }


        })


        moreBtns.forEach(btn => btn.addEventListener("click", function (e) {
                this.classList.toggle("open");
                let listProductOfAOrder = e.target.parentNode.parentNode.children;
                if (this.classList.contains("open")) {
                    this.innerHTML = ` <p> Ẩn bớt </p>`
                    for (let i = 0; i < listProductOfAOrder.length; i++) {
                        if (i >= 2 && i !== listProductOfAOrder.length - 1) {
                            listProductOfAOrder[i].style.display = "flex"
                        }
                    }
                } else {
                    document.querySelectorAll(".order-item").forEach((o, index) => {
                        let arrayProducts = o.children[1].children[0].children
                        this.innerHTML = `<p>Xem thêm</p>`
                        for (let i = 0; i < arrayProducts.length; i++) {
                            if (i >= 2 && i !== arrayProducts.length - 1) {
                                arrayProducts[i].style.display = "none"
                            }
                        }

                    })
                }


            }))


    </script>

</html>
