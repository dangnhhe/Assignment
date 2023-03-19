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
        <div class="container" >
            <h1 style="text-align: center;">List All Film</h1>
            <div style="margin-top: 20px"> 
                <form method="get" action="FilmList">
                    <div class="row">
                        <div class="col-md-1"><span >Year</span></div>
                        <div class="col-md-3">
                            <select name="year" class="form-control">
                                <option value="">All</option>
                                <option value="2019" ${param.year == 2019?"selected":""}>2019</option>
                                <option value="2020" ${param.year == 2020?"selected":""}>2020</option>
                                <option value="2021" ${param.year == 2021?"selected":""}>2021</option>
                                <option value="2022" ${param.year == 2022?"selected":""}>2022</option>
                                <option value="2022" ${param.year == 2023?"selected":""}>2023</option>
                            </select>
                        </div>        
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-1"><span>Genres</span></div>
                        <div class="col-md-3">
                            <select name="gid" class="form-control">
                                <option value="">All</option>
                                <c:forEach var="g" items="${glist}">
                                    <option value="${g.id}" ${param.gid == g.id?"selected":""}>${g.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <input type="Submit"  class="btn btn-primary" value="Find">
                        </div>


                    </div>
                </form>
            </div>
            <div class="row">
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
        </div>

        <jsp:include page="./layout/footer.jsp"/>

    </body>
</html>
