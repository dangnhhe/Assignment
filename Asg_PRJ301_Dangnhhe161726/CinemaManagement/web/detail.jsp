<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <h1 style="text-align: center; border-bottom: 1px solid black">Film Detail</h1>

        <div class="container" >
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-2">
                    <img src="${f.getImg()}" width="190px;">
                </div>
                <div class="col-md-7">
                    <h2 style="border-bottom:  1px solid black">${f.getTitle()}</h2>
                    <p><b>Category:</b>${f.getGenre().name}<br>
                        <b>Country:</b>${f.getCountryCode()}<br>
                        <b>Language:</b> Vietsub<br>
                        <b>Years:</b>${f.getYear()} <br>
                        <b>Price:</b>55.000 VND</p>
                    <h3>Booking</h3>
                    <c:forEach var="s" items="${slist}">
                        <div style="border: 1px solid gray; margin: 5px; display: inline-block; width:100px; ">
                            <a href="Booking?showid=${s.getId()}" style=" display: block; text-decoration: none; color: black; text-align: center" >
                                ${s.getShowDate()}<br>
                                ${s.getSlot().time}<br>
                            </a>
                        </div>

                    </c:forEach>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-9" >
                    <h2 style="padding: 15px;border-bottom:  1px solid black;">Trailer</h2>
                    <div class="embed-responsive embed-responsive-16by9">
                        ${f.getTrailer()}
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="./layout/footer.jsp"/>

    </body>
</html>
