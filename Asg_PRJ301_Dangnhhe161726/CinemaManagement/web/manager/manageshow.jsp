<%-- 
    Document   : newjsp
    Created on : Jul 27, 2022, 10:41:12 AM
    Author     : Admin
--%>
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
        <jsp:include page="./header.jsp"/>
        <div class="container"> 
            <h1 style="text-align: center;">Show List</h1>

            <div class="row">
                <a href="AddShow" class="btn btn-primary" style="margin: 10px; width: 150px;">Add New</a>
                <table id="tablepro" class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Room</th>
                            <th>Film</th>
                            <th>Show Date</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Slot</th>
                            <th>Action</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${slist}">
                            <tr>
                                <td>${s.id}</td>
                                <td>${s.room.name}</td>
                                <td>${s.films.title}</td>
                                <td>${s.getShowDate()}</td>
                                <td>${s.getPrice()} VND</td>
                                <td>${s.isStatus()?"Active":"Inactive"}</td>
                                <td>${s.slot.time}</td>
                                <td><a href="DeleteShow?sid=${s.id}" class="btn btn-danger">Delete</a></td>
                                <td><a href="EditShow?sid=${s.id}" class="btn btn-warning">Edit</a></td>

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
        </script>
    </body>
</html>
