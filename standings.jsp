<%-- 
    Document   : standings
    Created on : 18 Mar 2023, 6:22:42 AM
    Author     : josiah
--%>


<%@page import="daos.GroupStandingDAO"%>
<%@page import="daos.GroupTeamDAO"%>
<%@page import="daos.GroupDAO"%>
<%@page import="daos.DistrictDAO"%>
<%@page import="daos.StateDAO"%>
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
                        <h4 class=" mb-3">Standings</h4>
                        <div class="row mb-5">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="block">
                                    <form action="standings.jsp" method="post">
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
                                String query_group = "";
                                String leagueid = request.getParameter("leagueid");
                                if(leagueid == null){
                                    query_group = "select * from "+AppData.GROUPS+" where cLeagueID = (select cLeagueID from "+AppData.LEAGUES+"  order by vLeagueName asc limit 0,1) order by cGroup asc";
                                }else{
                                    query_group = "select * from "+AppData.GROUPS+" where cLeagueID = '"+leagueid+"' order by cGroup asc";
                                }
                                DataAccessObject dao = ReportDynaDAO.loadRecord(query_group);
                                if(dao.next()){
                                    dao.previous();
                                    String state = "";
                                    String cate = "";
                                    while(dao.next()){
                                        String leagueids = dao.getString(2);
                                        String stateid = dao.getString(3);
                                        state = StateDAO.getStateName(stateid);
                                        cate = LeagueDAO.getLeagueCategory(leagueids);
                            %>
                                <h4 class="bg-light p-2 mt-2"><%= state %> State</h4>
                            <%
                                        String query_district  = "select * from "+AppData.GROUPS+" where cLeagueID = '"+leagueids+"' and cStateID = '"+stateid+"'";
                                        DataAccessObject dao_dist = ReportDynaDAO.loadRecord(query_district);
                                        if(dao_dist.next()){
                                            dao_dist.previous();
                                            String district = "";
                                            String groupname = "";
                                            while(dao_dist.next()){
                                                String groupid = dao_dist.getString(1);
                                                String districtid = dao_dist.getString(4);
                                                district = DistrictDAO.getDistrictName(districtid);
                                                groupname = GroupDAO.getTeamGroupOnly(groupid);
                            %>
                                 <div class="mb-3 box p-3">
                                <%
                                                            if(district.equals("None")){
                                %>
                               
                                <h5 class=" bg-light rounded-2 p-2"> <%= groupname %></h5>
                                <%   
                                                            }else{
                                %>
                                <h5 class=" bg-light rounded-2 p-2"><%= district %> - <%= groupname %></h5>
                                <%
                                                            }
//                                    Now we get the team's category from each district
                                %>
                                <h6 class=" p-2 bg-light"><%= cate %>'s Groupings</h6>
                                <%                           
                                                            String query_teams = "select * from "+ AppData.GROUP_TEAMS+" where cGroupID = '"+groupid+"'";
                                                            DataAccessObject dac_teams = ReportDynaDAO.loadRecord(query_teams);
                                                            if(dac_teams.next()){
                                                                dac_teams.previous();
                                                                String team = "";
                                                                
                                %>
                                <!--<div class="box p-2 mb-3">-->
                                    <table class="table table-striped text-14px">
                                        <tr>
                                            <th>Team</th>
                                            <th>GP</th>
                                            <th>GW</th>
                                            <th>GD</th>
                                            <th>GL</th>
                                            <th>GF</th>
                                            <th>GA</th>
                                            <th>GDF</th>
                                            <th>PTS</th>
                                            <th></th>
                                        </tr>
                                <%
                                                                String gtid = "0";
                                                                String gp = "0";
                                                                String gw = "0";
                                                                String gd = "0";
                                                                String gl = "0";
                                                                String gf = "0";
                                                                String ga = "0";
                                                                String gdf = "0";
                                                                String pt = "0";
                                                                while(dac_teams.next()){
                                                                    gtid = dac_teams.getString(1);
                                                                    String groupids = dac_teams.getString(2);
                                                                    String teamid = dac_teams.getString(3);
                                                                    gp = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iGP");
                                                                    gw = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iGW");
                                                                    gd = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iGD");
                                                                    gl = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iGL");
                                                                    gf = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iGF");
                                                                    ga = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iGA");
                                                                    gdf = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iGDF");
                                                                    pt = GroupStandingDAO.getGroupStandingDataByGroupTeamID(gtid, "iPT");
                                                                    team = TeamDAO.getTeamName(teamid);
                                                                    
                                %>
                                    <tr>
                                        <td><%= team.toUpperCase() %></td>
                                        <td><%= gp %></td>
                                        <td><%= gw %></td>
                                        <td><%= gd %></td>
                                        <td><%= gl %></td>
                                        <td><%= gf %></td>
                                        <td><%= ga %></td>
                                        <td><%= gdf %></td>
                                        <td><%= pt %></td>
                                        <td>
                                            
                                        </td>
                                    </tr>
                                <%
                                                                }
                                %>
                                    </table>
                                <!--</div>-->
                                <%
                                                            }
                                %>
                                </div>
                                <%
                                            }
                                        }
                                    }
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
