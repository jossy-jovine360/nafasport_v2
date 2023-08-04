<%-- 
    Document   : header
    Created on : 2 Mar 2023, 3:38:33 PM
    Author     : josiah
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA | Official Site of the National American Football Association</title>
        <meta charset="UTF-8">
        <meta name="description" content="NAFA>
        <meta name="keywords" content="NAFA, American Football, Football League, Football">
        <meta name="author" content="NAFA">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- ============================== favicon script section =============================== -->
        <link rel="apple-touch-icon" sizes="180x180" href="favs/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favs/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favs/favicon-16x16.png">
        <link rel="manifest" href="favs/site.webmanifest">
        <link rel="mask-icon" href="favs/safari-pinned-tab.svg" color="#5bbad5">
        <link rel="shortcut icon" href="favs/favicon.ico">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="msapplication-config" content="favs/browserconfig.xml">
        <meta name="theme-color" content="#ffffff">
        
        
        <!-- ============================== favicon script section =============================== -->

        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/margin.css">
        <link rel="stylesheet" type="text/css" href="css/padding.css">
        <link rel="stylesheet" type="text/css" href="css/text-size.css?v=1">
        <link rel="stylesheet" type="text/css" href="css/style.css?v=1">
        <link rel="stylesheet" type="text/css" href="css/dimension.css">
        <link rel="stylesheet" type="text/css" href="css/form.css">
        <link rel="stylesheet" type="text/css" href="css/tooltip.css">
        <link rel="stylesheet" type="text/css" href="css/border_radius.css">
        <link rel="stylesheet" type="text/css" href="css/navigation.css">
        <link rel="stylesheet" type="text/css" href="css/fontawesome-6.1.1/css/all.min.css"/>
        <script type="text/javascript" src="js/datetime.js"></script>
        <script type="text/javascript" src="js/session.js"></script>
        <script type="text/javascript" src="js/form_validator.js"></script>
        <script type="text/javascript" src="js/alerts.js"></script>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <!--<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>-->
        <script type="text/javascript" src="js/popper.min.js"></script>  
        <script type="text/javascript">
            $(document).ready(function () {
                // Initialize tooltips & popovers
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });
                var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
                var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
                    return new bootstrap.Popover(popoverTriggerEl);
                });
                // end of initializing

                
                $("#alert-panel").click(function () {
                    $("#alert-panel").fadeOut(500);
                });
                $("#btn-toggle").click(function (){
                    $("#navbarNavDropdown").slideToggle("slow");
                });
                
            });
            /*
             * For custom alerts notifications, use any of the functions below:
             * displayNotice(topic, msg);
             * displayDynaNotice(topic, msg, topicid, msgid, panelid);
             */


        </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary bg-darkorange sticky-top w-100 " data-bs-theme="">
            <div class="container">
                <div class="row w-100">
                    <div class="col-lg-2 col-md-2 col-sm-12">
                        <div class="row">
                            <div class="col-10">
                                <a class="navbar-brand" href="./">
                                    <img src="images/nafa_full.png" alt="alt" class="img-logo"/>
                                </a>
                            </div>
                            <div class="col-2">
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" id="btn-toggle" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <!--<button class="" type="button"  id="btn-toggle" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">-->
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-12 ">
                        <div class="collapse navbar-collapse ms-lg-4 ms-md-4 d-flex justify-content-lg-end" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item w-100">
                                    <a class="nav-link active text-white w-100" aria-current="page" href="./">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="aboutus.jsp">About NAFA</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="news.jsp">News</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="scores.jsp">Scores</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="schedules.jsp">Schedule</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="teams.jsp">Teams</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="players-list.jsp">Players</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="#">Stats</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="standings.jsp">Standings</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-white" href="contactus.jsp">Contact</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
