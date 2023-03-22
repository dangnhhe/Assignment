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
        <style>
            td{
                font-size: 14px;
            }
        </style>
        <jsp:include page="./header.jsp"/>
        <div class="container"> 
            <h1 style="text-align: center;">Booking</h1>

            <div class="row">
                <table id="tablepro" class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Show Date</th>
                            <th>Time</th>
                            <th>Room</th>
                            <th>Price</th>
                            <th>Film</th>
                            <th>Seat</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${listAllBooking}">
                            <tr>
                                <td>${s.id}</td>
                                <td>${s.user.fullname}</td>
                                <td>${s.user.phone}</td>
                                <td>${s. getShow().getShowDate()}</td>
                                <td>${s.show.slot.time}</td>
                                <td>${s.show.room.name}</td>
                                <td>${s.getAmount()} VND</td>
                                <td>${s.getShow().getFilms().getTitle()}</td>
                                <td>${s.seatStatus}</td>
                                <td>${s.status?"Active":"Inactive"}</td>
                                <td><a onclick="confirmSubmit()" href="DeleteManagerBooking?sid=${s.id}" class="btn btn-danger">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#tablepro").DataTable();
            });
            function  confirmSubmit() {
                let text = "Do you want to Delete Seat?";
                if (confirm(text) == true) {
                    document.getElementById("form1").submit();
                } else {
                }
            }
        </script>
    </body>
</body>
</html>
