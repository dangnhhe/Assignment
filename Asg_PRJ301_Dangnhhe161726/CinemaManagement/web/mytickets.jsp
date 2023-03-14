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

    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container" >
            <h1 style="text-align: center; margin: 10px;">My booked tickets</h1>
            <div class="row">
                <table class="table table-hover" id="tablepro">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Show Date</th>
                            <th>Slot</th>
                            <th>Room</th>
                            <th>Price</th>
                            <th>Film</th>
                            <th>Seat</th>
                            <th>Action</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="b" items="${blist}">
                            <tr style="font-size: 17px;">
                                <td>${b.id}</td>
                                <td>${b.show.getShowDate()}</td>
                                <td>${b.show.getSlot().time}</td>
                                <td>${b.show.getRoom().name}</td>
                                <td>${b.getAmount()} VND</td>
                                <td>${b.show.getFilms().getTitle()}</td>
                                <td>${b.getSeatStatus()}</td>
                                <td><a href="DeleteBooking?bid=${b.id}" class="btn btn-danger">Delete</a></td>
                                <c:if test="${b.isStatus()}">
                                    <td><a href="Unbooking?bid=${b.id}" class="btn btn-warning">Unbooking</a></td>
                                    </c:if>
                                    <c:if test="${!b.isStatus()}">
                                    <td><a class="btn btn-default btn-outline-primary">None</a></td>
                                    </c:if>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </div>
        </div>

        <jsp:include page="./layout/footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#tablepro").DataTable();
            });
        </script>
    </body>
</html>
