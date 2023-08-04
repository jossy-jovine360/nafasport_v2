<%-- 
    Document   : admin_assignrole
    Created on : 2 Nov 2022, 8:19:41 AM
    Author     : josiah
--%>


<%@page import="daos.ReportDynaDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="appData.AppData"%>
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
        <title>Welcome to NAFA Admin Portal:: Admin Role</title>
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
        <script type="text/javascript" src="<%= portal %>js/session.js"></script>
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
                        <div class="row mb-4">
                            <div class="col-12">
                                <h3>Assign Admin roles</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <div class="row mb-2">
                                    <div class="col-lg-4 col-md-4 col-sm-12"></div>
                                    <div class="col-lg-8 col-md-8 col-sm-12">
                                        <div class="">
                                            <form action="<%= portal %>admin_assignrole.jsp" method="post">
                                                <div class="row">
                                                    <div class="col-lg-10 col-md-10 col-sm-12">
                                                        <select class="form-control" name="email" id="admin_email" required>
                                                            <%
                                                                LinkedHashMap link = AdminDAO.loadActiveAdmins();
                                                                if(link == null || link.isEmpty()){
                                                                        out.println("<option value=''>You have no registered admin</option>");
                                                                }else{
                                                                    out.println("<option value=''>Select Admin to assign/revoke role(s)</option>");
                                                                    Set keys = link.keySet();
                                                                    Iterator itr = keys.iterator();
                                                                    for(int i = 0; i < keys.size(); i++){
                                                                        String ids = itr.next().toString();
                                                                        String names = link.get(ids).toString();
                                                                        out.println("<option value = '"+ ids +"'>"+ names +"</option>");  
                                                                    }
                                                                }
                                                            %>
                                                        </select>
                                                        
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-sm-12">
                                                        <button class="btn btn-sm btn-secondary">
                                                            <span class="fa fa-search"></span>
                                                            <span class="">Load</span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <input type="hidden" name="i" value="<%= username %>" />
                                                    </div>
                                                </div>
                                            </form>
                                                
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <table class="table table-responsive">
                                            <%
                                                String admin_email = request.getParameter("email");
                                                String fnames = "";
                                                if(admin_email == null){}else{
                                                    fnames = "Admin: "+AdminDAO.getAdminFullnameByEmail(admin_email);
                                                }
                                            %>
                                            <tr>
                                                <th>Roles</th>
                                                <th class="text-right"><%= fnames %></th>
                                            </tr>
                                            <%
                                                
                                                String query_menus = "select * from "+AppData.MENUS;
                                                DataAccessObject dac_menus = null;
                                                dac_menus = ReportDynaDAO.loadRecord(query_menus);
                                                if(dac_menus.next()){
                                                    dac_menus.previous();
                                                    while(dac_menus.next()){
                                                        String id = dac_menus.getString(1);
                                                        String menu = dac_menus.getString(2);
                                                        
                                            %>
                                            <tr class="bg-light">
                                                <td><%= menu %></td>
                                                <td></td>
                                            </tr>
                                            <%
                                                        String query_sub = "select * from "+AppData.MENU_SUBS+" where iMenuID = '"+id+"'";
                                                        
                                                        
                                                        DataAccessObject dac_sub = null;
                                                        dac_sub = ReportDynaDAO.loadRecord(query_sub);
                                                        if(dac_sub.next()){
                                                            dac_sub.previous();
                                                            while(dac_sub.next()){
                                                                String subid = dac_sub.getString(1);
                                                                String menuid = dac_sub.getString(2);
                                                                String sub = dac_sub.getString(3);
                                            %>
                                            <tr>
                                                <td class="ps-5"><%= sub %></td>
                                                <td>
                                                    <%
                                                        String check = "no";
                                                        if(admin_email == null){}else{
                                                            check = AdminDAO.checkAssignedAdmin(admin_email, subid);
                                                        }
                                                        String assign_status = "";
                                                        if(check.equals("no")){
                                                    %>
                                                    <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>assign_admin_role" method="post">
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <select class="form-control" name="comboEmail" id="email" required>
                                                                    <%
                                                                        LinkedHashMap links = AdminDAO.loadUnassignedActiveAdmins(subid);
                                                                        if(links == null || links.isEmpty()){
                                                                                out.println("<option value=''>assigned to all admin</option>");
                                                                                assign_status = "no";
                                                                        }else{
                                                                            assign_status = "yes";
                                                                            out.println("<option value=''>Select Admin to assign role</option>");
                                                                            Set keys = links.keySet();
                                                                            Iterator itr = keys.iterator();
                                                                            for(int i = 0; i < keys.size(); i++){
                                                                                String ids = itr.next().toString();
                                                                                String names = links.get(ids).toString();
                                                                                out.println("<option value = '"+ ids +"'>"+ names +"</option>");  
                                                                            }
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                            <div class="col-6">
                                                                <button type="submit" class="btn btn-sm btn-success" <% if(assign_status.equals("no")){out.print("disabled");} %>>
                                                                    <span class="fa fa-thumbs-up"></span>
                                                                    <span class="">assign</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <input type="hidden" name="i" value="<%= username %>" />
                                                                <input type="hidden" name="textSubID" value="<%= subid %>" />
                                                                <input type="hidden" name="flag" value="<%= check %>" />
                                                            </div>
                                                        </div>
                                                    </form>
                                                    <%       
                                                        }else if(check.equals("yes")){
                                                    %>
                                                    <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>revoke_admin_role" method="post">
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <input type="text" class="form-control" name="status" value="assigned" readonly />
                                                            </div>
                                                            <div class="col-6">
                                                                <button type="submit" class="btn btn-sm btn-danger">
                                                                    <span class="fa fa-thumbs-down"></span>
                                                                    <span class="">revoke</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <input type="hidden" name="i" value="<%= username %>" />
                                                                <input type="hidden" name="textSubID" value="<%= subid %>" />
                                                                <input type="hidden" name="textEmail" value="<%= admin_email %>" />
                                                                <input type="hidden" name="flag" value="<%= check %>" />
                                                            </div>
                                                        </div>
                                                    </form>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                            </tr>
                                            <%
                                                            }
                                                        }
                                                    }
                                                }
                                            %>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12"></div>
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
