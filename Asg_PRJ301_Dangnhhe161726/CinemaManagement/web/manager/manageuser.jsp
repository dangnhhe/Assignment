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
        <jsp:include page="./header.jsp"/>
        <div class="container">   
            <h1 style="text-align: center;">User List</h1>
            <div class="row">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${userl}">
                            <tr>
                                <td>${u.getUser_id()}</td>
                                <td>${u.getFullname()}</td>
                                <td>${u.getEmail()}</td>
                                <td>${u.isGender()?"Male":"Female"}</td>
                                <td>${u.getPhone()}</td>
                                <td>${u.getAddress()}</td>
                                <td><a href="DeleteUser?uid=${u.getUser_id()}" class="btn btn-danger">Delete</a></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </div>
        </div>

    </body>
</html>
