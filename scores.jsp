<%-- 
    Document   : scores
    Created on : 18 Mar 2023, 6:14:40 AM
    Author     : josiah
--%>

<%@page import="com.jovine.date.DateTime"%>
<%@page import="daos.TeamDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="daos.LeagueDAO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.jovine.ellipsis.Ellipsis"%>
<%@page import="daos.DateDAO"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="daos.NewsDAO"%>
<%@page import="appData.AppData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA | Official Site of the National American Football Association</title>
        <meta charset="UTF-8">
        <meta name="description" content="NAFA">
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
            <div class="centralize w-50 text-center text-bold"><a href="/" class="text-decoration-none">Home</a> / Teams</div>
        </section>
        <section class="p-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <h4 class=" mb-3">Schedule</h4>
                        <div class="row mb-5">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="block">
                                    <form action="scores.jsp" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="input-group">
                                                    <select class="form-control" name="leagueid" id="leagueid" required>
                                                        <%
                                                            LinkedHashMap link = LeagueDAO.loadAllLeagues();
                                                            if(link == null || link.isEmpty()){
                                                                    out.println("<option value=''>You have no registered league</option>");
                                                            }else{
                                                                out.println("<option value=''>Select League</option>");
                                                                Set keys = link.keySet();
                                                                Iterator itr = keys.iterator();
                                                                for(int i = 0; i < keys.size(); i++){
                                                                    String id = itr.next().toString();
                                                                    String names = link.get(id).toString();
                                                                    out.println("<option value = '"+ id +"'>"+ names +"</option>");  
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                    <button type="submit" class="btn btn-success input-group-text">
                                                        <span class="fa fa-search"></span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                            <%
                                String query = "";
                                String leagueid = request.getParameter("leagueid");
                                if(leagueid == null){
                                    query = "select * from "+AppData.GAMES+" where cGroupID IN(select cGroupID from "+AppData.GROUPS+" where cLeagueID = (select cLeagueID from "+AppData.LEAGUES+"  order by vLeagueName asc limit 0,1)) and cStatus = 'closed' order by dDate asc";
                                }else{
                                    query = "select * from "+AppData.GAMES+" where cGroupID IN(select cGroupID from "+AppData.GROUPS+" where cLeagueID = '"+leagueid+"') order by dDate asc";
                                }
                                
                                DataAccessObject dac_teams = ReportDynaDAO.loadRecord(query);
                                if(dac_teams.next()){
                                    dac_teams.previous();
                                    String team_home = "";
                                    String team_away = "";
                                    String leagueName = LeagueDAO.getLeagueName(leagueid);
                            %>
                            <table class="table table-striped text-13px">
                                <tr>
                                    <th colspan="10"><%= leagueName %></th>
                                </tr>
                                <tr>
                                    <th>#</th>
                                    <th>Match Day</th>
                                    <th>Home Team</th>
                                    <th></th>
                                    <th></th>
                                    <th>Away Team</th>
                                    <th></th>
                                    <th>Date</th>
                                    <th class="w-80px">Time</th>
                                    <th></th>
                                </tr>
                            <%
                                int count = 1;
                                String suf = "AM";
                                String mins = "";
                                while(dac_teams.next()){
                                    String gameid = dac_teams.getString(1);
                                    String matchday = dac_teams.getString(2);
                                    String groupsid = dac_teams.getString(3);
                                    String teamhomeid = dac_teams.getString(4);
                                    String homescore = dac_teams.getString(5);
                                    String teamawayid = dac_teams.getString(6);
                                    String awayscore = dac_teams.getString(7);
                                    String date = dac_teams.getString(8);
                                    String time = dac_teams.getString(9);
                                    String status = dac_teams.getString(10);
                                    team_home = TeamDAO.getTeamName(teamhomeid);
                                    team_away = TeamDAO.getTeamName(teamawayid);
                                    
                                    int hr = DateTime.getHourOnly(time);
                                    int min = DateTime.getMinutesOnly(time);
                                    if(hr > 11){
                                        suf = "PM";
                                    }
                                    if(hr > 12){
                                        hr = hr-12;
                                    }
                                    if(min < 10){
                                        mins = "0"+String.valueOf(min);
                                    }else{
                                        mins = String.valueOf(min);
                                    }
                                    time = String.valueOf(hr)+":"+mins+" "+suf;
                            %>
                                <tr>
                                    <td class="align-middle"><%= count %></td>
                                    <td class="text-center align-middle">MD<%= matchday %></td>
                                    <td class="align-middle"><%= team_home.toUpperCase() %></td>
                                    <td class="align-middle"><span class="p-2 ps-3 pe-3 border"><%= homescore %></span></td>
                                    <td class="text-center text-bold align-middle">VS</td>
                                    <td class="align-middle"><%= team_away.toUpperCase() %></td>
                                    <td class="align-middle"><span class="p-2 ps-3 pe-3 border"><%= awayscore %></span></td>
                                    <td class="align-middle"><%= date %></td>
                                    <td class="align-middle"><%= time %></td>
                                    <td>
                                       
                                    </td>
                                </tr>
                            <%
                                    count++;
                                }
                            %>
                            </table>
                            <%
                                }
                            %>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
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
        </section>
        <jsp:include page="footer.jsp" ></jsp:include>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
