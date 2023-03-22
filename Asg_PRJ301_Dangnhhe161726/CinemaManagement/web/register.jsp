
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/js/bootstrap.min.js" integrity="sha512-8Y8eGK92dzouwpROIppwr+0kPauu0qqtnzZZNEF8Pat5tuRNJxJXCkbQfJ0HlUG3y1HB3z18CSKmUo7i2zcPpg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" integrity="sha512-XWTTruHZEYJsxV3W/lSXG1n3Q39YIWOstqvmFsdNEEQfHoZ6vm6E9GK2OrF6DSJSpIbRbi+Nn0WDPID9O7xB2Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>    
    </head>
    <body>
        <jsp:include page="./layout/header.jsp"/>
        <div class="container">
            <div class="row" style="margin: 100px;">
                <div class="col-md-4"></div>
                <div class="col-md-4">

                    <form method="post" action="Register">
                        <img class="mb-4" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/288998635_7700566870018685_1610126571779614075_n.jpg?stp=dst-jpg_p403x403&_nc_cat=111&ccb=1-7&_nc_sid=aee45a&_nc_ohc=T3dJ5V6vl-QAX8TJ5Al&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKqbymBEmcVrbdM3-MNPW2v9QYc4kd0EkG6u9GU0a66vg&oe=6305BC30" alt="" width="80" >
                        <h1 class="h3 mb-3 fw-normal">Please Register</h1>
                        <div class="form-floating">
                            <input type="text" name="fullname"  class="form-control" id="floatingInput" placeholder="Nguyen Van An">
                            <label for="floatingInput">Full Name</label>
                        </div>
                        <div class="form-floating">
                            <input type="text" name="phone"  class="form-control" id="floatingInput" placeholder="0123456789">
                            <label for="floatingInput">Phone</label>
                        </div>
                        <div class="form-floating">
                            <input type="text" name="address"  class="form-control" id="floatingInput" placeholder="Ha Noi">
                            <label for="floatingInput">Address</label>
                        </div>
                        <div class="form-floating" style="padding: 10px;">
                            <span class="auth-form__input">Gender:  <label style="margin-left: 25px;">   <input id="male" type="radio" value="1" name="gender" required="required">  Male  </label> <label style="margin-left: 25px;"> <input id="female" type="radio" value="0" name="gender">  Femle</label></span>
                        </div>
                        <div class="form-floating">
                            <input type="email" name="email"  class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" name="repassword" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="checkbox mb-3">
                            <p style="color: red;">${msg}</p>
                        </div>
                        <button class="w-100 btn btn-lg btn-primary" type="submit">Register</button>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="./layout/footer.jsp"/>

    </body>
</html>
