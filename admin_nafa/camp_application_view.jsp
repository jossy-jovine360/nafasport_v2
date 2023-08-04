<%-- 
    Document   : camp_application_view
    Created on : 18 Mar 2023, 7:37:08 AM
    Author     : josiah
--%>


<%@page import="daos.StateDAO"%>
<%@page import="daos.CountryDAO"%>
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
        <title>Welcome to NAFA Admin Portal:: Admin Reports</title>
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
                                <h3>Camp Applicants Details</h3>
                            </div>
                        </div>
                        <div class="row hidden-print">
                            <div class="d-flex align-content-end justify-content-end">
                                <button type="button" class="btn btn-sm btn-primary" onclick="print();">
                                    <span class="fa fa-print"></span>
                                    <span class="hidden-sm">Print Report</span>
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="bg-light p-3">
                                <%
                                    String email = request.getParameter("email");
                                    if(email == null){}else{
                                        String query = "select * from "+AppData.CAMPS+" where vEmail = '"+email+"'";
                                        DataAccessObject obj = ReportDynaDAO.loadRecord(query);
                                        if(obj.next()){
                                            String emailid = obj.getString(1);
                                            String fullname = obj.getString(2);
                                            String phone = obj.getString(3);
                                            String country_origin = obj.getString(4);
                                            String country_residence = obj.getString(5);
                                            String stateid = obj.getString(6);
                                            String lgaid = obj.getString(7);
                                            String state_residence = obj.getString(8);
                                            String gender = obj.getString(9);
                                            String height = obj.getString(10);
                                            String weight = obj.getString(11);
                                            String religion = obj.getString(12);
                                            String tattoo = obj.getString(13);
                                            String nafa_member = obj.getString(14);
                                            String education = obj.getString(15);
                                            String occupation = obj.getString(16);
                                            String otherSport = obj.getString(17);
                                            String currentSport = obj.getString(18);
                                            String position = obj.getString(19);
                                            String team = obj.getString(20);
                                            String sponsor = obj.getString(21);
                                            String sponsor_ocupation = obj.getString(22);
                                            String relation = obj.getString(23);
                                            String nafa_sponsor = obj.getString(24);
                                            String finance = obj.getString(25);
                                            String remark = obj.getString(26);
                                            String status = obj.getString(27);
                                            
                                            String country_ori = CountryDAO.getCountryName(country_origin);
                                            String country_res = CountryDAO.getCountryName(country_residence);
                                            String state_origin = StateDAO.getStateName(stateid);
                                            String state_resp = StateDAO.getStateName(state_residence);
                                            String lga = StateDAO.getLga(lgaid);
                                            
                                %>
                                <table class="table table-striped-columns table-responsive">
                                    <tr>
                                        <th>Full Name:</th>
                                        <td><%= fullname %></td>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <td><%= emailid %></td>
                                    </tr>
                                    <tr>
                                        <th>Phone:</th>
                                        <td><%= phone %></td>
                                    </tr>
                                    <tr>
                                        <th>Country of Origin:</th>
                                        <td><%= country_ori %></td>
                                    </tr>
                                    <tr>
                                        <th>State of Origin:</th>
                                        <td><%= state_origin %></td>
                                    </tr>
                                    <tr>
                                        <th>LGA/ City:</th>
                                        <td><%= lga %></td>
                                    </tr>
                                    <tr>
                                        <th>Country of Residience:</th>
                                        <td><%= country_res %></td>
                                    </tr>
                                    <tr>
                                        <th>State of Residence:</th>
                                        <td><%= state_resp %></td>
                                    </tr>
                                    <tr>
                                        <th>Gender:</th>
                                        <td><%= gender %></td>
                                    </tr>
                                    <tr>
                                        <th>Height:</th>
                                        <td><%= height %></td>
                                    </tr>
                                    <tr>
                                        <th>Weight:</th>
                                        <td><%= weight %></td>
                                    </tr>
                                    <tr>
                                        <th>Religion:</th>
                                        <td><%= religion %></td>
                                    </tr>
                                    <tr>
                                        <th>Tattoo:</th>
                                        <td><%= tattoo %></td>
                                    </tr>
                                    <tr>
                                        <th>NAFA Member:</th>
                                        <td><%= nafa_member %></td>
                                    </tr>
                                    <tr>
                                        <th>Academic Qualification:</th>
                                        <td><%= education %></td>
                                    </tr>
                                    <tr>
                                        <th>Occupational Status:</th>
                                        <td><%= occupation %></td>
                                    </tr>
                                    <tr>
                                        <th>Other Sport:</th>
                                        <td><%= otherSport %></td>
                                    </tr>
                                    <tr>
                                        <th>Current Sport:</th>
                                        <td><%= currentSport %></td>
                                    </tr>
                                    <tr>
                                        <th>Position:</th>
                                        <td><%= position %></td>
                                    </tr>
                                    <tr>
                                        <th>Team:</th>
                                        <td><%= team %></td>
                                    </tr>
                                    <tr>
                                        <th>Sponsor:</th>
                                        <td><%= sponsor %></td>
                                    </tr>
                                    <tr>
                                        <th>Sponsor's Occupation:</th>
                                        <td><%= sponsor_ocupation %></td>
                                    </tr>
                                    <tr>
                                        <th>Relationship with Sponsor:</th>
                                        <td><%= relation %></td>
                                    </tr>
                                    <tr>
                                        <th>Sponsor's NAFA Membership:</th>
                                        <td><%= nafa_sponsor %></td>
                                    </tr>
                                    <tr>
                                        <th>Able to Sponsor Self:</th>
                                        <td><%= finance %></td>
                                    </tr>
                                    <tr>
                                        <th>Additional Info:</th>
                                        <td><%= remark %></td>
                                    </tr>
                                    <tr>
                                        <th>Status:</th>
                                        <td><%= status %></td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">
                                            <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>approveCandidate" method="post">
                                                <div class="d-grid">
                                                    <button type="submit" class="btn btn-success">
                                                        <span class="fa fa-list-check me-3"></span>
                                                        <span>Approve Candidate</span>
                                                    </button>
                                                    <input type="hidden" name="email" value="<%= email %>" />
                                                    <input type="hidden" name="username" value="<%= username %>" />
                                                </div>
                                            </form>
                                        </th>
                                    </tr>
                                </table>
                                <%
                                        }
                                    }
                                %>
                                </div>
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
