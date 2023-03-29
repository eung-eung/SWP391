
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Crud</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<c:url value="/assets/css/ManagerProduct.css" />" rel="stylesheet" type="text/css"/>
        <!--<script src="../../assets/Javascript/"></script>-->
        <link rel="stylesheet" href="<c:url value="assets/css/richtext.min.css"/>">
        <script src="<c:url value="assets/Javascript/jquery.richtext.min.js"/>"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="editInfo" action="./UpdateProduct" method="post"></form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Cập nhật sản phẩm</h4>
                            <a href="./ProductManagerController"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></a>
                        </div>
                        <div class="modal-body">					
                            <div hidden class="form-group">
                                <label>ID</label>
                                <input form="editInfo" value="${product.getProductID()}" name="productid" type="text" class="form-control" readonly required>
                            </div>
<!--                            <div class="form-group">
                                <label>Shop Name</label>
                                <input form="editInfo" value="${product.getShopName()}" name="name" type="text" class="form-control" readonly>
                            </div>-->
                            <div class="form-group">
                                <label>Loại sản phẩm</label>
                                <input form="editInfo" value="${product.getCategoryName()}" name="image" type="text" class="form-control" readonly>
                            </div>
                            <div class="form-group">
                                <label>Giá tiền</label>
                                <input form="editInfo" id="display-money" value="${product.getPrice()}" name="price" type="number" class="form-control" required>
                                <!--<span class="input-group-text" id="display-money">@example.com</span>-->
                            </div>
<!--                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <span class="input-group-text" id="basic-addon2">@example.com</span>
                            </div>-->
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <textarea form="editInfo" name="pName" class="form-control" required>${product.getName()}</textarea>
                            </div>
                            <div class="form-group ">
                                <label>Mô tả sản phẩm</label>
                                <textarea form="editInfo" name="description" class="form-control content" required>${product.getDescription()}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input form="editInfo" value="${product.getQuanity()}" name="quantity" type="number" class="form-control" required>
                            </div>
<!--                            <div class="form-group">
                                <label>Discount</label>
                                <input form="editInfo" value="${product.getDiscount()}" name="discount" type="number" class="form-control" required>
                            </div>-->
                            <form id="imguploadT"  action="./UpdateImage?idProduct=${product.getProductID()}" method="post" enctype="multipart/form-data"  >
                                <div class="form-group">
                                    <label>Ảnh chính</label><br/> 
                                    <input hidden="true" form="imguploadT" type="text" value="${product.getMainImg().imageID}" name="imageid">
                                    <img src="${product.getMainImg().getUrl()}" alt="alt" style="max-height: 240px;max-width: 240px;"> 
                                    <label><br/>
                                        <input class="" form="imguploadT"  type="file" value="Update Image"
                                               accept="image/*" name="img_item" id="fileA" style="display:none" onchange="submitFormById('imguploadT')" >
                                        <input type="button" value="Cập nhật ảnh chính" onclick="triggerClick('fileA')">
                                    </label> <br/>
                            </form>
                            <div class="form-group">
                                <label>Ảnh  </label>
                                <label> <br/>
                                    <form id="imgupload2"  action="./UploadImageFirebase?productid=${product.getProductID()}" method="post" enctype="multipart/form-data"  ></form>

                                    <input class="" form="imgupload2"  type="file" value="Update Image"
                                           accept="image/*" name="img_item" id="file2" style="display:none" onchange="submitFormById('imgupload2')" >
                                    <input type="button" value="Thêm ảnh" onclick="triggerClick('file2')">
                                </label>
                                <c:forEach var="item" items="${product.getImgs()}">
                                    <br/> 
                                    <form id="imgupload_${item.getImageID()}"  action="./UpdateImage?idProduct=${product.getProductID()}" method="post" enctype="multipart/form-data"  ></form>
                                    <input hidden="true" form="imgupload_${item.getImageID()}" type="text" value="${item.getImageID()}" name="imageid"> 

                                    <img src="${item.getUrl()}" alt="alt" style="max-height: 240px;max-width: 240px;">

                                    <label><br/>
                                        <input class="" form="imgupload_${item.getImageID()}"  type="file" value="Update Image"
                                               accept="image/*" name="img_item" id="file_${item.getImageID()}" style="display:none" onchange="submitFormById('imgupload_${item.getImageID()}')" >
                                        <input style="background-color: greenyellow" type="button" value="Cập nhật" onclick="triggerClick('file_${item.getImageID()}')">
                                    </label> 
                                    <a form="imgupload_${item.getImageID()}" href="./DeleteImage?ImageID=${item.getImageID()}&idProduct=${product.getProductID()}"><button type="button" style="background-color: red">Xóa</button> </a>
                                    <br/>  </c:forEach>  
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit" form="editInfo" >
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script>
            function triggerClick(s) {
                document.getElementById(s).click();
            }

            function submitFormById(formId) {
                // Lấy đối tượng form
                var form = document.getElementById(formId);

                // Kiểm tra nếu form tồn tại
                if (form) {
                    // Submit form
                    form.submit();
                }
            }




            // Lấy thẻ img và nút tải lên
            const imgElement = document.querySelector('.form-group img');
            const uploadButton = document.querySelector('.form-group input[type="submit"]');

            // Khi người dùng chọn một tệp tin ảnh mới để tải lên
            uploadButton.addEventListener('click', () => {
                const fileInput = document.createElement('input');
                fileInput.type = 'file';
                fileInput.accept = 'image/*';
                fileInput.onchange = () => {
                    // Nếu người dùng đã chọn tệp tin ảnh mới, thay đổi giá trị src của thẻ img
                    const file = fileInput.files[0];
                    const reader = new FileReader();
                    reader.readAsDataURL(file);
                    reader.onload = () => {
                        imgElement.src = reader.result;
                    };
                };
                fileInput.click();
            });
        </script>
        <script>
            console.log($('.content'))
            $('.content').richText({

                // text formatting
                bold: true,
                italic: true,
                underline: true,

                // text alignment
                leftAlign: true,
                centerAlign: true,
                rightAlign: true,
                justify: true,

                // lists
                ol: true,
                ul: true,

                // title
                heading: true,

                // fonts
                fonts: true,
                fontList: ["Arial",
                    "Arial Black",
                    "Comic Sans MS",
                    "Courier New",
                    "Geneva",
                    "Georgia",
                    "Helvetica",
                    "Impact",
                    "Lucida Console",
                    "Tahoma",
                    "Times New Roman",
                    "Verdana"
                ],
                fontColor: true,
                fontSize: true,

                // link
                urls: true,

                // tables
                table: true,

                // code
                removeStyles: true,
                code: true,

                // colors
                colors: [],
                
                // translations
                translations: {
                    'title': 'Title',
                    'white': 'White',
                    'black': 'Black',
                    'brown': 'Brown',
                    'beige': 'Beige',
                    'darkBlue': 'Dark Blue',
                    'blue': 'Blue',
                    'lightBlue': 'Light Blue',
                    'darkRed': 'Dark Red',
                    'red': 'Red',
                    'darkGreen': 'Dark Green',
                    'green': 'Green',
                    'purple': 'Purple',
                    'darkTurquois': 'Dark Turquois',
                    'turquois': 'Turquois',
                    'darkOrange': 'Dark Orange',
                    'orange': 'Orange',
                    'yellow': 'Yellow',
                    'imageURL': 'Image URL',
                    'fileURL': 'File URL',
                    'linkText': 'Link text',
                    'url': 'URL',
                    'size': 'Size',
                    'responsive': '<a href="https://www.jqueryscript.net/tags.php?/Responsive/">Responsive</a>',
                    'text': 'Text',
                    'openIn': 'Open in',
                    'sameTab': 'Same tab',
                    'newTab': 'New tab',
                    'align': 'Align',
                    'left': 'Left',
                    'justify': 'Justify',
                    'center': 'Center',
                    'right': 'Right',
                    'rows': 'Rows',
                    'columns': 'Columns',
                    'add': 'Add',
                    'pleaseEnterURL': 'Please enter an URL',
                    'videoURLnotSupported': 'Video URL not supported',
                    'pleaseSelectImage': 'Please select an image',
                    'pleaseSelectFile': 'Please select a file',
                    'bold': 'Bold',
                    'italic': 'Italic',
                    'underline': 'Underline',
                    'alignLeft': 'Align left',
                    'alignCenter': 'Align centered',
                    'alignRight': 'Align right',
                    'addOrderedList': 'Add ordered list',
                    'addUnorderedList': 'Add unordered list',
                    'addHeading': 'Add Heading/title',
                    'addFont': 'Add font',
                    'addFontColor': 'Add font color',
                    'addFontSize': 'Add font size',
                    'addImage': 'Add image',
                    'addVideo': 'Add video',
                    'addFile': 'Add file',
                    'addURL': 'Add URL',
                    'addTable': 'Add table',
                    'removeStyles': 'Remove styles',
                    'code': 'Show HTML code',
                    'undo': 'Undo',
                    'redo': 'Redo',
                    'close': 'Close'
                },

                // privacy
                youtubeCookies: false,

                // preview
                preview: false,

                // placeholder
                placeholder: '',

                // dev settings
                useSingleQuotes: false,
                height: 0,
                heightPercentage: 0,
                id: "",
                class: "",
                useParagraph: false,
                maxlength: 0,
                useTabForNext: false,

                // callback function after init
                callback: undefined,

            });
        </script>
        <script src="<c:url value="/assets/Javascript/ManagerProduct.js" />"></script> 
</body>
</html>

