<%-- 
    Document   : cartPage
    Created on : Feb 5, 2023, 10:26:25 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="header.jsp" />

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



                    <!--  -->

                    <!--  -->

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

    <script src="<c:url value="/assets/Javascript/handleMenuCategories.js" />"></script>
    <script src="<c:url value="/assets/Javascript/handleDetailProductPage.js" />"></script>
    <script>
        let cart = JSON.parse(window.localStorage.getItem('cart'));
        let fieldShopID = document.querySelector(".shopID")
        const unique = [...new Set(cart.map(item => item.shopID))];
        let cartList = document.querySelector('.cart')
//        let cart = JSON.parse(window.localStorage.getItem('cart'));
        console.log(unique);
        (function render() {
            unique.forEach(u => {

                fetch("MainController?btnAction=cart&cartAction=render&shopID=" + u, {
                    method: 'GET'
                })
                        .then(res => res.json())
                        .then(data => {
                   
                            cartList.innerHTML += ` <tbody class="cart-name-shop">
                          
                        <tr class="cart-item shop-name"><td class="name"><a href="#"><i class="fa-solid fa-store"></i>\${data.shopName}</a></td></tr>`
                            let htmls = cart.map(item => {
                                if (data.shopID == item.shopID) {
                                    return `
            
                  
                    <tr class="cart-item">
                        <td class="cart-item cart-item-image">
                            <img src="\${item.srcImg}" alt="">
                        </td>
                        <td class="cart-item cart-item-title">
                           
                            <h4 class="cart-item-name">
                     
                                <a href="<c:url value="MainController?btnAction=product&productAction=showDetail&productID=\${item.productID}" />">
                            \${item.productName}
                                </a>
                            </h4>
                        </td>
                        <td class="cart-item cart-item-price">
                            <span class="cart-item-price-value">\${item.price}</span>
                        </td>
                       <input type="hidden" class="productID" value="\${item.productID}"/>
                        <td class="cart-item cart-item-quantity">
                            <div class="increment">
                         
                                <div class="box-id" style="display: flex; justify-content: center; align-items: center;">
                                    <div class="increase"  onclick ="increaseValue(this,\${item.productID})"><i class="fa-solid fa-angle-up"></i>
                                    </div>
                                    <input class="form-input" type="number" id="quantity" value="\${item.quantity}" min="1">

                                    <div class="decrease" onclick ="decreaseValue(this,\${item.productID})"><i class="fa-solid fa-angle-down"></i>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="cart-item cart-item-total">
                            <span class="cart-item-total">500000vnd</span>
                            <div class="close" onclick="deleteAnItem(this,\${item.productID},\${data.shopID})">
                                <span class="modal-close-button fa-solid fa-x">
                                </span>
                            </div>
                        </td>
                    </tr>
                    
                    `


                                }

                            })
                            cartList.innerHTML += `</tbody>`
                            cartList.innerHTML += htmls.join('')

                        }


                        )


            })
        })();

        function increaseValue(btn, productID) {
            let value = btn.nextElementSibling.value
            value++
            setQuantityWithDeIncrease(value, productID)
            value = isNaN(value) ? 1 : value;
            btn.nextElementSibling.value = value

        }
        function decreaseValue(btn, productID) {
            let value = btn.previousElementSibling.value
            value--;
            setQuantityWithDeIncrease(value, productID)
            value = isNaN(value) ? 1 : value;
            value < 1 ? value = 1 : value;
            btn.previousElementSibling.value = value
        }
        function setQuantityWithDeIncrease(value, productID) {
            cart.forEach(item => {
                console.log(item.productID == productID)
                console.log(value)
                if (item.productID == productID) {
                    item.quantity = value;
                }


            })
            window.localStorage.setItem('cart', JSON.stringify(cart))
        }
//delete a item from cart
        function deleteAnItem(deleleButton, productID, shopID) {

            swal({
                title: "Xóa sản phẩm",
                text: "Bạn có muốn xóa sản phẩm đang chọn?",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                    .then((willDelete) => {


                        if (willDelete) {
                            let indexItemInCart = cart.findIndex(item => item.productID == productID)
                            cart.splice(indexItemInCart, 1)
                            let isShopStillInCart = cart.findIndex(cartItem => cartItem.shopID == shopID)
                            console.log(isShopStillInCart < 0)
                            if (isShopStillInCart < 0) {
                                deleleButton.parentNode.parentNode.parentNode.previousElementSibling.remove()

                            }
                            deleleButton.parentNode.parentNode.remove()
                             window.localStorage.setItem('cart', JSON.stringify(cart))
                            swal("Đã xóa", {
                                icon: "success",
                            });
                            return res()
                        } else {
                            swal("Bạn đã hủy xóa sản phẩm");


                        }


                    })
               




        }


    </script>

</html>