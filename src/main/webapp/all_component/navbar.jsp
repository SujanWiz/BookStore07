<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <!-- Website Logo -->
        <div class="col-md-3">
            <h3>
                <i class="fa-solid fa-book"></i> Books
            </h3>
        </div>
        
        <!-- Search Bar -->
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="get">
                <input class="form-control mr-sm-2" type="search" name="query" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>

        <!-- User Actions -->
        <div class="col-md-3">
            <c:choose>
                <!-- When user is logged in -->
                <c:when test="${not empty userobj}">
                    <a href="checkout.jsp"><i class="fa-solid fa-cart-shopping fa-3x"></i></a>
                    <a href="profile.jsp" class="btn btn-success">
                        <i class="fa-solid fa-user"></i> Welcome, ${userobj.name}
                    </a>
                    <a data-toggle="modal" data-target="#logoutModal" class="btn btn-primary">
                        <i class="fa-solid fa-right-to-bracket"></i> Logout
                    </a>
                </c:when>
                
                <!-- When user is not logged in -->
                <c:otherwise>
                    <a href="register.jsp" class="btn btn-success">
                        <i class="fa-solid fa-user-plus"></i> Register
                    </a>
                    <a href="login.jsp" class="btn btn-primary">
                        <i class="fa-solid fa-right-to-bracket"></i> Login
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Logout Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <h4>Do you want to logout?</h4>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="logout.jsp" class="btn btn-primary text-white">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="index.jsp">
        <i class="fa-solid fa-house"></i>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">
                    <i class="fa-solid fa-house"></i> Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="all_recent_book.jsp">
                    <i class="fa-solid fa-book-open"></i> Recent Books
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="all_new_book.jsp">
                    <i class="fa-solid fa-book-open"></i> New Books
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="all_old_book.jsp">
                    <i class="fa-solid fa-book-open"></i> Old Books
                </a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="settings.jsp" class="btn btn-light my-2 my-sm-0">
                <i class="fa-solid fa-gears"></i> Settings
            </a>
            <a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-1">
                <i class="fa-solid fa-mobile-screen"></i> Contact Us
            </a>
        </form>
    </div>
</nav>
