<%-- 
    Document   : filmList
    Created on : Jul 26, 2022, 7:35:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/js/bootstrap.min.js" integrity="sha512-8Y8eGK92dzouwpROIppwr+0kPauu0qqtnzZZNEF8Pat5tuRNJxJXCkbQfJ0HlUG3y1HB3z18CSKmUo7i2zcPpg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
            .profile-pic{

                display: flex;
                align-items: center;

            }

            .-label{
                margin-right: 12px;
            }

            .form-group {
                margin: 18px 0;
            }
        </style>    
    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container">
            <div class="row" style="margin: 100px;">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">User Profile</h3>
                        </div>
                        <div class="modal-body">

                            <form method="post" action="profile">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <div class="profile-pic">

                                            <img id="myAvatar" style="border-radius: 15px;" src="${account.avatar}" width="120" >

                                            <input id="fileAvatar" onchange="changeAvatar()" name="myAvatar" type="file" accept=".jpg, .jpeg, .png">
                                            <input name="Avatar" id="sendavt" type="hidden">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-lg-2 col-sm-2 control-label">Email</label>
                                    <div class="col-lg-12">
                                        <input type="text" class="form-control" id="emailaccount" readonly value="${account.email}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="newFullname" class="col-lg-2 col-sm-2 control-label">Fullname</label>
                                    <div class="col-lg-12">
                                        <input id="fullnamepf" name="fullnamepf" type="text" class="form-control" placeholder="Fullname" value="${account.fullname}">
                                        <p class="help-block" style="color: red" id="errorFullName"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label style="
                                           margin-right: 50px;
                                           " for="newTitle" class="col-lg-2 col-sm-2 control-label">Gender</label>
                                    <label style="margin-right: 15px"> Male
                                        <input id="malepf" type="radio" name="gender" value="1" ${account.gender==true?"checked":""}/>
                                    </label>
                                    <label> Female
                                        <input id="femalepf" type="radio" name="gender" value="0" ${account.gender==false  ?"checked":""}/>
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="newMobile" class="col-lg-2 col-sm-2 control-label">Mobile</label>
                                    <div class="col-lg-12">
                                        <input id="phonepf" name="phonepf" type="text" class="form-control" placeholder="Mobile" value="${account.phone}">
                                        <p class="help-block" style="color: red" id="errorPhone"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="newAddress" class="col-lg-2 col-sm-2 control-label">Address</label>
                                    <div class="col-lg-12">
                                        <input id="addresspf" name="addresspf" type="text" class="form-control" placeholder="Address" value="${account.address}">
                                        <p class="help-block" style="color: red" id="errorAddress"></p>
                                    </div>
                                </div>
                                <div class="auth-form__forgotgroup">
                                    <a href="changepassword" class="auth-form__forgot">Change password</a>
                                </div>
                                <span style="color: red;
                                      font-weight: 500;" >${msg}
                                </span>
                                <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-12">
                                        <button  class="btn btn-primary get" type="submit" id="saveC">Save changes</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="./layout/footer.jsp"/>
        <script>
//                                    ChangeAvatar
            function changeAvatar() {
                var file = document.getElementById("fileAvatar").files[0];
                if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                    if (file.size / (1024 * 1024) < 5) {
                        var fileReader = new FileReader();
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            document.getElementById("myAvatar").src = (fileReader.result);
                            document.getElementById("sendavt").value = document.getElementById("myAvatar").src;
                        }
                    } else {
                        uploadError();
                    }
                } else {
                    uploadError();
                }
            }

            function uploadError() {
                alert('Please upload photo file < 5MB')
                document.getElementById("fileAvatar").files[0].value = ''
                document.getElementById("fileAvatar").type = '';
                document.getElementById("fileAvatar").type = 'file';
            }

        </script>
    </body>
</html>
