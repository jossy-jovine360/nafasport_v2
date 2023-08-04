<%-- 
    Document   : games_stats_new
    Created on : 26 Jan 2023, 4:25:52 PM
    Author     : josiah
--%>


<%@page import="daos.PlayerDAO"%>
<%@page import="daos.TeamDAO"%>
<%@page import="daos.GameDAO"%>
<%@page import="appData.AppData"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="daos.StateDAO"%>
<%@page import="java.util.LinkedHashMap"%>
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
        <title>Welcome to NAFA Admin Portal:: Game Scorers</title>
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
        <script type="text/javascript" src="<%= portal %>js/lineups.js"></script>
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

                $("#gameid").change(function() {
                    var gameid = $("#gameid").val();
                    loadGameTeamsOptions(gameid, "teamid");
                });
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
                                <h3>Register Game Score</h3>
                            </div>
                        </div>
                        <%
                            String function = "new";
                            String label = "Add Game Statistics";
                            String flag = request.getParameter("flag");
                            String statsid = "";
                            String firstdown = "";
                            String teamid = "";
                            String gameid = "";
                            String totalyard = "";
                            String passingyard = "";
                            String rushingyard = "";
                            String penalties = "";
                            String penaltiesyard = "";
                            String turnovers = "";
                            String punts = "";
                            String touchdowns = "";
                            String rushingtouchdowns = "";
                            String passingtouchdowns = "";
                            String turnovertouchdown = "";
                            String fieldgoal_succeeded = "";
                            String fieldgoal_attempted = "";
                            String interception_thrown = "";
                            String fumblelost = "";
                            String sacksallowed = "";
                            String safeties = "";
                            String twopoints_conversion = "";
                            if(flag == null){}else{
                                statsid = request.getParameter("statsid");
                                if(statsid == null){
                                    statsid = "";
                                }else{
                                    function = "edit";
                                    label = "Save Changes to Statistics";
                                }
                                teamid = request.getParameter("teamid");
                                if(teamid == null){
                                    teamid = "";
                                }
                                gameid = request.getParameter("gameid");
                                if(gameid == null){
                                    gameid = "";
                                }
                                firstdown = request.getParameter("firstdown");
                                if(firstdown == null){
                                    firstdown = "";
                                }
                                totalyard = request.getParameter("totalyard");
                                if(totalyard == null){
                                    totalyard = "";
                                }
                                passingyard = request.getParameter("passingyard");
                                if(passingyard == null){
                                    passingyard = "";
                                }
                                penalties = request.getParameter("penalties");
                                if(penalties == null){
                                    penalties = "";
                                }
                                penaltiesyard = request.getParameter("penaltiesyard");
                                if(penaltiesyard == null){
                                    penaltiesyard = "";
                                }
                                turnovers = request.getParameter("turnovers");
                                if(turnovers == null){
                                    turnovers = "";
                                }
                                punts = request.getParameter("punts");
                                if(punts == null){
                                    punts = "";
                                }
                                touchdowns = request.getParameter("touchdowns");
                                if(touchdowns == null){
                                    touchdowns = "";
                                }
                                rushingtouchdowns = request.getParameter("rushingtouchdowns");
                                if(rushingtouchdowns == null){
                                    rushingtouchdowns = "";
                                }
                                passingtouchdowns = request.getParameter("passingtouchdowns");
                                if(passingtouchdowns == null){
                                    passingtouchdowns = "";
                                }
                                turnovertouchdown = request.getParameter("turnovertouchdown");
                                if(turnovertouchdown == null){
                                    turnovertouchdown = "";
                                }
                                fieldgoal_succeeded = request.getParameter("fieldgoal_succeeded");
                                if(fieldgoal_succeeded == null){
                                    fieldgoal_succeeded = "";
                                }
                                fieldgoal_attempted = request.getParameter("fieldgoal_attempted");
                                if(fieldgoal_attempted == null){
                                    fieldgoal_attempted = "";
                                }
                                interception_thrown = request.getParameter("interception_thrown");
                                if(interception_thrown == null){
                                    interception_thrown = "";
                                }
                                fumblelost = request.getParameter("fumblelost");
                                if(fumblelost == null){
                                    fumblelost = "";
                                }
                                sacksallowed = request.getParameter("sacksallowed");
                                if(sacksallowed == null){
                                    sacksallowed = "";
                                }
                                safeties = request.getParameter("safeties");
                                if(safeties == null){
                                    safeties = "";
                                }
                                twopoints_conversion = request.getParameter("twopoints_conversion");
                                if(twopoints_conversion == null){
                                    twopoints_conversion = "";
                                }
                            }
                            
                        %>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>add_stats" method="post">
                                    <div class="row mb-3">
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <label>Select Game:</label>
                                            <select class="form-control" name="gameid" id="gameid" required>
                                                <%
                                                    LinkedHashMap link1 = GameDAO.loadAllGames();
                                                    if(link1 == null || link1.isEmpty()){
                                                            out.println("<option value=''>You have no registered game</option>");
                                                    }else{
                                                        out.println("<option value=''>Select Game</option>");
                                                        Set keys = link1.keySet();
                                                        Iterator itr = keys.iterator();
                                                        for(int i = 0; i < keys.size(); i++){
                                                            String id = itr.next().toString();
                                                            String names = link1.get(id).toString();
                                                            out.println("<option value = '"+ id +"'");  
                                                            if(gameid.equals(id)){
                                                                out.print(" selected='true'");
                                                            }
                                                            out.print(">"+ names +"</option>");
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <label>Select Team:</label>
                                            <select class="form-control" name="teamid" id="teamid" required>
                                                <%
                                                    LinkedHashMap link = TeamDAO.loadAllTeams();
                                                    if(link == null || link.isEmpty()){
                                                            out.println("<option value=''>You have no registered team</option>");
                                                    }else{
                                                        out.println("<option value=''>Select Team to Assign</option>");
                                                        Set keys = link.keySet();
                                                        Iterator itr = keys.iterator();
                                                        for(int i = 0; i < keys.size(); i++){
                                                            String id = itr.next().toString();
                                                            String names = link.get(id).toString();
                                                            out.println("<option value = '"+ id +"'");  
                                                            if(teamid.equals(id)){
                                                                out.print(" selected='true'");
                                                            }
                                                            out.print(">"+ names +"</option>");
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>First Downs:</label>
                                            <input type="number" class="form-control" name="firstdown" id="firstdown" value="<%= firstdown %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Total Yard:</label>
                                            <input type="number" class="form-control" name="totalyard" id="totalyard" value="<%= totalyard %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Passing Yard:</label>
                                            <input type="number" class="form-control" name="passingyard" id="passingyard" value="<%= passingyard %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Rushing Yard:</label>
                                            <input type="number" class="form-control" name="rushingyard" id="rushingyard" value="<%= rushingyard %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Penalties:</label>
                                            <input type="number" class="form-control" name="penalties" id="penalties" value="<%= penalties %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Penalties Yard:</label>
                                            <input type="number" class="form-control" name="penaltiesyard" id="penaltiesyard" value="<%= penaltiesyard %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Turnovers:</label>
                                            <input type="number" class="form-control" name="turnovers" id="turnovers" value="<%= turnovers %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Punts:</label>
                                            <input type="number" class="form-control" name="punts" id="punts" value="<%= punts %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Touch Downs:</label>
                                            <input type="number" class="form-control" name="touchdowns" id="touchdowns" value="<%= touchdowns %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Rushing Touchdowns:</label>
                                            <input type="number" class="form-control" name="rushingtouchdowns" id="rushingtouchdowns" value="<%= rushingtouchdowns %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Passing Touchdowns:</label>
                                            <input type="number" class="form-control" name="passingtouchdowns" id="passingtouchdowns" value="<%= passingtouchdowns %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Turnover Touchdowns:</label>
                                            <input type="number" class="form-control" name="turnovertouchdown" id="turnovertouchdown" value="<%= turnovertouchdown %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Field Goal Succeeded:</label>
                                            <input type="number" class="form-control" name="fieldgoal_succeeded" id="fieldgoal_succeeded" value="<%= fieldgoal_succeeded %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Field Goal Attempted:</label>
                                            <input type="number" class="form-control" name="fieldgoal_attempted" id="fieldgoal_attempted" value="<%= fieldgoal_attempted %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Inteception Thrown:</label>
                                            <input type="number" class="form-control" name="interception_thrown" id="interception_thrown" value="<%= interception_thrown %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Fumbles Lost:</label>
                                            <input type="number" class="form-control" name="fumblelost" id="fumblelost" value="<%= fumblelost %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Sacks Allowed:</label>
                                            <input type="number" class="form-control" name="sacksallowed" id="sacksallowed" value="<%= sacksallowed %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Safeties:</label>
                                            <input type="number" class="form-control" name="safeties" id="safeties" value="<%= safeties %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Two Points Conversion:</label>
                                            <input type="number" class="form-control" name="twopoints_conversion" id="twopoints_conversion" value="<%= twopoints_conversion %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <input type="hidden" name="function" id="function" class="form-control" value="<%= function %>" />
                                            <input type="hidden" name="username" id="user" class="form-control" value="<%= username %>" />
                                            <input type="hidden" name="statsid" id="statsid" class="form-control" value="<%= statsid %>" />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-success">
                                                    <span></span>
                                                    <span><%= label %></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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
