<%-- 
    Document   : players_pool
    Created on : 19 Jan 2023, 10:41:03 PM
    Author     : josiah
--%>


<%@page import="daos.StateDAO"%>
<%@page import="daos.TeamDAO"%>
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
        <title>Welcome to NAFA Admin Portal:: Pool Players</title>
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
                                <h3>Manage Pool Players</h3>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <div class="col-12">
                                <div class="">
                                    <a href="<%= portal %>players_pool_new.jsp?i=<%= username %>" class="text-decoration-none btn bg-light">
                                        <span class="fa fa-plus"></span>
                                        <span>Register New Pool Player</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Player ID</th>
                                        <th>Team</th>
                                        <th>Full Name</th>
                                        <th>Gender</th>
                                        <th>Date of Birth</th>
                                        <th>State</th>
                                        <th>Grade/Class</th>
                                        <th>Position</th>
                                        <th>Height</th>
                                        <th>Weight</th>
                                        <th>Special</th>
                                        <th>Remark</th>
                                        <th>Date Added</th>
                                        <th>Profile</th>
                                        <th></th>
                                    </tr>
                                    <%
//                                        String stateid = (String)request.getAttribute("stateid");
                                        String query = "select * from "+AppData.PLAYERS+" where iTeamID IS NULL";
                                        
                                        DataAccessObject rep = null;
                                        rep = ReportDynaDAO.loadRecord(query);
                                        if(rep.next()){
                                            rep.previous();
                                            String state = "";
                                            String domain = AppData.DOMAIN_ADMIN;
                                            String team = "";
                                            String path = "";
                                            while(rep.next()){
                                                String id =rep.getString(1);
                                                String teamid =rep.getString(2);
                                                String fullname =rep.getString(3);
                                                String email =rep.getString(4);
                                                String phone =rep.getString(5);
                                                String gender =rep.getString(6);
                                                String dob =rep.getString(7);
                                                String address =rep.getString(8);
                                                String stateid =rep.getString(9);
                                                String grade =rep.getString(10);
                                                String position =rep.getString(11);
                                                String height =rep.getString(12);
                                                String weight =rep.getString(13);
                                                String special =rep.getString(14);
                                                String remark =rep.getString(15);
                                                String date =rep.getString(16);
                                                String imagename =rep.getString(17);
                                                state = StateDAO.getStateName(stateid);
                                                team = TeamDAO.getTeamName(teamid);
                                                path = domain+"images/"+imagename;
                                    %>
                                    <tr>
                                        <td><%= id %></td>
                                        <td><%= team %></td>
                                        <td><%= fullname %></td>
                                        <td><%= gender %></td>
                                        <td><%= dob %></td>
                                        <td><%= state %></td>
                                        <td><%= grade %></td>
                                        <td><%= position %></td>
                                        <td><%= height %></td>
                                        <td><%= weight %></td>
                                        <td><%= special %></td>
                                        <td><%= remark %></td>
                                        <td><%= date %></td>
                                        <td><a href="#" class="text-decoration-none"><img src="<%= path %>" class="img-circle" alt="alt"/></a></td>
                                        <td>
                                            <form action="<%= portal %>players_pool_new.jsp?i=<%= username %>" method="post">
                                                <div class="row">
                                                    <div class="col-12"  title="Edit <%= team %>">
                                                        <button type="submit" class="btn btn-success">
                                                            <span class="fa fa-edit"></span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <input type="hidden" name="playerid" value="<%= id %>" />
                                                        <input type="hidden" name="fullname" value="<%= fullname %>" />
                                                        <input type="hidden" name="email" value="<%= email %>" />
                                                        <input type="hidden" name="phone" value="<%= phone %>" />
                                                        <input type="hidden" name="gender" value="<%= gender %>" />
                                                        <input type="hidden" name="dob" value="<%= dob %>" />
                                                        <input type="hidden" name="address" value="<%= address %>" />
                                                        <input type="hidden" name="stateid" value="<%= stateid %>" />
                                                        <input type="hidden" name="grade" value="<%= grade %>" />
                                                        <input type="hidden" name="position" value="<%= position %>" />
                                                        <input type="hidden" name="height" value="<%= height %>" />
                                                        <input type="hidden" name="weight" value="<%= weight %>" />
                                                        <input type="hidden" name="special" value="<%= special %>" />
                                                        <input type="hidden" name="remark" value="<%= remark %>" />
                                                        <input type="hidden" name="flag" value="edit" />
                                                    </div>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                </table>
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
