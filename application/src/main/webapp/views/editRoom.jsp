<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/meetingroommanagement/css/style.css">
    <title>Edit Room | HMeets</title>
</head>

<body id="page-container">
<%@page import="java.util.*, com.hsbc.meets.entity.*" %>
<%
	User user = (User)request.getSession().getAttribute("user");
	pageContext.setAttribute("user", user); 
    MeetingRoom room = (MeetingRoom) request.getAttribute("room");
    pageContext.setAttribute("room", room);
    List<String> amenities = (List<String>) request.getAttribute("amenities");
    pageContext.setAttribute("amenities", amenities);
%>
    <header>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-dark" style="height: 8vh">
            <div class="container">
                <!-- Logo -->
                <img src="images/logo.png" height="30" alt="" />
                <h4 class="text-white ms-4 my-auto">HMeets</h4>
                <!-- Logo -->

                <!-- Menu button -->
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarButtons" aria-controls="navbarButtons" aria-expanded="true" aria-label="Toggle navigation">
                    <img src="/meetingroommanagement/resources/images/icon_menu.png" height="22" alt="" class="me-1" />
                </button>
                <!-- Menu button -->

                <!-- Nav Items -->
                <div class="collapse navbar-collapse align-items-center" id="navbarButtons">
                    <div class="me-auto"></div>
                    <!-- <small class="text-info me-4">Link</small> -->
                    <ul class="align-nav-item">
                        <img src="/meetingroommanagement/resources/images/icon_user.png" height="16" alt="" class="me-1" />
                        <small class="text-white me-4">Hi! ${ user.name }</small>
                    </ul>
                    <ul class="align-nav-item">
                        <a href="">
                            <button type="button" class="btn btn-outline-info" data-mdb-ripple-color="dark">
                                Logout
                            </button>
                        </a>
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
                        <img src="/meetingroommanagement/resources/images/bg_add_room.png" class="img-fluid" alt="Login">
                    </div>
                    <div class="col-9 col-sm-9 col-md-9 col-lg-6 col-xl-4 offset-xl-1">
                        <form action="http://localhost:8080/meetingroommanagement/meetingroom" method="POST">
                            <!--Hidden flag-->
                            <input type="hidden" name="editflag" value="true" />
                            <div class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                <p class="lead mb-0 me-3">Edit the Meeting Room</p>
                            </div>

                            <!-- Meeting ID -->
                            <div class="form-outline mt-4 mb-1">
                                <input type="number" name="mid" id="meetingId" class="form-control form-control-lg" value="${room.meetingRoomId}" readonly />
                                <label class="form-label" for="meetingId">${room.meetingRoomId}</label>
                            </div>
                            <!-- Meeting Name -->
                            <div class="form-outline mt-4 mb-1">
                                <input type="text" name="mname" id="meetingName" class="form-control form-control-lg" value="${room.meetingRoomName}" placeholder="Enter unique room name" required />
                                <label class="form-label" for="meetingName">Room name</label>
                            </div>
                            <!--Message-->
                            <!-- <div class="d-flex align-items-center justify-content-center my-1 error-info">
                                Name already exists
                            </div> -->
                            <!-- Room Capacity -->
                            <div class="form-outline my-3">
                                <input type="number" name="mcapacity" id="meetingCapacity" class="form-control form-control-lg" value="${room.seatingCapacity} placeholder="Enter capacity" required />
                                <label class="form-label" for="meetingCapacity">Room capacity</label>
                            </div>

                            <!--Checkboxes-->
                            <div class="row">
                                <div class="col-md-6">
                                    <e:forEach items="${amenities}" var="amenity">
		                                <div class="form-check">
	                                        <input class="form-check-input" type="checkbox" value="${ amenity }" id="flexCheckDefault" name="amenities" />
	                                        <label class="form-check-label" for="flexCheckDefault">
	                                            ${ amenity }
	                                        </label>
	                                    </div>
                                   	</e:forEach>
                                </div>
                            </div>

                            <!--/Checkboxes-->

                            <!--Add button-->
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <a href="admin.jsp">
                                        <button type="button" class="btn" id="btnadminoutline">
                                            Cancel
                                        </button>
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <input class="btn" id="btnadmin" type="submit" value="Update" />
                                </div>
                            </div>
                            <!--Add button-->
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
            © 2021 Copyright: HSCC Meettings
        </div>
    </footer>
    <!--/.Footer-->

    <!--scripts-->
    <script src="/meetingroommanagement/scripts/scripts.js"></script>
    <!--scripts-->
</body>

</html>