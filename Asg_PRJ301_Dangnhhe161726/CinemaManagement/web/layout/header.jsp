<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="Home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img src="https://scontent.xx.fbcdn.net/v/t1.15752-9/288998635_7700566870018685_1610126571779614075_n.jpg?stp=dst-jpg_p403x403&_nc_cat=111&ccb=1-7&_nc_sid=aee45a&_nc_ohc=T3dJ5V6vl-QAX8TJ5Al&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKqbymBEmcVrbdM3-MNPW2v9QYc4kd0EkG6u9GU0a66vg&oe=6305BC30" height="42px" >
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" style="font-size: 18px;">
                <li><a href="Home" class="nav-link px-3 text-secondary">Home</a></li>
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
                    <a href="Logout" class="btn btn-warning">Logout</a>
                </c:if>
            </div>
        </div>
    </div>
</header>