<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="Home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <img style="height: 42px; width: 42px;" src="https://newtwb.s3.amazonaws.com/images/develcgv/cgv_icon.png"  >
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" style="font-size: 18px;">
                <li><a href="Dashboard" class="nav-link px-3 text-white">Statistical</a></li>
                <li><a href="ManageUser" class="nav-link px-3 text-white">Manage User</a></li>
                <li><a href="ManageShow" class="nav-link px-3 text-white">Manage Show</a></li>
                <li><a href="ManageFilm" class="nav-link px-3 text-white">Manage Film</a></li>
                <li><a href="ManagerSeat" class="nav-link px-3 text-white">Manage Booking</a></li>
            </ul>
            <div class="text-end">
                <a href="Home"  class="btn btn-outline-light me-2">Home</a>
                <a href="Logout" class="btn btn-warning">Logout</a>
            </div>
        </div>
    </div>
</header>