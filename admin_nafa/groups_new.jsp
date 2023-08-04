<%-- 
    Document   : groups
    Created on : 19 Jan 2023, 11:06:39 PM
    Author     : josiah
--%>


<%@page import="appData.AppData"%>
<%@page import="daos.DistrictDAO"%>
<%@page import="daos.LeagueDAO"%>
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
            String domain_admin = AppData.DOMAIN_ADMIN;
            
            String msg = (String)request.getAttribute("msg");
            String disp = "hidden";
            if(msg == null){
                msg = "";
            }else{
                disp = "show";
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA Admin Portal:: Groups</title>
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

        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/margin.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/padding.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/text-size.css?v=1">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/style.css?v=1">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/dimension.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/form.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/tooltip.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/border_radius.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/navigation.css">
        <link rel="stylesheet" type="text/css" href="<%= domain_admin %>css/fontawesome-6.1.1/css/all.min.css"/>
        <script type="text/javascript" src="<%= domain_admin %>js/datetime.js"></script>
        <script type="text/javascript" src="<%= domain_admin %>js/session.js"></script>
        <script type="text/javascript" src="<%= domain_admin %>js/form_validator.js"></script>
        <script type="text/javascript" src="<%= domain_admin %>js/alerts.js"></script>
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
                                <h3>Manage League Groups</h3>
                            </div>
                        </div>
                        <%
                            String function = request.getParameter("function");
                            String label = "Create League Group";
                            if(function == null){
                                function = "new";
                            }else{
                                label = "Save League Group Changes";
                            }
                            String groupid = request.getParameter("groupid");
                            if(groupid == null){
                                groupid = "";
                            }
                            String leagueid = request.getParameter("leagueid");
                            if(leagueid == null){
                                leagueid = "";
                            }
                            String stateid = request.getParameter("stateid");
                            if(stateid == null){
                                stateid = "";
                            }
                            String districtid = request.getParameter("districtid");
                            if(districtid == null){
                                districtid = "";
                            }
                            String group = request.getParameter("group");
                            if(group == null){
                                group = "";
                            }
                        %>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>and_new_group" method="post">
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label for="leagueid">Select League:</label>
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
                                                            out.println("<option value = '"+ id +"'");  
                                                            if(leagueid.equals(id)){
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
                                            <label>Select State:</label>
                                            <select class="form-control" name="stateid" id="stateid" required>
                                                <%
                                                    LinkedHashMap link1 = StateDAO.loadAllStatesInfo();
                                                    if(link1 == null || link1.isEmpty()){
                                                            out.println("<option value=''>You have no registered state</option>");
                                                    }else{
                                                        out.println("<option value=''>Select State</option>");
                                                        Set keys = link1.keySet();
                                                        Iterator itr = keys.iterator();
                                                        for(int i = 0; i < keys.size(); i++){
                                                            String id = itr.next().toString();
                                                            String names = link1.get(id).toString();
                                                            out.println("<option value = '"+ id +"'");  
                                                            if(stateid.equals(id)){
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
                                            <label>Select District:</label>
                                            <select class="form-control" name="districtid" id="districtid" required>
                                                <%
                                                    LinkedHashMap link2 = DistrictDAO.loadAllDistricts();
                                                    if(link2 == null || link2.isEmpty()){
                                                            out.println("<option value=''>You have no registered district</option>");
                                                    }else{
                                                        out.println("<option value=''>Select District</option>");
                                                        Set keys = link2.keySet();
                                                        Iterator itr = keys.iterator();
                                                        for(int i = 0; i < keys.size(); i++){
                                                            String id = itr.next().toString();
                                                            String names = link2.get(id).toString();
                                                            out.println("<option value = '"+ id +"'");  
                                                            if(districtid.equals(id)){
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
                                            <label for="group">Group:</label>
                                            <input type="text" name="group" class="form-control" id="group" value="<%= group %>" placeholder="e.g Group A [...Z]" />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <input type="hidden" name="groupid" value="<%= groupid %>" class="form-control" id="group" />
                                            <input type="hidden" name="function" value="<%= function %>" class="form-control" id="group" />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-success">
                                                    <span><%= label %></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12"></div>
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
