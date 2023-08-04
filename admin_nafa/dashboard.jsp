<%-- 
    Document   : dashboard
    Created on : 28 Oct 2022, 12:16:00 AM
    Author     : josiah
--%>

<%@page import="daos.PlayerDAO"%>
<%@page import="daos.CoachDAO"%>
<%@page import="daos.TeamDAO"%>
<%@page import="daos.LeagueDAO"%>
<%@page import="daos.AdminDAO"%>
<%@page import="com.jovine.ellipsis.Ellipsis"%>
<%@page import="daos.ReportDAO"%>
<%@page import="com.jovine.currency.Formatter"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="appData.AppData"%>
<%@page import="com.jovine.date.DateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String portal = (String)request.getAttribute("portal");
            if(portal == null){
                portal = "";
            }else{
                portal = "admin_nafa/";
            }
            
            String username = (String)session.getAttribute("username");
            String profile = "";
            String name = "";
            String lastlogin = "";
            if(username == null){
                String user = request.getParameter("i").trim();
                response.sendRedirect("logout.jsp?username="+user);
            }else{
                profile = AdminDAO.getAdminProfileByUsername(username);
                name = AdminDAO.getAdminFullnameByUsername(username);
                lastlogin = AdminDAO.getLastLoginByUsername(username);
                if(lastlogin == null || lastlogin.equals("")){}else{
                    lastlogin = lastlogin.substring(0, lastlogin.length()-2);
                } 
            }
            String domain = AppData.DOMAIN_ADMIN;
//            System.out.println("Admin: "+total_admins);
            
            String msg = (String)request.getAttribute("msg");
            String disp = "hidden";
            if(msg == null){
                msg = "";
            }else{
                disp = "show";
            }
            int total_leagues = LeagueDAO.getTotalLeagues();
            int total_teams = TeamDAO.getTotalTeams();
            int total_coaches = CoachDAO.getTotalCoaches();
            int total_players = PlayerDAO.getTotalPlayers();
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA Admin Portal:: Dashboard</title>
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
        <script type="text/javascript" src="<%= portal %>js/session.js?v=1"></script>
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
                    var username = $("#username").val();
                    checkIMSsession(username);
                }, 601000);
                
                getGreetingByID("greetings");  
                setInterval(function (){
                    getGreetingByID("greetings");
                }, 60000); 

                $("#alert-panel").click(function () {
                    $("#alert-panel").fadeOut(500);
                });
                $("#toggle").click(function (){
                    $("#navigation").slideToggle("slow");
                });
                $(".box").each(function (){
                    $(this).mouseover(function (){
                        $(this).addClass("shadow");
                    });
                    $(this).mouseout(function (){
                        $(this).removeClass("shadow");
                    });
                });
            });
            /*
             * For custom alerts notifications, use any of the functions below:
             * displayNotice(topic, msg);
             * displayDynaNotice(topic, msg, topicid, msgid, panelid);
             */


        </script>
        <style>
            
        </style>
    </head>
    <body>
        <div class="overlay display-none" id="alert-panel">
            <div class=" centralize middle width-30 p-4 bg-light rounded">
                <div class="text-bold" id="alert-title">Message </div>
                <hr class="d-grid mb-2">
                <div class="p-2" id="alert-notice"></div>
            </div>
        </div>
        <!--============================ end of notification section ==================================-->
        <section id="banner" class="border-bottom bg-white p-2 text-color-1 text-18px">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                        <!--<span class="text-uppercase">business id: </span>-->
                        <span></span>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                        <span class="">Welcome to Administrator Portal</span>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="offset-lg-5 col-lg-7 col-md-7 col-sm-12">
                                    <div class="d-flex align-items-center justify-content-end inline-block height-100">
                                        <div class="inline-block me-2">
                                            <span class="hidden-sm">Last Login: </span>
                                            <span><%= lastlogin %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <section id="content" class="mb-5">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-12 p-0">
                        <div class="width-100 text-right display-none" id="toggle">
                            <button type="button" class="btn btn-light">
                                <span class="">Menu </span>
                                <span class="fa fa-bars"> </span>
                            </button>
                        </div>
                        <div class="bg-light" id="navigation">
                            <%
                                if(profile.equals("super administrator")){
                            %>
                            <jsp:include page="../admin_nafa/navigation.jsp" >
                                <jsp:param name="profile" value="<%= profile %>" />
                                <jsp:param name="i" value="<%= username %>" />
                            </jsp:include> 
                            <%    
                                }else{
                            %>
                            <jsp:include page="../admin_nafa/navigation_admin.jsp" >
                                <jsp:param name="profile" value="<%= profile %>" />
                                <jsp:param name="i" value="<%= username %>" />
                            </jsp:include> 
                            <%   
                                }
                            %>    
                        </div>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-12 pt-3">
                        <div class="row mb-5">
                            <div class="col-lg-3 col-md-3 col-sm-12">
                                <span id="greetings"></span>
                                <span id=""><%= name %></span>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            <div class="col-lg-3 col-md-3 col-sm-12"></div>
                            <div class="col-lg-3 col-md-3 col-sm-12 text-right">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-12 mb-2">
                                        <div class="width-100 height-150px block border box rounded text-center p-4 mb-2 position-relative">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-12 col-sm-12">
                                                    <span class="fa fa-football fa-3x"></span>
                                                </div>
                                                <div class="col-lg-9 col-md-12 col-sm-12 text-center">
                                                    <div class="text-bold block text-center">Total Leagues</div>
                                                    <div class="text-bold block pt-2 mb-3">
                                                        <div class="text-bold block text-20px text-center">
                                                            <span><%= total_leagues %></span>
                                                        </div>
                                                    </div>
                                                    <div class="block">
                                                        <a href="#" class="btn btn-sm btn-success" >
                                                            Create League
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-bold text-center block">
                                            Leagues
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 mb-2">
                                        <div class="width-100 height-150px block border box rounded text-center p-4 mb-2 position-relative">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-12 col-sm-12">
                                                    <span class="fa fa-building-user fa-3x"></span>
                                                </div>
                                                <div class="col-lg-9 col-md-12 col-sm-12 text-center">
                                                    <div class="text-bold block">Teams</div>
                                                    <div class="text-bold block pt-2 mb-3">
                                                        <div class="text-bold block text-20px text-center">
                                                            <span><%= total_teams %></span>
                                                        </div>
                                                    </div>
                                                    <div class="block ">
                                                        <a href="<%= domain %>teams.jsp?i=<%= username %>" class="btn btn-sm btn-success">
                                                            Register Team
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-bold text-center block">
                                            Teams
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 mb-2">
                                        <div class="width-100 height-150px block border box rounded text-center p-4 mb-2 position-relative">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-12 col-sm-12">
                                                    <span class="fa fa-user-tie fa-3x"></span>
                                                </div>
                                                <div class="col-lg-9 col-md-12 col-sm-12 text-center">
                                                    <div class="text-bold block" data-bs-toggle="tooltip" title="Available Stocks" data-bs-placement="top">Coaches</div>
                                                    <div class="text-bold block pt-2 mb-3">
                                                        <div class="text-bold block text-20px text-center">
                                                            <span><%= total_coaches %></span>
                                                        </div>
                                                    </div>
                                                    <div class="block">
                                                        <a href="<%= domain %>coaches_new.jsp?i=<%= username %>" class="btn btn-sm btn-success">
                                                             Register Coach
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-bold text-center block">
                                            Coaches
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-12 mb-2">
                                        <div class="width-100 height-150px block border box rounded text-center p-4 mb-2 position-relative">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-12 col-sm-12">
                                                    <span class="fa fa-people-group fa-3x"></span>
                                                </div>
                                                <div class="col-lg-9 col-md-12 col-sm-12 text-center">
                                                    <div class="text-bold block">Players</div>
                                                    <div class="text-bold block pt-2 mb-3">
                                                        <span><%= total_players %></span>
                                                    </div>
                                                    <div class="block">
                                                        <a href="<%= domain %>players_new.jsp?i=<%= username %>" class="btn btn-sm btn-success">
                                                            Register Player 
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-bold text-center block">
                                            Players
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <!--Stock Transaction list for 10 records-->
                                
                                
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <!--In-app messages-->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../admin_nafa/footer.jsp" ></jsp:include>

        <input type="hidden" name="username" value="<%= username %>" id="username" />
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
