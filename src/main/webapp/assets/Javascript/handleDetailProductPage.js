/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function increaseValue() {
    var value = parseInt(document.querySelector(".form-input").value, 10);
    value++;
    value = isNaN(value) ? 1 : value;

    document.querySelector(".form-input").value = value;
    console.log(value)
}

function decreaseValue() {
    var value = parseInt(document.querySelector(".form-input").value, 10)
    value--;
    value = isNaN(value) ? 1 : value;
    value < 1 ? value = 1 : value;

    document.querySelector(".form-input").value = value;
    console.log(value)
}

(function zoomImages() {
    const containerImage = document.querySelector(".product-view-image-main")
    const img = document.querySelector("#image");

    containerImage.addEventListener("mousemove", (e) => {
        const x = e.clientX - containerImage.offsetLeft;
        const y = e.clientY - containerImage.offsetTop;
        img.style.transformOrigin = `${x}px ${y}px`;
        img.style.transform = "scale(2)";

    })

    containerImage.addEventListener("mouseleave", () => {
        img.style.transformOrigin = "center";
        img.style.transform = "scale(1)";
    })
}
)();

function hoverToShowImage(img) {
    var src = img.src;
    var thumnailLinks = document.querySelectorAll(".product-view-thumnail-link");
    thumnailLinks.forEach(link => {
        link.classList.remove("active");
    })
    img.parentElement.classList.add("active");
    document.getElementById("image").src = src;
}


(function handleActiveTabs() {
    let tabs = document.querySelectorAll(".tab");
    let tabContents = document.querySelectorAll(".tab-content");

    tabs.forEach((tab, index) => {
        tab.addEventListener("click", function () {
            tabs.forEach((_tab, _index) => {
                _tab.classList.remove("active");
                tabContents[_index].classList.remove("active");
            })
            this.classList.add("active");
            tabContents[index].classList.add("active");
        })
    })
})();

(function handleFormBackground() {
    let background = document.querySelector(".modal-review-form-background");
    let linkOpenModalReview = document.querySelector(".modal-review");
    let modalReviewForm = document.querySelector(".modal-review-form");
    let closeModalButton = document.querySelector(".modal-close-button");


    linkOpenModalReview.addEventListener("click", () => {
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
    })

    closeModalButton.addEventListener("click", () => {
        modalReviewForm.classList.remove("open");
        background.style.display = "none";
        if (!modalReviewForm.classList.contains("open")) {
            modalReviewForm.style.cssText = ``;

        }
    });
})();

(function handleColorStarReviewForm() {
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
})();

