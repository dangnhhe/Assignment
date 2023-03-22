

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
                    <h3 >Change Password</h3>
                    <div class="modal-body">
                        <form method="post" action="changepassword">
                            <div class="form-group">
                                <label>Old Password</label>
                                <div class="col-lg-12">
                                    <input type="password" required="" id="oldpasswordcp" name="oldPassword" class="form-control" placeholder="Old password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>New Password</label>
                                <div class="col-lg-12">
                                    <input type="password" required="" id="passwordcp" name="password" class="form-control" placeholder="New password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <div class="col-lg-12">
                                    <input type="password" required=""  id="cfpasswordcp" name="rePassword" class="form-control" placeholder="Confirm Password">
                                </div>
                            </div>
                            <span style="color: red;
                                  font-weight: 500;" >${msg}
                            </span>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-12">
                                    <input type="submit" class="btn btn-primary" value="Save Changes">
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="./layout/footer.jsp"/>
    </body>
</html>
