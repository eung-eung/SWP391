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
                        <div class="cart-total-value cart-address">
                            <a href="<c:url value="/MainController?btnAction=user&userAction=profile#profile" />">Thêm địa chỉ:</a>
                        </div>
                    </li>
                    <li class="cart-total">
                        <div class="cart-total-label">Tổng cộng:</div>
                        <div class="cart-total-value total">
                            <span></span>
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


        unique.forEach(u => {

            fetch("MainController?btnAction=cart&cartAction=render&shopID=" + u, {
                method: 'GET'
            })
                    .then(res => res.json())
                    .then(data => {

                        cartList.innerHTML += ` <tbody class="cart-name-shop">
                          
                        <tr class="cart-item shop-name"><td class="name"><a href="#"><i class="fa-solid fa-store"></i>\${data.shopName}</a></td></tr>`
                        let htmls = cart.map(item => {
                            console.log(parseInt(item.price.trim().replace(".0", "")))
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
                                    <input class="form-input quantity-input" type="number" id="quantity" value="\${item.quantity}" onchange="handleOnChangeQuantity(this,\${item.productID})"  min="1">

                                    <div class="decrease" onclick ="decreaseValue(this,\${item.productID},\${data.shopID})"><i class="fa-solid fa-angle-down"></i>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="cart-item cart-item-total">
                            <span class="cart-item-total">\${formatter.format(parseInt(item.price.replaceAll(".","")) * item.quantity)}</span>
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


        function handleOnChangeQuantity(btn, productID) {

            fetch("MainController?btnAction=product&productAction=showQuantity&productID=" + productID, {
                method: 'GET'
            })
                    .then(res => res.json())
                    .then(data => {
                        if (data < btn.value) {
                            swal("", "Sản phẩm này chỉ còn " + data, "error");
                            btn.value = data
                        }
                        if (btn.value < 0) {
                            btn.value = Math.abs(btn.value)
                        } else if (btn.value == 0) {
                            btn.value = 1
                        }
                        handleTotalItem(btn, btn.value)
                        setQuantityWithDeIncrease(btn.value, productID)
                        calculateTotal()
                    })

//                    calculateTotal()



        }





//        function handleOnInputQuantity(productID) {
//            let inputQuantity = document.querySelectorAll(".quantity-input")
//            inputQuantity.forEach(input => {
//                input.addEventListener("input", function () {
//                    if (this.value < 0) {
//                        this.value = Math.abs(this.value)
//                    } else if (this.value == 0) {
//                        this.value = 1
//                    }
////                    handleTotalItem(this, this.value)
//                    setQuantityWithDeIncrease(this.value, productID)
//                })
//            })
////            calculateTotal()
//        }
        function increaseValue(btn, productID) {
            let value = btn.nextElementSibling.value
            value++

            value = isNaN(value) ? 1 : value;
            fetch("MainController?btnAction=product&productAction=showQuantity&productID=" + productID, {
                method: 'GET'
            })
                    .then(res => res.json())
                    .then(data => {
                        if (data < value) {
                            swal("", "Sản phẩm này chỉ còn " + data, "error");
                            value = value - 1

                        }
                        handleTotalItem(btn, value)
                        setQuantityWithDeIncrease(value, productID)
                        btn.nextElementSibling.value = value
//                        calculateTotal()
                    })

//            setQuantityWithDeIncrease(value, productID)
        }
        function decreaseValue(btn, productID, shopID) {
            let value = btn.previousElementSibling.value
            value--;
            if (value == 0) {
                console.log("delete thôi")
                value = 1;
                deleteAnItem(btn.parentNode.parentNode.parentNode.nextElementSibling.childNodes[3], productID, shopID)

            }

            handleTotalItem(btn, value)
            setQuantityWithDeIncrease(value, productID)

            value = isNaN(value) ? 1 : value;

            value < 1 ? value = 1 : value;
            btn.previousElementSibling.value = value

        }
        function setQuantityWithDeIncrease(value, productID) {
            cart.forEach(item => {
//                console.log(item.productID == productID)
//                console.log(value)
                if (item.productID == productID) {
                    item.quantity = value;
                }


            })
            window.localStorage.setItem('cart', JSON.stringify(cart))
            calculateTotal()
        }
//delete a item from cart
        function deleteAnItem(deleleButton, productID, shopID) {

            swal({
                title: "Xóa sản phẩm",
                text: "Bạn có muốn xóa?",
                icon: "warning",
                dangerMode: true,
                buttons: {
                    cancel: {
                        text: "Hủy",
                        value: null,
                        visible: true,
                        className: "",
                        closeModal: true,
                    },
                    confirm: {
                        text: "Xác nhận",
                        value: true,
                        visible: true,
                        className: "",
                        closeModal: true
                    }
                }
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
                            calculateTotal()
                            swal("Đã xóa", {
                                icon: "success",
                            });


                        } else {
                            swal("Bạn đã hủy xóa sản phẩm");


                        }

                    })
        }
        function handleTotalItem(btn, quantity) {
//            const f = Intl.
            let currentPrice = btn.parentNode.parentNode.parentNode.parentNode.childNodes[5].childNodes[1].innerHTML

            let totalPriceEachItemByQuantity = btn.parentNode.parentNode.parentNode.nextElementSibling.childNodes[1]
            totalPriceEachItemByQuantity.innerHTML = formatter.format(parseInt(currentPrice.trim().replaceAll(".", "")) * quantity)

        }
//        document.querySelector('.checkout-button').addEventListener('click', function (e) {

//            e.preventDefault()
//            console.log('click')
        function calculateTotal() {

            let total = cart.reduce(function (total, currentItem) {
                console.log("item " + formatter.format(1000 + parseInt(currentItem.price.replaceAll(".", "")) * currentItem.quantity))

                console.log("quantity " + currentItem.quantity)
                return total + parseInt(currentItem.price.replaceAll(".", "")) * currentItem.quantity
            }, 0)
//            console.log(formatter.format(total))
            document.querySelector(".total").innerHTML = `<span>` + formatter.format(total) + `</span>`
//            console.log("length: " + cart.length)


        }
        
        window.onload = function () {
            calculateTotal()
            if (${sessionScope.user.wardID} !== 0) {
                fetch("MainController?btnAction=address&addressAction=getWard&wardID=" + ${sessionScope.user.wardID}, {
                    method: 'GET'
                })
                        .then(res => res.json())
                        .then(ward => {
                            document.querySelector(".cart-address").innerHTML = "Phường/Xã: " + ward.name + " - "
                            return new Promise(function (res) {
                                return res(fetch("MainController?btnAction=address&addressAction=getDistrict&districtID=" + ward.districtID, {
                                    method: 'GET'
                                }))
                            })
                                    .then(res => res.json())
                                    .then(district => {
                                        document.querySelector(".cart-address").innerHTML += "Quận/Huyện: " + district.name + " - "
                                        return new Promise(function (res) {
                                            return res(fetch("MainController?btnAction=address&addressAction=getCity&cityID=" + district.cityID, {
                                                method: 'GET'
                                            }))
                                        })
                                    })
                                    .then(res => res.json())
                                    .then(city => {
                                        document.querySelector(".cart-address").innerHTML += "Tỉnh/Thành Phố: " + city.name
                                        document.querySelector(".cart-address").innerHTML += `<a href="<c:url value="/MainController?btnAction=user&userAction=profile#profile" />">Sửa địa chỉ</a>`
                                    })
                        }


                        )
            }
        }

        
    </script>

</html>