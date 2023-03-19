<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="Home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img style="height: 42px; width: 42px;" src="https://newtwb.s3.amazonaws.com/images/develcgv/cgv_icon.png"  >
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" style="font-size: 18px;">
                <li><a href="Home" class="nav-link px-3 text-white">Home</a></li>
                <li><a href="FilmList" class="nav-link px-3 text-white">Film List</a></li>
            </ul>
            <div class="text-end">
                <c:if test="${sessionScope.account==null}">
                    <a href="Login"  class="btn btn-outline-light me-2">Login</a>
                    <a href="Register" class="btn btn-warning">Register</a>
                </c:if>
                <c:if test="${sessionScope.account.getRole()==1}">
                    <a href="ManageShow"  class="btn btn-outline-light me-2">Manager page</a>

                </c:if>
                <c:if test="${sessionScope.account!=null}">
                    <a href="MyTickets"  class="btn btn-outline-light me-2">My Tickets</a>
                    <a href="profile"  class="btn btn-outline-light me-2">Profile</a>
                    <a href="Logout" class="btn btn-warning">Logout</a>
                    
                </c:if>
            </div>
        </div>
    </div>
</header>