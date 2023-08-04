<%-- 
    Document   : admin_profiles
    Created on : 31 Oct 2022, 11:53:48 AM
    Author     : josiah
--%>

<%@page import="daos.ReportDynaDAO"%>
<%@page import="appData.AppData"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
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
        <title>Welcome to NAFA Admin Portal:: Admin Profile</title>
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

        <link rel="stylesheet" type="text/css" href="<%= portal %>css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/margin.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/padding.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/text-size.css?v=1">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/style.css?v=1">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/dimension.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/form.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/tooltip.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/border_radius.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/navigation.css">
        <link rel="stylesheet" type="text/css" href="<%= portal %>css/fontawesome-6.1.1/css/all.min.css"/>
        <script type="text/javascript" src="<%= portal %>js/datetime.js"></script>
        <script type="text/javascript" src="<%= portal %>js/session.js?v=1"></script>
        <script type="text/javascript" src="<%= portal %>js/form_validator.js"></script>
        <script type="text/javascript" src="<%= portal %>js/alerts.js"></script>
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
                    checkIMSsession(username);
                }, 601000);

                $("#alert-panel").click(function () {
                    $("#alert-panel").fadeOut(500);
                });
                $("#toggle").click(function (){
                    $("#navigation").slideToggle("slow");
                });
                $(".box").each(function (){
                    $(this).mouseover(function (){
                        $(this).addClass("shadow");
                    });
                    $(this).mouseout(function (){
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
                        <span class="">Welcome to NAFA Admin Portal</span>
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
                    <div class="col-lg-2 col-md-2 col-sm-12 p-0">
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
                                <h3>Admin Profiles</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <table class="table table-responsive table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Profile</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            DataAccessObject role = null;
                                            String query_role = "select * from "+AppData.ROLES;
                                            role = ReportDynaDAO.loadRecord(query_role);
                                            if(role.next()){
                                                role.previous();
                                                while(role.next()){
                                                    String id = role.getString(1);
                                                    String roles = role.getString(2);
                                                    
                                        %>
                                        <tr>
                                            <td><%= id %></td>
                                            <td><%= roles %></td>
                                            <td>
                                                <%
                                                    if(roles.equals("super administrator")){}else{
                                                %>
                                                <form action="<%= portal %>admin_profiles.jsp" method="post">
                                                    <button type="submit" class="btn btn-light btn-sm">
                                                        <span class="fa fa-edit"></span>
                                                    </button>
                                                    <input type="hidden" name="i" value="<%= username %>" />
                                                    <input type="hidden" name="roleid" value="<%= id %>" />
                                                    <input type="hidden" name="role" value="<%= roles %>" />
                                                </form>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>

                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <%
                                    String roleid = request.getParameter("roleid");
                                    if(roleid == null){
                                        roleid = "";
                                    }
                                    String roles = request.getParameter("role"); 
                                    String label = "<span>add profile</span>";
                                    String function = "add";
                                    if(roles == null){
                                        roles = "";
                                    }else{
                                        label = "<span>edit profile</span>";
                                        function = "edit";
                                    }
                                %>
                                <div class="p-3">
                                    <h6>Add New Profile</h6>
                                    <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>add_new_profile" method="post">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="specify your profile here" value="<%= roles %>" name="textProfile" />
                                                    <button type="submit" class="btn btn-sm btn-outline-secondary">
                                                        <%= label %>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <input type="hidden" class="form-control" value="<%= username %>" name="username" />
                                                <input type="hidden" class="form-control" value="<%= roleid %>" name="roleid" />
                                                <input type="hidden" class="form-control" value="<%= function %>" name="function" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
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
