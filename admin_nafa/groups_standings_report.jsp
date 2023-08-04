<%-- 
    Document   : groups_teams
    Created on : 19 Jan 2023, 11:07:26 PM
    Author     : josiah
--%>


<%@page import="daos.GroupTeamDAO"%>
<%@page import="daos.GroupDAO"%>
<%@page import="daos.TeamDAO"%>
<%@page import="daos.LeagueDAO"%>
<%@page import="daos.DistrictDAO"%>
<%@page import="daos.StateDAO"%>
<%@page import="daos.TournamentDAO"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="appData.AppData"%>
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
            
            
            String msg = (String)request.getAttribute("msg");
            String disp = "hidden";
            if(msg == null){
                msg = "";
            }else{
                disp = "show";
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA Admin Portal:: Assign Teams to Groups</title>
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

                setInterval(function () {
                    var username = $("#username").val();
                    checksession(username);
                }, 601000);

                $("#alert-panel").click(function () {
                    $("#alert-panel").fadeOut(500);
                });
                $("#toggle").click(function () {
                    $("#navigation").slideToggle("slow");
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
        <section id="banner" class="border-bottom bg-white p-2 text-color-1 text-18px">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                        <!--<span class="text-uppercase">business id: </span>-->
                        <span></span>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                        <span class="">Welcome to NAFA Administrator Portal</span>
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
                    <div class="col-lg-2 col-md-2 col-sm-12 p-0 hidden-print">
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
                        <!--                        To Do script                  -->
                        <div class="row mb-2">
                            <div class="col-12">
                                <div class="alert alert-warning alert-dismissible fade <%= disp %>" role="alert" id="msg-alert">
                                    <strong id="msgs"><%= msg %></strong>
                                    <button type="button" class="btn btn-close pull-right close" data-bs-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-5">
                            <div class="col-12">
                                <h3>Group Standings</h3>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <div class="col-lg-7 col-md-7 col-sm-12">
                                <div class="">
                                    <a href="<%= portal %>games_stats_new.jsp?i=<%= username %>" class="text-decoration-none btn bg-light">
                                        <span class="fa fa-plus"></span>
                                        <span>Add Team Stats to Group Standings</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-7 col-md-7 col-sm-12">
                                <%
                                    String query_leagues = "select * from "+AppData.LEAGUES+" order by dStartDate desc";
                                    DataAccessObject dac = ReportDynaDAO.loadRecord(query_leagues);
                                    if(dac.next()){
                                        dac.previous();
                                        String tourn = "";
                                        String header = "";
                                        while(dac.next()){
                                            String id = dac.getString(1);
                                            String tournid = dac.getString(2);
                                            String league = dac.getString(3);
                                            String cate = dac.getString(8);
                                            tourn = TournamentDAO.getTournamentName(tournid);
                                            header = league +" - "+ tourn+" Tournament";
                                %>
                                <h3 class="bg-success text-white rounded p-2"><%= header %></h3>
                                <div class="mb-3 text-14px">
                                <%
//                                    Now we get the states ...
                                            String query_group_state = "select * from "+AppData.GROUPS+" where cLeagueID = '"+id+"' group by(cStateID) ";
                                            DataAccessObject dao = ReportDynaDAO.loadRecord(query_group_state);
                                            if(dao.next()){
                                                dao.previous();
                                                String state = "";
                                                while(dao.next()){
                                                    String stateid = dao.getString(3);
                                                    state = StateDAO.getStateName(stateid);
                                %>
                                <h4 class="text-center bg-light p-2 mt-2"><%= state %> State</h4>
                                <%
//                                    Now we get the districts available in those states ...
                                                    String query_district  = "select * from "+AppData.GROUPS+" where cLeagueID = '"+id+"' and cStateID = '"+stateid+"'";
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
                               
                                <h5 class="text-center bg-light rounded-2 p-2"> <%= groupname %></h5>
                                <%   
                                                            }else{
                                %>
                                <h5 class="text-center bg-light rounded-2 p-2"><%= district %> - <%= groupname %></h5>
                                <%
                                                            }
//                                    Now we get the team's category from each district
                                %>
                                <h6 class=" p-2 bg-light"><%= cate %>'s Groupings</h6>
                                <%                           
//                                                            String query_teams = "select * from "+ AppData.GROUP_TEAMS+" where cGroupID = '"+groupid+"'";
                                                            String query_teams = "select * from "+ AppData.GROUP_STANDINGS+" where "
                                                                    + "iGroupTeamID IN(select iGroupTeamID from "+AppData.GROUP_TEAMS+" where cGroupID = '"+groupid+"') "
                                                                    + "order by iPT,iGDF  desc";
                                                            DataAccessObject dac_teams = ReportDynaDAO.loadRecord(query_teams);
                                                            if(dac_teams.next()){
                                                                dac_teams.previous();
                                                                String team = "";
                                                                
                                %>
                                <!--<div class="box p-2 mb-3">-->
                                    <table class="table table-striped">
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
                                        </tr>
                                <%
                                                                String gp = "0";
                                                                String gw = "0";
                                                                String gd = "0";
                                                                String gl = "0";
                                                                String gf = "0";
                                                                String ga = "0";
                                                                String gdf = "0";
                                                                String pt = "0";
                                                                while(dac_teams.next()){
                                                                    String standid = dac_teams.getString(1);
                                                                    String leagid = dac_teams.getString(2);
                                                                    String groupteamid = dac_teams.getString(3);
                                                                    gp = dac_teams.getString(4);
                                                                    gw = dac_teams.getString(5);
                                                                    gd = dac_teams.getString(6);
                                                                    gl = dac_teams.getString(7);
                                                                    gf = dac_teams.getString(8);
                                                                    ga = dac_teams.getString(9);
                                                                    gdf = dac_teams.getString(10);
                                                                    pt = dac_teams.getString(11);
                                                                    team = GroupTeamDAO.getTeam(groupteamid);
                                                                    
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
                                <%
                                        }
                                    }
                                %>
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
