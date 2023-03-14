<%-- 
    Document   : newjsp
    Created on : Jul 27, 2022, 10:41:12 AM
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

    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container">
            <div class="row" style="margin: 100px;">
                <div class="col-md-3"></div>
                <div class="col-md-6" style="display: flex; flex-direction: column; align-items: center;">
                    <h1 style="background-color: blanchedalmond;color: red; text-align: center; width: 100%;"> Booking Success</h1>
                    <a href="FilmList" style="width: 200px;" class="btn btn-success">Watching more</a> 
                </div>
                <div class="col-md-3"></div>

            </div>
        </div>

        <jsp:include page="./layout/footer.jsp"/>

    </body>
</html>
