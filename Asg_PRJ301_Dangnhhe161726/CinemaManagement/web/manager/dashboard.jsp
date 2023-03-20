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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="./header.jsp"/>
        <div class="container">  
            <div class="row">
                <div class="col-md-3 " style="height:50px; font-size: 25px; text-align:  center;">Total Profit</div>
                <div class="col-md-3 " style="height:50px; font-size: 25px; text-align: center; ">Total Selled Tickets</div>
                <div class="col-md-3 " style="height:50px; font-size: 25px; text-align: center; ">Total User</div>
                <div class="col-md-3 " style="height:50px; font-size: 25px; text-align: center; " >Total Film In System</div>
            </div>
            <div class="row">
                <div class=" btn btn-success" style="height:50px; font-size: 25px;margin: 20px; width: 21%;"><i class="fa fa-usd" aria-hidden="true"></i> ${profit}</div>
                <div class=" btn btn-success" style="height:50px; font-size: 25px;margin:  20px;width: 21%;"><i class="fa fa-ticket" aria-hidden="true"></i> ${numTickets}</div>
                <div class="btn btn-success" style="height:50px; font-size: 25px;margin:  20px;width: 21%;"><i class="fa fa-user-circle-o" aria-hidden="true"></i> ${numUsers}</div>
                <div class=" btn btn-success" style="height:50px; font-size: 25px;margin:  20px;width: 21%;"><i class="fa fa-film" aria-hidden="true"></i> ${numfilms}</div>
            </div>
            <div class="row">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Title</th>
                            <th>Number Tickets</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="l" items="${list}">
                            <tr>

                                ${l}
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </div>
        </div>
    </body>
</html>
