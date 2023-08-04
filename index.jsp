<%-- 
    Document   : index
    Created on : 1 Mar 2023, 12:35:02 PM
    Author     : josiah
--%>


<%@page import="daos.DateDAO"%>
<%@page import="com.jovine.date.DateTime"%>
<%@page import="com.jovine.ellipsis.Ellipsis"%>
<%@page import="daos.CounterDAO"%>
<%@page import="daos.NewsDAO"%>
<%@page import="daos.TeamDAO"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="appData.AppData"%>
<%@page import="daos.LeagueDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="daos.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA | Official Site of the National American Football Association</title>
        <meta charset="UTF-8">
        <meta name="description" content="NAFA is an American Football Association of Nigeria, a nongovernmental organization which operates as NAFA in Nigeria.">
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
        <link rel="stylesheet" type="text/css" href="css/style.css?v=2">
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
                $(".box").each(function () {
                    $(this).mouseover(function () {
                        $(this).addClass("shadow");
                    });
                    $(this).mouseout(function () {
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
        <section id="menu-bar" class="sticky-lg-top">
            <jsp:include page="header.jsp"></jsp:include>
        </section>
        <section id="banner" class="section-banner">
            <div class="container">
                <div id="carouselExampleIndicators" class="carousel slide rounded" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <a href="#"><img src="images/nfl_nigeria_meeting.jpeg" class="d-block slider-image" alt="..."></a>
                        </div>
                        <div class="carousel-item">
                            <a href="#"><img src="images/camp_banner.jpeg" class="d-block slider-image" alt="..."></a>
                        </div>
                        <div class="carousel-item">
                            <img src="images/kings_college.jpeg" class="d-block slider-image" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/banner1.jpeg" class="d-block slider-image" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/banner2.jpeg" class="d-block slider-image" alt="...">
                        </div>
                        
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            
        </section>
        <section class="w-100 height-auto p-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-12">
                        <div class=" d-flex align-items-center justify-content-center w-60 height-200px centralize">
                            <div class="width-80">
                                <h2 class="text-primary">Tryout Camp Now Open</h2>
                                <h3 class="">Join the Nigerian National Team Flag Football Tryout Camp for both Men and Women</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-12">
                        <div class="d-flex align-items-center height-200px">
                            <div class="d-grid">
                                <a href="camp_registration.jsp" class="btn btn-success btn-lg">Register Now to Join Camp</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="content-panel" class="position-relative p-5">
            <div class="container">
                <div class="row p-4 mb-5" id="latest-new">
                    <div class="col-lg-8 col-md-12 col-sm-12" id="contents-latest">
                        <h4 class="p-3 mb-3">Latest News</h4>
                        <%
                            int total = 0;
                            String query = "select * from "+AppData.NEWS+" where vCategory = 'Latest' limit 0,4";
                            String query_total = "";
                            total = NewsDAO.getTotalNewsSummary("Latest", 4);
                            
                            DataAccessObject rep = null;
                            rep = ReportDynaDAO.loadRecord(query);
                            if(rep.next()){
                                rep.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(rep.next()){
                                    String id = rep.getString(1);
                                    String cate = rep.getString(2);
                                    String title = rep.getString(3);
                                    String msgone = rep.getString(4);
                                    String msgtwo = rep.getString(5);
                                    String msgthree = rep.getString(6);
                                    String images = rep.getString(7);
                                    String datetime = rep.getString(8);
                                    
                                    String img = NewsDAO.getNewsFirstImages(images);
                                    String path = domain+"images/news/"+img;
                                    String date = DateDAO.getDateFromDateTime(datetime);

                                    if(j == 1){
                        %>
                        <div class="row mb-2">  
                        <%            
                                    }
                            %>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="<%= AppData.CONTROLLER %>newsItem&newsid=<%= id %>" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-200px" id="">
                                            <img src="<%= path %>" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-2 mb-3"><%= Ellipsis.content(title, 65) %></div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0"><%= date %></div>
                                    </div>
                                </a>
                            </div>
                            <%            
                                    j++;
//                                            System.out.println("jb: "+j+"; total: "+total);
                                    if(j >= 5){
                                        j = 1;
                                        i++;
                        %>
                        </div>
                        <%
                                    }else if(j == (total+1)){
                        %>
                        </div>
                        <%
                                    }
                                }
                            }else{
                        %>
                            <div class="row mb-2">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image2.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image2.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image2.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image2.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        <%
                            }
                        %>
                        <div class="mt-3 text-center"><a href="latest_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12" id="games">
                        <h4 class="p-3 mb-3">Fixtures</h4>
                        <%
                            String leagueid = "";
                            DataAccessObject dao_league = LeagueDAO.getTwoLeagueIDs();
                            if(dao_league.next()){
                                dao_league.previous();
                                while(dao_league.next()){
                                    leagueid = dao_league.getString(1);
                                
                                    String querys = "select * from "+ AppData.GAMES +" where cGroupID IN(select cGroupID from "+AppData.GROUPS+" where cLeagueID = '"+leagueid+"') limit 0,5";
                                    DataAccessObject dacs = ReportDynaDAO.loadRecord(querys);
                                    if(dacs.next()){
                                        dacs.previous();
                                        String value = "";
                                        String teamh = "";
                                        String teama = "";
                                        String group = "";
                                        String game = "";
                                        while(dacs.next()){
                                            String id = dacs.getString(1);
                                            String md = dacs.getString(2);
                                            String groupid = dacs.getString(3);
                                            String hometeamid = dacs.getString(4);
                                            String awayteamid = dacs.getString(6);

                                            teamh = TeamDAO.getTeamName(hometeamid);
                                            teama = TeamDAO.getTeamName(awayteamid);
                                            game = "MD"+md+" - "+teamh+" VS "+teama;
                        %>
                        <a href="#" class="text-decoration-none">
                            <div class="block p-2 text-black box rounded text-14px"><%= game %></div>
                        </a>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                        <div class="mt-3 text-center">View All fixtures</div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="featured-new">
                    <div class="col-12" id="contents-featured">
                        <h4 class="p-3 mb-3">Featured News</h4>
                        <%
                            int total_feat = 0;
                            String query_feat = "select * from "+AppData.NEWS+" where vCategory = 'Featured' limit 0,4";
                            String query_tota_feat = "";
                            total_feat = NewsDAO.getTotalNewsSummary("Featured", 4);
                            
                            DataAccessObject reps = null;
                            reps = ReportDynaDAO.loadRecord(query_feat);
                            if(reps.next()){
                                reps.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(reps.next()){
                                    String id = reps.getString(1);
                                    String cate = reps.getString(2);
                                    String title = reps.getString(3);
                                    String msgone = reps.getString(4);
                                    String msgtwo = reps.getString(5);
                                    String msgthree = reps.getString(6);
                                    String images = reps.getString(7);
                                    String datetime = reps.getString(8);
                                    
                                    String img = NewsDAO.getNewsFirstImages(images);
                                    String path = domain+"images/news/"+img;
                                    String date = DateDAO.getDateFromDateTime(datetime);

                                    if(j == 1){
                        %>
                        <div class="row mb-2">  
                        <%            
                                    }
                            %>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="<%= AppData.CONTROLLER %>newsItem&newsid=<%= id %>" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="<%= path %>" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3"><%= Ellipsis.content(title, 80) %></div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0"><%= date %></div>
                                    </div>
                                </a>
                            </div>
                            <%            
                                    j++;
//                                            System.out.println("jb: "+j+"; total: "+total);
                                    if(j >= 5){
                                        j = 1;
                                        i++;
                        %>
                        </div>
                        <%
                                    }else if(j == (total+1)){
                        %>
                        </div>
                        <%
                                    }

                                }
                            }else{
                        %>
                            <div class="row mb-2">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        <%
                            }
                        %>
                        <div class="mt-3 text-center"><a href="feature_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="w-100 height-400px mb-3">
            <div class="position-relative w-100 height-100">
                <div class="overlay position-absolute">
                    <div class="container text-white">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class=" d-flex align-items-end justify-content-center w-60 height-300px centralize">
                                    <div class="width-80">
                                        <h2 class="text-primary">Tryout Camp Now Open</h2>
                                        <h3 class="mb-5">Join the Nigerian National Team Flag Football Tryout Camp for both Men and Women</h3>
                                        <div class="d-grid">
                                            <a href="camp_registration.jsp" class="btn btn-success btn-lg">Register Now to Join Camp</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                            </div>
                        </div>
                    </div>
                </div>
                <img src="images/nafa_banner.jpeg" class="w-100 h-100" alt="alt"/>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="row p-4 mb-5" id="leugue-new">
                    <div class="col-12" id="contents-league">
                        <h4 class="p-3 mb-3">League News</h4>
                        <%
                            int total_feat1 = 0;
                            String query_feat1 = "select * from "+AppData.NEWS+" where vCategory = 'League' limit 0,4";
                            String query_total_feat1 = "";
                            total_feat = NewsDAO.getTotalNewsSummary("League", 4);
                            
                            DataAccessObject reps1 = null;
                            reps1 = ReportDynaDAO.loadRecord(query_feat1);
                            if(reps1.next()){
                                reps1.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(reps1.next()){
                                    String id = reps1.getString(1);
                                    String cate = reps1.getString(2);
                                    String title = reps1.getString(3);
                                    String msgone = reps1.getString(4);
                                    String msgtwo = reps1.getString(5);
                                    String msgthree = reps1.getString(6);
                                    String images = reps1.getString(7);
                                    String datetime = reps1.getString(8);
                                    
                                    String img = NewsDAO.getNewsFirstImages(images);
                                    String path = domain+"images/news/"+img;
                                    String date = DateDAO.getDateFromDateTime(datetime);

                                    if(j == 1){
                        %>
                        <div class="row mb-2">  
                        <%            
                                    }
                            %>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="<%= AppData.CONTROLLER %>newsItem&newsid=<%= id %>" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="<%= path %>" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3"><%= Ellipsis.content(title, 80) %></div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0"><%= date %></div>
                                    </div>
                                </a>
                            </div>
                            <%            
                                    j++;
//                                            System.out.println("jb: "+j+"; total: "+total);
                                    if(j >= 5){
                                        j = 1;
                                        i++;
                        %>
                        </div>
                        <%
                                    }else if(j == (total+1)){
                        %>
                        </div>
                        <%
                                    }

                                }
                            }else{
                        %>
                        <div class="row mb-2">
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image5.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image5.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image5.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image5.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <%        
                            }
                        %>
                        <div class="mt-3 text-center"><a href="league_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="team-new">
                    <div class="col-12" id="contents-team">
                        <h4 class="p-3 mb-3">Team News</h4>
                        <%
                            int total_feat2 = 0;
                            String query_feat2 = "select * from "+AppData.NEWS+" where vCategory = 'Team' limit 0,4";
                            String query_total_feat2 = "";
                            total_feat2 = NewsDAO.getTotalNewsSummary("Team", 4);
                            
                            DataAccessObject reps2 = null;
                            reps2 = ReportDynaDAO.loadRecord(query_feat2);
                            if(reps2.next()){
                                reps2.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(reps2.next()){
                                    String id = reps2.getString(1);
                                    String cate = reps2.getString(2);
                                    String title = reps2.getString(3);
                                    String msgone = reps2.getString(4);
                                    String msgtwo = reps2.getString(5);
                                    String msgthree = reps2.getString(6);
                                    String images = reps2.getString(7);
                                    String datetime = reps2.getString(8);
                                    
                                    String img = NewsDAO.getNewsFirstImages(images);
                                    String path = domain+"images/news/"+img;
                                    String date = DateDAO.getDateFromDateTime(datetime);

                                    if(j == 1){
                        %>
                        <div class="row mb-2">  
                        <%            
                                    }
                            %>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="<%= AppData.CONTROLLER %>newsItem&newsid=<%= id %>" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="<%= path %>" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3"><%= Ellipsis.content(title, 80) %></div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0"><%= date %></div>
                                    </div>
                                </a>
                            </div>
                            <%            
                                    j++;
//                                            System.out.println("jb: "+j+"; total: "+total);
                                    if(j >= 5){
                                        j = 1;
                                        i++;
                        %>
                        </div>
                        <%
                                    }else if(j == (total+1)){
                        %>
                        </div>
                        <%
                                    }

                                }
                            }else{
                        %>
                        <div class="row mb-2">
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <%        
                            }
                        %>
                        <div class="mt-3 text-center"><a href="team_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="p-5 mb-5">
            <h3 class="text-center mb-5">Our Teams</h3>
            <div class="container">
            <%
                int total_team = 0;
                String query_team = "select * from "+AppData.TEAMS+"  limit 0,12";
                total_team = TeamDAO.getTotalLimtedTeams(12);

                DataAccessObject dac = null;
                dac = ReportDynaDAO.loadRecord(query_team);
                if(dac.next()){
                    dac.previous();
                    String domain = AppData.DOMAIN_ADMIN;
                    int j = 1;
                    int i = 0;
                    while(dac.next()){
                        String id = dac.getString(1);
                        String team = dac.getString(2);
                        String code = dac.getString(3);
                        String stateid = dac.getString(4);
                        String category = dac.getString(5);
                        String logo = dac.getString(6);
                        String districtid = dac.getString(7);

                        String path = domain+"images/emblem/"+logo;

                        if(j == 1){
            %>
            <div class="row mb-4">  
            <%            
                        }
                %>
                <div class="col-lg-2 col-md-2 col-sm-12 p-2 ">
                    <a href="teams_profile.jsp?id=<%= id %>" class="text-decoration-none text-black">
                        <div class="box rounded height-100px w-100px block centralize">
                            <div class="block w-100 height-100" id="">
                                <img src="<%= path %>" class="w-100 h-100 border-radius-50" alt="alt"/>
                            </div>
                        </div>
                        <div class="block text-center">
                            <%= team %> (<%= code %>)
                        </div>
                    </a>
                </div>
                <%            
                        j++;
                        i++;
                        if(j >= 7){
                            j = 1;
                            
            %>
            </div>
            <%
                        }else if(j < 7 && i == total_team){
            %>
            </div>
            <%
                        }

                    }
                }else{
            
                }
            %>
            </div>
            <div class="mt-3 text-center"><a href="teams.jsp" class="text-decoration-none text-bold">View All teams</a></div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include> 
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
