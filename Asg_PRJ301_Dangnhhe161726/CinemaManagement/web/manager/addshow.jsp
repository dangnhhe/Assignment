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
            <h1 style="text-align: center;margin: 50px 0;">Add new Show</h1>
            <form method="post" action="AddShow">
                <div class="row" >
                    <div class="col-md-2"></div>
                    <div class="col-md-8" >
                        <div class="row">
                            <div class="col-md-6">
                                <label class="label-control">Room</label> 
                                <select name="room" class="form-control">
                                    <c:forEach var="r" items="${rlist}">
                                        <option value="${r.id}">${r.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="label-control">Slot</label> 
                                <select name="slot" class="form-control">
                                    <c:forEach var="s" items="${slist}">
                                        <option value="${s.id}">${s.time}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label class="label-control">Film </label> 
                                <select name="fid" class="form-control">
                                    <c:forEach var="f" items="${flist}">
                                        <option value="${f.getFilmID()}">${f.getTitle()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label class="label-control">Show Date</label> 
                                <input type="date" name="showdate" class="form-control">
                            </div>
                            <div class="col-md-6">
                                <label class="label-control">Price</label> 
                                <input type="number" step="0.01" name="Price" class="form-control">
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
    