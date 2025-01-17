<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/meetingroommanagement/css/style.css">
    <title>Login | HMeets</title>
</head>

<body id="page-container">
    <header>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-dark" style="height: 8vh">
            <div class="container">
                <!-- Logo -->
                <img src="/meetingroommanagement/resources/images/logo.png" height="30" alt="" />
                <h4 class="text-white ms-4 my-auto">HMeets</h4>
                <!-- Logo -->

                <!-- Menu button -->
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarButtons" aria-controls="navbarButtons" aria-expanded="true" aria-label="Toggle navigation">
                    <img src="images/icon_menu.png" height="22" alt="" class="me-1" />
                </button>
                <!-- Menu button -->

                <!-- Nav Items -->
                <div class="collapse navbar-collapse" id="navbarButtons">
                    <div class="me-auto"></div>
                    <!-- <small class="text-info me-4">Link</small> -->
                    <ul class="align-nav-item">
                        <img src="/meetingroommanagement/resources/images/icon_user.png" height="16" alt="" class="me-1" />
                        <small class="text-white me-4">Hi! User</small>
                    </ul>
                 
                    <!-- </div> -->
                </div>
                <!-- Nav Items -->
            </div>
        </nav>
        <!-- Navbar -->
    </header>
    <main id="content-wrap">
        <section>
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class=" col-6 col-sm-4 col-md-4 col-lg-6 col-xl-5">
                        <img src="/meetingroommanagement/resources/images/bg_login.png" class="img-fluid" alt="Login">
                    </div>
                    <div class="col-9 col-sm-9 col-md-9 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="login" method="POST">
                            <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                <p class="lead mb-0 me-3">Login</p>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mt-4 mb-4">
                                <input type="email" name="email" id="emailField" class="form-control form-control-lg" placeholder="Enter email address" required />
                                <label class="form-label" for="emailField">Email address</label>
                                <!-- add value="${email}" to input tag -->
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <input type="password" name="password" id="passwordField" class="form-control form-control-lg" placeholder="Enter password" required />
                                <label class="form-label" for="passwordField">Password</label>
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <input class="btn btn-primary btn-lg" type="submit" value="Login" />
                            </div>

                            <!--Message-->
                            <!--  <div class="d-flex align-items-center justify-content-center my-3 error-info">
                                Invalid Credentials
                            </div>
                            -->
                        </form>
                    </div>
                </div>
            </div>

        </section>
    </main>

    <!--Footer-->
    <footer id="footer">
        <div>
            <hr class="my-2">
        </div>
        <div class="footer-copyright d-flex align-items-center justify-content-center">
            � 2021 Copyright: HSCC Meettings
        </div>
    </footer>
    <!--/.Footer-->

    <!--scripts-->
    <script src="/meetingroommanagement/scripts/scripts.js"></script>
    <!--scripts-->
</body>

</html>