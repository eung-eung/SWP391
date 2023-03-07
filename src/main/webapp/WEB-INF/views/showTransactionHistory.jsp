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
                                                        <span>Chat với cửa hàng</span>
                                                        <span>Đánh giá sản phẩm</span>
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
    </body>
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
                    this.innerHTML = `<p>Ẩn bớt</p>`
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
