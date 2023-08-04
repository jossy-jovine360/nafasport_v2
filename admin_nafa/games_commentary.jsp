<%-- 
    Document   : games_commentary
    Created on : 17 Feb 2023, 8:01:41 PM
    Author     : josiah
--%>


<%@page import="daos.ReportDynaDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="appData.AppData"%>
<%@page import="daos.GameDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
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
        <title>Welcome to NAFA Administrator Portal:: Videos</title>
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
                                <div class="col-5">

                                </div>
                                <div class="col-7">
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
                                <h3>Post Commentary</h3>
                            </div>
                        </div>
                        
                        <%
                            String function = "new";
                            String label = "Add Game Commentary";
                            String commentid = "";
                            String gameid = "";
                            String playoffid = "";
                            String comment = "";
                            String time = "";
                            String flag = request.getParameter("flag");
                            if(flag == null){}else if(flag.equals("yes")){
                                gameid = request.getParameter("gameid");
                                if(gameid == null){
                                    gameid = "";
                                }
                                playoffid = request.getParameter("playoffid");
                                if(playoffid == null){
                                    playoffid = "";
                                }
                            }else{
                                gameid = request.getParameter("gameid");
                                if(gameid == null){
                                    gameid = "";
                                }
                                playoffid = request.getParameter("playoffid");
                                if(playoffid == null){
                                    playoffid = "";
                                }
                                commentid = request.getParameter("commentid");
                                if(commentid == null){
                                    commentid = "";
                                }else{
                                    function = "edit";
                                    label = "Save changes to Commentary";
                                }
                                
                                comment = request.getParameter("comment");
                                if(comment == null){
                                    comment = "";
                                }
                                time = request.getParameter("time");
                                if(time == null){
                                    time = "";
                                }
                            }
                        %>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>post_commentaries" method="post">
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Select Game Fixture:</label>
                                            <select class="form-control" name="gameid" id="gameid" required>
                                                <%
                                                    LinkedHashMap link = GameDAO.loadAllPendingGames();
                                                    if(link == null || link.isEmpty()){
                                                            out.println("<option value='none'>No Game</option>");
                                                    }else{
                                                        out.println("<option value=''>Select Game</option>");
                                                        out.println("<option value='none'>No Game</option>");
                                                        Set keys = link.keySet();
                                                        Iterator itr = keys.iterator();
                                                        for(int i = 0; i < keys.size(); i++){
                                                            String id = itr.next().toString();
                                                            String names = link.get(id).toString();
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
                                    </div>     
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Select Game Fixture:</label>
                                            <select class="form-control" name="playoffid" id="playoffid" required>
                                                <%
                                                    LinkedHashMap link2 = GameDAO.loadAllPendingGamesPlayOffs();
                                                    if(link2 == null || link2.isEmpty()){
                                                            out.println("<option value='none'>No Play-off Game</option>");
                                                    }else{
                                                        out.println("<option value=''>Select Play-Off Game</option>");
                                                        out.println("<option value='none'>No Play-off Game</option>");
                                                        Set keys = link2.keySet();
                                                        Iterator itr = keys.iterator();
                                                        for(int i = 0; i < keys.size(); i++){
                                                            String id = itr.next().toString();
                                                            String names = link2.get(id).toString();
                                                            out.println("<option value = '"+ id +"'");  
                                                            if(playoffid.equals(id)){
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
                                        <div class="col-12">
                                            <label>Comment:</label>
                                            <textarea id="comment" name="comment" rows="5" class="form-control" placeholder="add game comment here"><%= comment %></textarea>
                                        </div>
                                    </div>    
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Match Time:</label>
                                            <input type="time" class="form-control" name="time" id="time" value="<%= time %>" required /> 
                                        </div>
                                    </div>    
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <input type="hidden" class="form-control" name="function" id="function" value="<%= function %>" required /> 
                                            <input type="hidden" class="form-control" name="commentid" id="commentid" value="<%= commentid %>" required /> 
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
                            <div class="col-lg-6 col-md-6 col-sm-12">
                            <%
                                String query = "";
                                String game = "";
                                if(!(gameid == null || gameid.equals("") || gameid.equals("none"))){
                                    query = "select * from "+AppData.GAMES_COMMENTARY+" where iGameID = '"+gameid+"'";
                                    game = GameDAO.getGameOnlyWithDate(gameid);
                                }else if(!(playoffid == null || playoffid.equals("") || playoffid.equals("none"))){
                                    query = "select * from "+AppData.GAMES_COMMENTARY+" where iPlayOffID = '"+playoffid+"'";
                                    game = GameDAO.getPlayOffGame(playoffid);
                                }
                                if(!query.equals("")){
                                    
                                    DataAccessObject da = ReportDynaDAO.loadRecord(query);
                                    if(da.next()){
                                        da.previous();
                            %>
                            <h5><%= game %></h5>
                            <%
                                        while(da.next()){
                                            String id = da.getString(1);
                                            String gamesid = da.getString(2);
                                            String playoffsid = da.getString(3);
                                            String comments = da.getString(4);
                                            String times = da.getString(5);
                            %>
                            <div class="row mb-2 bg-light p-2">
                                <div class="col-2"><%= times %></div>
                                <div class="col-9"><%= comments %></div>
                                <div class="col-1">
                                    <form action="<%= portal %>games_commentary.jsp?i=<%= username %>" method="post">
                                        <button type="submit" class="btn btn-light btn-sm" data-bs-title="edit Comment" data-bs-toggle="tooltip" data-bs-placement="top">
                                            <span class="fa fa-edit"></span>
                                        </button>
                                        <input type="hidden" name="commentid" id="commentid" value="<%= id %>" />
                                        <input type="hidden" name="gameid" id="gameid" value="<%= gamesid %>" />
                                        <input type="hidden" name="playoffid" id="playoffid" value="<%= playoffsid %>" />
                                        <input type="hidden" name="comment" id="comment" value="<%= comments %>" />
                                        <input type="hidden" name="time" id="time" value="<%= times %>" />
                                        <input type="hidden" name="flag" id="flag" value="flag" />
                                    </form>
                                </div>
                            </div>
                            <%
                                        }
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
