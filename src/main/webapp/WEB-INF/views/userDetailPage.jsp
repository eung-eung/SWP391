<%-- 
    Document   : userDetailPage
    Created on : Feb 9, 2023, 12:10:55 PM
    Author     : boyvi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/showProductByCategoryPage.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/detailProduct.css" />" />
        <link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/userDetailPage.css" />" />
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <c:if test="${empty sessionScope.user}">
            <script>
                window.location.href = "<c:url value="/" />"
            </script>
        </c:if>
        <div class="main-body">
            <div class="container">
                <!-- breadcrumbs -->

                <!--  -->
                <div class="row-sidebar">
                    <!-- left: sidebar -->
                    <div class="sidebar-categories">
                        <div class="block-sidebar-title">
                            <h5 class="sidebar-title"><i class="fa-regular fa-gem"></i>Tài khoản của tui</h5>
                        </div>
                        <div class="block-sidebar-content">
                            <ul class="nav-list">



                                <li class="nav-list-item">
                                    <a class="nav-list-action" href="<c:url value="/MainController?btnAction=product&productAction=showByCateID&categoryID=${categoryItem.categoryID}"></c:url>" class="menu-categories-item-action">
                                            Hồ sơ
                                        </a>

                                    </li>

                                </ul>
                            </div>
                        </div>
                        <!-- right:detail-block -->
                        <div class="user-detail-container">
                            <div class="user-detail">
                                <div class="nav-user-detail">
                                    <h3 class="user-detail-title">Hồ sơ của tui</h3>

                                </div>
                                <div class="modals">
                                    <div class="profile-modal">
                                        <div class="profile">

                                            <div class="profile-items">
                                                <div class="profile-item">
                                                    <label>Email Đăng Nhập</label>
                                                </div>
                                                <div class="profile-item">
                                                ${sessionScope.user.email}
                                            </div>

                                        </div>
                                        <div class="profile-items">

                                            <div class="profile-item">
                                                <label>Tên</label>
                                            </div>
                                            <div class="profile-item">
                                                <input id="username" type="text" value='${sessionScope.user.username == null ? "" : sessionScope.user.username}'/>
                                            </div>
                                        </div>
                                        <div class="profile-items">

                                            <div class="profile-item">
                                                <label>Số điện thoại</label>
                                            </div>
                                            <div class="profile-item">
                                                <input id="phone" type="number" placeholder="Nhập số điện thoại" value="${sessionScope.user.phone}"/>
                                            </div>
                                        </div>

                                    </div>


                                    <div class="profile-avatar-container">
                                        <div class="profile-avatar">
                                            <div class="current-avatar">
                                                <div id="my-image" style="background-image: url('${sessionScope.user.avatarUrl}')" ></div>
                                            </div>
                                            <input id="input-avatar" type="file" hidden accept=".jpg, .jpeg, .png" onchange="readURL(this)"/>
                                            <!--<button id="submit">Upload</button>-->   
                                            <button type="button" id="submit">Lưu</button>
                                        </div>
                                    </div>
                                </div>


                                <!--  -->

                                <!--  -->
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </body>
    <script src="<c:url value="/assets/Javascript/handleImageInUserDetail.js" />"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
                                                const fileInput = document.querySelector("#input-avatar");
                                                console.log(document.querySelector("#my-image"))
                                                document.querySelector("#my-image").addEventListener("click", () => fileInput.click());


    </script>


    <script type="module">


        // Import the functions you need from the SDKs you need
        import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
        import { listAll, getStorage, ref, getDownloadURL, deleteObject, uploadBytesResumable, uploadBytes } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-storage.js";
        // TODO: Add SDKs for Firebase products that you want to use
        // https://firebase.google.com/docs/web/setup#available-libraries

        // Your web app's Firebase configuration
        const firebaseConfig = {
            apiKey: "AIzaSyDME5p-3eVnBjOe1PMqhAGZgeTQrg64_rA",
            authDomain: "storageavataruser.firebaseapp.com",
            projectId: "storageavataruser",
            storageBucket: "storageavataruser.appspot.com",
            messagingSenderId: "703858060708",
            appId: "1:703858060708:web:ad4795d735b1fd6882a531"
        };

        // Initialize Firebase
        const app = initializeApp(firebaseConfig);
        const storage = getStorage();
        const listRef = ref(storage, 'userID-${sessionScope.user.userID}/avatar');
        console.log(listRef);

        document.querySelector('#submit').addEventListener('click', function () {

            const avatar = document.querySelector('#input-avatar').files[0];

            listAll(listRef)
                    .then((res) => {
                        res.items.forEach((itemRef) => {
                            // All the items under listRef.
                            deleteObject(itemRef)
                                    .then(() => {
                                        console.log('deleted')
                                    })
                        });
                    }).catch((error) => {
                // Uh-oh, an error occurred!
            });

//        // Create a child reference
            const imageRef = ref(storage, avatar.name);
            const storageRef = ref(storage, 'userID-${sessionScope.user.userID}/avatar/' + avatar.name);
//                                                    const desertRef = ref(storage, 'userID-${sessionScope.user.userID}/avatar');

            uploadBytes(storageRef, avatar)
                    .then((snapshot) => {
                        console.log(snapshot)
                        console.log('Uploaded');
                        return snapshot
                    })
                    .then(snapshot => {
                        return getDownloadURL(snapshot.ref)
                    })
                    .then(url => {
                        console.log(url)

                        var http = new XMLHttpRequest();
                        // Yêu cầu GET vs API, cbi yêu cầu để kết nối
                        http.open('GET', 'MainController?btnAction=user&userAction=updateProfile&urlAvatar=' + url
                                + '&email=' + '${sessionScope.user.email}'
                                + '&phone=' + document.querySelector('#phone').value
                                + '&username=' + document.querySelector('#username').value
//                                + '&token=' + getParameterByName('token', url)
                                , true)//true: bất đồng bộ( call api delay vài giây thì các code dưới vẫn chạy bt)

                        http.onreadystatechange = function () {
                            //trường hợp đã gửi req thành công và nhận dc response
                            //và status < 300: không lỗi thì cho resolve để .then
                            //trả về resolve or reject tùy vào if else dưới
                            //
                            if (this.readyState == 4) {
                                if (this.status < 300) {

                                    return swal("Updated succesfully!", "", "success");
                                } else {
                                    return  swal("Updated unsuccesfully!", "", "danger");
                                }
                            }

                        }
                        //yêu cầu gửi đi
                        http.send();
                        return url
                    })
                    .then(url => {
                        document.querySelector('#my-avatar-header').style.backgroundImage = "url('" + url + "')";
                    })

        })




    </script>
</html>
