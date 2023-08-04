<%-- 
    Document   : players_profile
    Created on : 8 Mar 2023, 12:43:59 PM
    Author     : josiah
--%>


<%@page import="daos.StateDAO"%>
<%@page import="com.jovine.ellipsis.Ellipsis"%>
<%@page import="daos.DateDAO"%>
<%@page import="daos.NewsDAO"%>
<%@page import="daos.TeamDAO"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="appData.AppData"%>
<%@page import="daos.LeagueDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="daos.PlayerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String playerid = request.getParameter("id");
            String player = "";
            if(playerid == null){
                response.sendRedirect("request.getContextPath()");
            }else{
                player = PlayerDAO.getPlayerName(playerid);
                if(player.equals("")){
                    response.sendRedirect(request.getContextPath());
                }
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA | <%= player %>'s Profile</title>
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
            <section class="bg-light p-5 height-120px" id="navigation-banner">
                <div class="centralize w-50 text-center text-bold"><a href="./" class="text-decoration-none">Home</a> / <a href="players-list.jsp" class="text-decoration-none">Players</a> / <%= player %>'s Profile</div>
            </section>
            <section class="p-5">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <div class="row mb-5">
                                <div class="col-12"><h3><%= player %>'s Profile</h3></div>
                            </div>
                            <%
                            
                            if(playerid == null){}else{
                                String query = "select * from "+AppData.PLAYERS+" where cPlayerID = '"+playerid+"'";
                                DataAccessObject rep = ReportDynaDAO.loadRecord(query);
                                if(rep.next()){
                                    String id =rep.getString(1);
                                    String teamid =rep.getString(2);
                                    String fullname =rep.getString(3);
//                                    String email =rep.getString(4);
//                                    String phone =rep.getString(5);
//                                    String gender =rep.getString(6);
//                                    String dob =rep.getString(7);
//                                    String address =rep.getString(8);
                                    String stateid =rep.getString(9);
                                    String grade =rep.getString(10);
                                    String position =rep.getString(11);
                                    String height =rep.getString(12);
                                    String weight =rep.getString(13);
//                                    String special =rep.getString(14);
//                                    String remark =rep.getString(15);
//                                    String date =rep.getString(16);
                                    String imagename =rep.getString(17);
                                    
                                    String state = StateDAO.getStateName(stateid);
                                    String team = TeamDAO.getTeamName(teamid);

                                    String domain = AppData.DOMAIN_ADMIN;
                                    String path = domain+"images/"+imagename;
                                    String coach = TeamDAO.getTeamCoach(teamid);
                                    String age = PlayerDAO.getPlayerAge(id);
                        %>
                        <div class="row mb-5">
                            <div class="col-lg-3 col-md-3 col-sm-12">
                                <div class="box rounded height-250px w-300px block centralize">
                                    <div class="block w-100 height-100" id="">
                                        <img src="<%= path %>" class="w-100 h-100 img-thumbnail" alt="alt"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-9 col-sm-12 ps-5">
                                <div class="block p-2">Name: <%= fullname.toUpperCase() %></div>
                                <div class="block p-2">Team: <%= team.toUpperCase() %></div>
                                <div class="block p-2">Position <%= position.toUpperCase() %></div>
                                <div class="block p-2">Coach: <%= coach.toUpperCase() %></div>
                                <div class="block p-2">Age: <%= age %></div>
                                <div class="block p-2">Height: <%= height %>"</div>
                                <div class="block p-2">Weight: <%= weight %> kg</div>
                            </div>
                        </div>
                        
                        <%
                                }else{

                                }
                            }
                        %>
                        </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="row mb-5 p-2">
                                    <div class="col-12">
                                        <h4 class="p-2 mb-3">Fixtures</h4>
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
                                                            String gameid = dacs.getString(1);
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
                                        <h4 class=" mb-3">Featured News</h4>
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
                                                    String newsid = reps.getString(1);
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
                                            <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
                                                <a href="<%= AppData.CONTROLLER %>newsItem&newsid=<%= newsid %>" class="text-decoration-none text-black">
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
                                                    if(j >= 3){
                                                        j = 1;
                                                        i++;
                                        %>
                                        </div>
                                        <%
                                                    }else if(j == (total_feat+1)){
                                        %>
                                        </div>
                                        <%
                                    }

                                                }
                                            }else{
                                        %>
                                            <div class="row mb-2">
                                                <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                                                <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                                                <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                                                <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                    </div>
                </div>
            </section>
        <jsp:include page="footer.jsp" ></jsp:include>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
