<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img style="height: 600px; width: 100%;" src="https://bloganchoi.com/wp-content/uploads/2023/02/demon-slayer-season-3-release-date.jpg" class="d-block w-100" alt="value">

                    </div>
                    <div class="carousel-item ">
                        <img style="height: 600px; width: 100%;" src="https://i0.wp.com/www.theperiodictableofawesome.com/wp-content/uploads/2016/10/Doctor_Strange.jpg?fit=1200%2C600&ssl=1" class="d-block w-100" alt="value">
                    </div>
                    <div class="carousel-item ">
                        <img style="height: 600px; width: 100%;" src="https://i0.wp.com/boingboing.net/wp-content/uploads/2022/07/in-theaters-gentleminions-tiktok-trend-sends-dozens-of-suit-wearing-teenagers-to-see-minions-the-ris.jpeg?fit=1200,600&ssl=1" class="d-block w-100" alt="value">

                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <h1 style="text-align: center; text-transform: uppercase; margin: 20px;">Movie Selection</h1>
            <div class="row" style="margin:  30px 0;">
                <c:forEach var="f" items="${flist}">
                    <div class="col-md-4" style="display: flex; justify-content: center">
                        <a href="Detail?fid=${f.getFilmID()}" style="text-decoration: none; color: black;">
                            <img style="height: 260px; width:150px;" src="${f.getImg()}">
                            <div style="width: 176px;">
                                <h5>${f.getTitle()}</h5>
                                <p><b>Category:</b>${f.getGenre().name}<br>
                                    <b>Years:</b>${f.getYear()} </p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

        <jsp:include page="./layout/footer.jsp"/>

    </body>
</html>
