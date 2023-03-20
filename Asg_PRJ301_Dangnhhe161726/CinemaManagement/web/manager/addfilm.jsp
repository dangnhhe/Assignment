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
            <h1 style="text-align: center;margin: 50px 0;">Add new Film</h1>
            <form method="post" action="AddFilm">
                <div class="row" >
                    <div class="col-md-2"></div>
                    <div class="col-md-8" >
                        <div class="row">
                            <div class="col-md-6">
                                <label class="label-control">Title</label> 
                                <input type="text" name="title" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label class="label-control">Genre</label> 
                                <select name="genre" class="form-control">
                                    <c:forEach var="g" items="${glist}">
                                        <option value="${g.id}">${g.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="label-control">Year</label> 
                                <input type="text" name="year" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label class="label-control">Country</label> 
                                <input type="text" name="country" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label class="label-control">Image</label> 
                                <input type="text" name="img" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label class="label-control">Trailer</label> 
                                <input type="text" name="trailer" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <input type="submit" value="Add" style="margin: 10px;" class="btn btn-primary">
                            </div>
                        </div>   
                    </div>

                </div>

            </form>
        </div>

    </body>
</html>
