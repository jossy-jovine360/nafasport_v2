<%-- 
    Document   : navigation
    Created on : 29 Oct 2022, 3:28:51 PM
    Author     : josiah
--%>

<%@page import="daos.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String portal = (String)request.getAttribute("portal");
            if(portal == null){
                portal = "";
            }else{
                portal = "coaches/";
            }
            
            String email = (String)session.getAttribute("email");
            String profile = "";
            String name = (String)session.getAttribute("name");
            String teamid = (String)session.getAttribute("teamid");
            String coachno = (String)session.getAttribute("coachno");
            String lastlogin = "";
            if(email == null){
                String user = request.getParameter("i").trim();
                response.sendRedirect("index.jsp");
            }
            
            String msg = (String)request.getAttribute("msg");
            String disp = "hidden";
            if(msg == null){
                msg = "";
            }else{
                disp = "show";
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <meta charset="UTF-8">
        <meta name="description" content="Jovine360 Mall>
              <meta name="keywords" content="Josiah, Orie, Josiah Orie, Sir Jossy">
        <meta name="author" content="Jovine360 Solutions">
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

        <link rel="stylesheet" type="text/css" href="<%= portal %>css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/margin.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/padding.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/text-size.css?v=1">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/style.css?v=1">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/dimension.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/form.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/tooltip.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/border_radius.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/navigation.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/fontawesome-6.1.1/css/all.min.css"/>
        <script type="text/javascript" src="<%= portal %>js/datetime.js"></script>
        <script type="text/javascript" src="<%= portal %>js/session.js"></script>
        <script type="text/javascript" src="<%= portal %>js/form_validator.js"></script>
        <script type="text/javascript" src="<%= portal %>js/alerts.js"></script>
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

                setInterval(function () {
                    var email = $("#logout_email").val();
                    checksession(email);
                }, 601000);

                $("#alert-panel").click(function () {
                    $("#alert-panel").fadeOut(500);
                });
            });
            /*
             * For custom alerts notifications, use any of the functions below:
             * displayNotice(topic, msg);
             * displayDynaNotice(topic, msg, topicid, msgid, panelid);
             */


        </script>
        <style>
            .logo-icon{
                width: 60%;
                height: 100px;
            }
            @media (max-width: 800px){
                .logo-icon{
                    width: 40%;
                    height: 100px;
                }
            }
        </style>
    </head>
    <body class="">
        <div class="container-fluid  bg-light">
            <div class="row mb-5">
                <div class="col-12 pt-3">
                    <div class="width-100 text-center">
                        <img src="<%= portal %>images/nafa_logo.png" alt="logo" class="logo-icon"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <a href="#" class="link text-decoration-none text-color-gray border-right-radius-5px">
                    <div class="col-12 p-2">
                        <span class="">Dashboard</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>dashboard.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-home me-2"></span>
                        <span class="">Home</span>
                    </div>
                </a>
            </div>
            <div class="row mb-3">
                <a href="<%= portal %>changepass.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-home me-2"></span>
                        <span class="">Change Password</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="#" class="link text-decoration-none text-color-gray border-right-radius-5px">
                    <div class="col-12 p-2">
                        <span class="">Teams</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>teams.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-building-user me-2"></span>
                        <span class="">Manage Teams</span>
                    </div>
                </a>
            </div>
            <div class="row mb-3">
                <a href="<%= portal %>teams_brand.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-flag me-2"></span>
                        <span class="">Add Team's Emblem</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="#" class="link text-decoration-none text-color-gray border-right-radius-5px">
                    <div class="col-12 p-2">
                        <span class="">Players</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>players_teams.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-people-group me-2"></span>
                        <span class="">Manage Team Players</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>players_profile.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-people-group me-2"></span>
                        <span class="">Add Players Profile</span>
                    </div>
                </a>
            </div>
            
            <div class="row">
                <a href="#" class="link text-decoration-none text-color-gray border-right-radius-5px">
                    <div class="col-12 p-2">
                        <span class="">League Groups</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>groups_standings.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-layer-group me-2"></span>
                        <span class="">Group Standings</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="#" class="link text-decoration-none text-color-gray border-right-radius-5px">
                    <div class="col-12 p-2">
                        <span class="">Games</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>games_fixtures.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-football me-2"></span>
                        <span class="">Game Fixtures</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>games_stats.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-football me-2"></span>
                        <span class="">Games Statistics</span>
                    </div>
                </a>
            </div>
            <div class="row mb-3">
                <a href="<%= portal %>games_standings.jsp?i=<%= email %>" class="link-item text-decoration-none text-black border-right-radius-5px ps-4">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-football me-2"></span>
                        <span class="">Games Standings</span>
                    </div>
                </a>
            </div>
            <div class="row">
                <a href="<%= portal %>logout.jsp?email=<%= email %>" class="link text-decoration-none text-color-gray border-right-radius-5px">
                    <div class="col-12 p-1 ">
                        <span class="fa fa-sign-out me-2"></span>
                        <span>Sign out</span>
                    </div>
                </a>
            </div>
        </div>

        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
