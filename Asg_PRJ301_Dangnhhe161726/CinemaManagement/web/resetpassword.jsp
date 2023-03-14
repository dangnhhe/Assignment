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
        </style>    
    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container">
            <div class="row" style="margin: 100px;">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <form action="resetpassword" method="post">
                        <div class="container-forgot">
                            <div class="title-forgot">
                                <h2 class="forgotpassword" style="text-align: center;">Reset Password</h2>
                            </div>
                            <input type="hidden" name="email" value="${email}">
                            <div class="input-forgot"><input name="password" required="" type="password" class="form-control" style="margin: 15px 0;" placeholder="Password"></div>
                            <div class="input-forgot"><input name="repassword" required="" type="password"class="form-control" style="margin: 15px 0;" placeholder="Re-Password"></div>
                            <div class="error-forgot"><span class="msg">${msg}</span></div>
                            <div class="btn-forgot"><input type="submit"  class="btn btn-primary" value="Submit"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="./layout/footer.jsp"/>
    </body>
</html>
 