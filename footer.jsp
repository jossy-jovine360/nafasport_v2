<%-- 
    Document   : footer
    Created on : 2 Mar 2023, 4:59:50 PM
    Author     : josiah
--%>


<%@page import="daos.PlayerDAO"%>
<%@page import="daos.CoachDAO"%>
<%@page import="com.jovine.currency.Formatter"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="daos.TeamDAO"%>
<%@page import="appData.AppData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            int total_teams = TeamDAO.getTotalTeams();
            int total_coaches = CoachDAO.getTotalCoaches();
            int total_players = PlayerDAO.getTotalPlayers();
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

            });
            /*
             * For custom alerts notifications, use any of the functions below:
             * displayNotice(topic, msg);
             * displayDynaNotice(topic, msg, topicid, msgid, panelid);
             */


        </script>
    </head>
    <body>
        <section class="w-100 height-300px position-relative">
            <div class="bg-overlay p-5">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="bg-white width-100 height-auto rounded p-3">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="block w-100px height-100px centralize mb-3" id="">
                                            <img src="images/emblem/team_logo.png" class="w-100 h-100 img-circle" alt="alt"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="d-flex align-items-center height-100px">
                                            <div class="block pe-2 pb-0 width-70 text-right" style="border-right: solid 2px #008080">
                                                <div class="block">Teams</div>
                                                <div class="block text-bold text-34px"><%= total_teams %></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="bg-white width-100 height-auto rounded p-3">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="block w-100px height-100px centralize mb-3" id="">
                                            <img src="images/emblem/team_logo.png" class="w-100 h-100 img-circle" alt="alt"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="d-flex align-items-center height-100px">
                                            <div class="block pe-2 pb-0 width-70 text-right" style="border-right: solid 2px #008080">
                                                <div class="block">Coaches</div>
                                                <div class="block text-bold text-34px"><%= total_coaches %></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">
                            <div class="bg-white width-100 height-auto rounded p-3">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="block w-100px height-100px centralize mb-3" id="">
                                            <img src="images/player_profile.png" class="w-100 h-100 img-circle" alt="alt"/>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="d-flex align-items-center height-100px">
                                            <div class="block pe-2 pb-0 width-70 text-right" style="border-right: solid 2px #008080">
                                                <div class="block">Players</div>
                                                <div class="block text-bold text-34px"><%= total_players %></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <img src="images/bg-stadium.jpeg" class="w-100 h-100" alt="alt"/>
        </section>
        <section class="p-5 mb-5">
            <h3 class="text-center">Our Partners</h3>
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-12">
                        <div class="p-3">
                            <img src="images/partners/global_wealth.jpeg" class="w-200px height-200px border-radius-50" alt="alt"/>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12">
                        <div class="p-3">
                            <img src="images/partners/ifaf.png" class="w-200px height-200px border-radius-50" alt="alt"/>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12">
                        <div class="p-3">
                            <img src="images/partners/lagos_state_sport.jpg" class="w-200px height-200px border-radius-50" alt="alt"/>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12">
                        <div class="p-3">
                            <img src="images/partners/nssf.jpg" class="w-200px height-200px border-radius-50" alt="alt"/>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-12">
                        <div class="p-3">
                            <img src="images/partners/pulse_experts.jpeg" class="w-300px height-200px border-radius-50" alt="alt"/>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section id="footer" style="" class="pt-5 ps-5 pe-5 bg-darkorange">
            <div class="container text-white">
                <div class="row mb-3">
                    <div class="col-lg-3 col-md-3 col-sm-12">
                        <img src="images/nafa_logo.png" class="img-footer-logo" alt="alt"/>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-12 p-3">
                        <h3>About</h3>
                        <div class="block">
                            The American Football Association of Nigeria is a nongovernmental organization which operates as NAFA in Nigeria. 
                            It is created to promote and enhance growth across the 36 states of the federation [including the FCT] through 
                            contact and noncontact American Football.
                        </div>
                        <div class="block"></div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-12 p-3">
                        <h3>News</h3>
                        <div class="block pb-1"><a href="latest_news.jsp" class="text-decoration-none text-white">Latest</a></div>
                        <div class="block pb-1"><a href="feature_news.jsp" class="text-decoration-none text-white">Featured</a></div>
                        <div class="block pb-1"><a href="league_news.jsp" class="text-decoration-none text-white">League</a></div>
                        <div class="block pb-1"><a href="match_news.jsp" class="text-decoration-none text-white">Match</a></div>
                        <div class="block pb-1"><a href="team_news.jsp" class="text-decoration-none text-white">Teams</a></div>
                        <div class="block pb-1"><a href="players_news.jsp" class="text-decoration-none text-white">Players</a></div>
                        <div class="block pb-1"><a href="transfer_news.jsp" class="text-decoration-none text-white">Transfers</a></div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-12"></div>
                </div>
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="w-100 p-2 text-center">
                            © 2022 NAFA Enterprises .NAFA shield design are the best. NSSFFL. NAFA footage © NAAFA Productions LLC.
                        </div>
                    </div>
                </div>
                <div class="row text-bold">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="w-100 p-2 text-center">
                            <a href="#" class="text-white">PRIVACY POLICY</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="w-100 p-2 text-center">
                            <a href="#" class="text-white">TERMS OF SERVICES</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="w-100 p-2 text-center">
                            <a href="#" class="text-white">SUBSCRIPTION TERMS AND CONDITIONS</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
