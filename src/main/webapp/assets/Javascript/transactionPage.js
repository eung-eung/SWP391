/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let background = document.querySelector(".modal-review-form-background");
let linkOpenModalReview = document.querySelectorAll(".rating-button");
let modalReviewForm = document.querySelector(".modal-review-form");
let closeModalButton = document.querySelector(".modal-close-button");
let modalBody = document.querySelector(".modal-body");
linkOpenModalReview.forEach(l => l.addEventListener("click", (e) => {
console.log("order id " + event.target.getAttribute("data-orderid"))
        console.log("product id " + event.target.getAttribute("data-productid"))
        fetch('MainController?btnAction=product&productAction=ratingProduct&productID=' + event.target.getAttribute("data-productid"))
        .then(res =>
                res.json())
        .then(data => {

        modalBody.innerHTML = `


                        <div class="product-detail-review-container">
                                    <!-- image -->
                                    <div class="product-detail-review-image">
                                <img src="\${data.mainImg.url}">
                            </div>
                            <!-- product name -->
                                <h3 class="product-detail-review-name">\${data.name}</h3>
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
        
        `


        })
        .then(() => {
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
    overflow-y:scroll`
        }



        }




        )
        .then(() => {
        const a = "/ review"
                const ws = new WebSocket('ws://' + 'localhost:8080/EcommercePlatformm' + '/review/' + params.productID)
                //            web socket
                let starReview = document.querySelectorAll(".star-review")

//                const reviewTitle = ["Rất không hài lòng", "Không hài lòng", "Bình Thường", "Hài Lòng", "Rất Hài Lòng"]
                const params = new Proxy(new URLSearchParams(window.location.search), {
                get: (searchParams, prop) => searchParams.get(prop),
                });
                const data = {
                reviewId: - 1,
                        userId: ${sessionScope.user.userID},
                        rating: 5,
                        comment: "dc",
                        orderId: 2
                }
        console.log(ws)
                document.querySelector(".submit-review-button").onclick = () => {
        ws.send(JSON.stringify(data))
        }
        })

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





           