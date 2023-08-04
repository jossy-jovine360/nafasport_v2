<%-- 
    Document   : logout
    Created on : 30 Oct 2022, 8:32:19 PM
    Author     : josiah
--%>

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
            String name = "";
            if(username == null){
                String user = request.getParameter("username");
                String email = AdminDAO.getAdminDataByUsername(user, "vEmail");
                int stat = AdminDAO.addLogoutEvent(email);
                if(stat == 0){
                    request.setAttribute("portal", "1");
                    request.setAttribute("msg", "You have successfully logged out.");
                    getServletContext().getRequestDispatcher("/admin_nafa/").forward(request, response);
                }else{
                    request.setAttribute("portal", "1");
                    request.setAttribute("msg", "You have been logged out.");
                    getServletContext().getRequestDispatcher("/admin_nafa/").forward(request, response);
                }
            }else{
                
                String email = AdminDAO.getAdminDataByUsername(username, "vEmail");
                name = AdminDAO.getAdminFullnameByUsername(username);
                int stat = AdminDAO.addLogoutEvent(email);
                if(stat == 0){
                    request.setAttribute("portal", "1");
                    request.setAttribute("msg", "You have successfully logged out.");
                    getServletContext().getRequestDispatcher("/admin_nafa/").forward(request, response);
                }else{
                    request.setAttribute("portal", "1");
                    request.setAttribute("msg", "You have been logged out.");
                    getServletContext().getRequestDispatcher("/admin_nafa/").forward(request, response);
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
        <title>Welcome to NAFA::</title>
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
                    var email = $("#logout_email").val();
                    checksession(email);
                }, 601000);

                $("#alert-panel").click(function () {
                    $("#alert-panel").fadeOut(500);
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
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <a href="./" class="text-decoration-none text-color-1"></a>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12"></div>
            </div>
        </section>
        <section id="content" class="mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="text-22px text-bold ">
                            <span id="greetings"></span>
                            <span id=""> <%= name %></span>
                        </div>
                    </div>
                </div>
                <div class="row shadow-sm pad-all-10 bg-profile-color">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <span class="col-2">You are logging out...</span>
                        
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="container-fluid">
                <div class="col-12 text-center">
                    Copyright &copy; 2022 Jovine360 Workspace. Developed and Powered By Jovine360 Solutions Limited
                </div>
            </div>
        </footer>

        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
