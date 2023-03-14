<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <style>
            .seat-select div:hover{
                background-color: greenyellow;
                color: red;
                cursor: pointer;
            }
            .seat-select div{
                width: 8%; border: 1px solid greenyellow; padding: 3px; margin: 5px; text-align: center; font-weight: 500;
            }
            .div-active{
                background-color: greenyellow;
                color: red;
                cursor: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container">
            <div class="row">
                <h1 style="text-align: center;"> BOOKING ONLINE</h1>
                <h4 style="background-color: #fff1ce;text-align: center;">${s.getRoom().name} | ${s.getShowDate()}| ${s.getSlot().time}</h4>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">    
                    <h3 style="text-align: center;">SCREEN</h3>

                    <div style="width: 550px; height: 3px; border-bottom: 2px solid gray;"></div>
                    <div style="display: flex; flex-wrap: wrap;" class="seat-select">
                        <c:forEach var="se" items="${seats}">
                            ${se}
                        </c:forEach>

                    </div>
                    <div>
                        <h3>Notes:</h3>
                        <div style="width: 35px; border: 1px solid greenyellow; padding: 3px; margin: 5px; text-align: center; font-weight: 500; display: inline-block">A3</div> Available seat<br>
                        <div style="width: 35px; border: 1px solid greenyellow; padding: 3px; margin: 5px; text-align: center; font-weight: 500; display: inline-block;background-color: greenyellow;color: red;">A3</div> Not available seat<br>
                    </div>
                    <form method="post" action="Booking" id="form1">
                        <label >Select Seat</label>
                        <input type="hidden" value="${param.showid}" name="showid">
                        <input type="hidden" value="${s.getPrice()}" name="amount">
                        <input class="form-control" style="margin: 5px;" name="bookingseats" type="text" placeholder="A1,A2,A3">
                        <p style="color: red">${msg}</p>
                        <input class="btn btn-warning" type="button" onclick="confirmSubmit()" value="Booking">
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <jsp:include page="./layout/footer.jsp"/>
        <script>
            function  confirmSubmit() {
                let text = "Do you want to Booking these seats?";
                if (confirm(text) == true) {
                    document.getElementById("form1").submit();
                } else {
                }
            }
        </script>
    </body>
</html>
