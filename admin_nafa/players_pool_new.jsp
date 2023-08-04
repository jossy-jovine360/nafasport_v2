<%-- 
    Document   : players_pool_new
    Created on : 25 Jan 2023, 2:11:47 PM
    Author     : josiah
--%>


<%@page import="daos.TeamDAO"%>
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
        <title>Welcome to NAFA Admin Portal:: Groups Standings</title>
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

                $("#fullname").blur(function (){
                    var store = $("#fullname").val();
                    if(store !== ""){
                        validateSpecialCharacter("fullname","nameHelpText");
                    }else{
                        $("#nameHelpText").text("");
                    }
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
                                <h3>Register New Pool Player</h3>
                            </div>
                        </div>
                        <%
                            String function = "new";
                            String label = "Add New Pool Player";
                            String flag = request.getParameter("flag");
                            String playerid = "";
                            String fullname = "";
                            String email = "";
                            String phone = "";
                            String gender = "";
                            String dob = "";
                            String address = "";
                            String stateid = "";
                            String grade = "";
                            String position = "";
                            String height = "";
                            String weight = "";
                            String special = "";
                            String remark = "";
                            if(flag == null){}else{
                                playerid = request.getParameter("playerid");
                                if(playerid == null){
                                    playerid = "";
                                }else{
                                    function = "edit";
                                    label = "Save Player's Changes";
                                }
                                fullname = request.getParameter("fullname");
                                if(fullname == null){
                                    fullname = "";
                                }
                                email = request.getParameter("email");
                                if(email == null){
                                    email = "";
                                }
                                phone = request.getParameter("phone");
                                if(phone == null){
                                    phone = "";
                                }
                                gender = request.getParameter("gender");
                                if(gender == null){
                                    gender = "";
                                }
                                dob = request.getParameter("dob");
                                if(dob == null){
                                    dob = "";
                                }
                                address = request.getParameter("address");
                                if(address == null){
                                    address = "";
                                }
                                stateid = request.getParameter("stateid");
                                if(stateid == null){
                                    stateid = "";
                                }
                                grade = request.getParameter("grade");
                                if(grade == null){
                                    grade = "";
                                }
                                position = request.getParameter("position");
                                if(position == null){
                                    position = "";
                                }
                                height = request.getParameter("height");
                                if(height == null){
                                    height = "";
                                }
                                weight = request.getParameter("weight");
                                if(weight == null){
                                    weight = "";
                                }
                                special = request.getParameter("special");
                                if(special == null){
                                    special = "";
                                }
                                remark = request.getParameter("remark");
                                if(remark == null){
                                    remark = "";
                                }
                            }
                            
                        %>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>add_new_player_pool" method="post">
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Full Name:</label>
                                            <input type="text" max="65" name="fullname" class="form-control" id="fullname" value="<%= fullname %>" required />
                                            <div class="form-text text-danger" id="nameHelpText"></div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Email:</label>
                                            <input type="email" max="65" name="email" class="form-control" id="email" value="<%= email %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Phone:</label>
                                            <input type="text" max="15" name="phone" class="form-control" id="phone" value="<%= phone %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <label>Gender:</label>
                                            <select class="form-control" name="gender" id="gender" required>
                                                <option <% if(gender.equals("Male")){out.print("selected='true'");} %> >Male</option>
                                                <option <% if(gender.equals("Female")){out.print("selected='true'");} %> >Female</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <label>Date of Birth:</label>
                                            <input type="date" name="dob" class="form-control" id="dob" value="<%= dob %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Address:</label>
                                            <textarea class="form-control" maxlength="150" rows="3" name="address" id="address" required ><%= address %></textarea>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="ol-lg-6 col-md-6 col-sm-12">
                                            <label>Select State:</label>
                                            <select class="form-control" name="stateid" id="stateid" required>
                                                <%
                                                    LinkedHashMap link = StateDAO.loadAllStatesInfo();
                                                    if(link == null || link.isEmpty()){
                                                            out.println("<option value=''>You have no registered state</option>");
                                                    }else{
                                                        out.println("<option value=''>Select State</option>");
                                                        Set keys = link.keySet();
                                                        Iterator itr = keys.iterator();
                                                        for(int i = 0; i < keys.size(); i++){
                                                            String id = itr.next().toString();
                                                            String names = link.get(id).toString();
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
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <label>Grade</label>
                                            <input type="text" name="grade" max="35" class="form-control" id="grade" value="<%= grade %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Position:</label>
                                            <input type="text" name="position" max="100" class="form-control" id="position" value="<%= position %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Height (inches):</label>
                                            <input type="number" name="height" class="form-control" id="height" value="<%= height %>" required />
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Weight (kg):</label>
                                            <input type="number" name="weight" class="form-control" id="weight" value="<%= weight %>" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Special Needs:</label>
                                            <select class="form-control" name="special" id="special" required>
                                                <option <% if(special.equals("Yes")){out.print("selected='true'");} %> >Yes</option>
                                                <option <% if(special.equals("No")){out.print("selected='true'");} %> >No</option>
                                            </select>
                                        </div>
                                        <div class="col-lg- col-md-8 col-sm-12">
                                            <label>Addition information:</label>
                                            <textarea class="form-control" rows="3" maxlength="350" name="remark" id="remark" placeholder="enter 'no' if none" required ><%= remark %></textarea>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <input type="hidden" name="function" id="function" class="form-control" value="<%= function %>" />
                                            <input type="hidden" name="username" id="user" class="form-control" value="<%= username %>" />
                                            <input type="hidden" name="playerid" id="playerid" class="form-control" value="<%= playerid %>" />
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
