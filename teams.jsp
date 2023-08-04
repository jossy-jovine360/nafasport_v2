<%-- 
    Document   : teams
    Created on : 7 Mar 2023, 3:15:48 PM
    Author     : josiah
--%>


<%@page import="daos.DateDAO"%>
<%@page import="daos.NewsDAO"%>
<%@page import="com.jovine.ellipsis.Ellipsis"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="daos.StateDAO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="appData.AppData"%>
<%@page import="daos.TeamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String stateid = request.getParameter("stateid");
            
            String districtid = request.getParameter("districtid");
            String category = request.getParameter("category");
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA | All Teams</title>
        <meta charset="UTF-8">
        <meta name="description" content="NAFA>
              <meta name="keywords" content="NAFA, American Football, Football League, Football">
        <meta name="author" content="NAFA">
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
        <link rel="stylesheet" type="text/css" href="css/style.css?v=2">
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
        <script type="text/javascript" src="js/team.js"></script>
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

                $("#stateid").change(function(){
                    var stateid = $("#stateid").val();
                    loadTeamsDistrictsOptions(stateid, "districtid");
                });

                $("#alert-panel").click(function () {
                    $("#alert-panel").fadeOut(500);
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
        <section id="menu-bar" class="sticky-lg-top">
            <jsp:include page="header.jsp"></jsp:include>
        </section>
        <section class="bg-light p-5 height-120px" id="navigation-banner">
            <div class="centralize w-50 text-center text-bold"><a href="./" class="text-decoration-none">Home</a> / Teams</div>
        </section>
        <section class="pt-5">
            <div class="container">
                <div class="row mb-3">
                    <div class="col-lg-6 col-md-6 col-sm-12"></div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <label>Sort By:</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>Select State:</label>
                                    <select class="form-control" name="stateid" id="stateid" required>
                                        <%
                                            LinkedHashMap link1 = StateDAO.loadAllStatesInfo();
                                            if(link1 == null || link1.isEmpty()){
                                                    out.println("<option value=''>You have no registered state</option>");
                                            }else{
                                                out.println("<option value='all'>Select State</option>");
                                                Set keys = link1.keySet();
                                                Iterator itr = keys.iterator();
                                                for(int i = 0; i < keys.size(); i++){
                                                    String id = itr.next().toString();
                                                    String names = link1.get(id).toString();
                                                    out.println("<option value = '"+ id +"'>"+ names +"</option>");  
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>Select District:</label>
                                    <select class="form-control" name="districtid" id="districtid">
                                        <option value="all">select state to load district</option>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>Select Category:</label>
                                    <select class="form-control" name="category" id="category">
                                        <option value="all">All Category</option>
                                        <option value="Men">Men</option>
                                        <option value="Women">Women</option>
                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <label>&nbsp;</label>
                                    <div class="d-grid">
                                        <button class="btn btn-success btn-sm">
                                            <span>Load</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%
                    int total_team = 0;
                    String query_team = "select * from "+AppData.TEAMS+" order by(vTeam) asc";
                    total_team = TeamDAO.getTotalTeams();

                    DataAccessObject dac = null;
                    dac = TeamDAO.getTeamQuery(stateid, districtid, category);
                    if(dac.next()){
                        dac.previous();
                        String domain = AppData.DOMAIN_ADMIN;
                        int j = 1;
                        int i = 0;
                        while(dac.next()){
                            String id = dac.getString(1);
                            String team = dac.getString(2);
                            String code = dac.getString(3);
                            String statecode = dac.getString(4);
                            String cate = dac.getString(5);
                            String logo = dac.getString(6);
                            String distid = dac.getString(7);

                            String path = domain+"images/emblem/"+logo;

                            if(j == 1){
                %>
                <div class="row mb-4">  
                <%            
                            }
                    %>
                    <div class="col-lg-2 col-md-2 col-sm-12 p-2 ">
                        <a href="teams_profile.jsp?id=<%= id %>" class="text-decoration-none text-black">
                            <div class="box rounded height-100px w-100px block centralize">
                                <div class="block w-100 height-100" id="">
                                    <img src="<%= path %>" class="w-100 h-100 border-radius-50" alt="alt"/>
                                </div>
                            </div>
                            <div class="block text-center">
                                <%= team.toUpperCase() %> 
                            </div>
                            <div class="block text-center text-bold">
                                (<%= code.toUpperCase() %>) - <%= cate %>
                            </div>
                        </a>
                    </div>
                    <%            
                            j++;
                            i++;
                            if(j >= 7){
                                j = 1;

                %>
                </div>
                <%
                            }else if(j < 7 && i == total_team){
                %>
                </div>
                <%
                            }

                        }
                    }else{

                    }
                %>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="row p-4 mb-5" id="team-new">
                    <div class="col-12" id="contents-team">
                        <h4 class="p-3 mb-3">Team News</h4>
                        <%
                            int total_feat2 = 0;
                            String query_feat2 = "select * from "+AppData.NEWS+" where vCategory = 'Team' limit 0,4";
                            String query_total_feat2 = "";
                            total_feat2 = NewsDAO.getTotalNewsSummary("Team", 4);
                            
                            DataAccessObject reps2 = null;
                            reps2 = ReportDynaDAO.loadRecord(query_feat2);
                            if(reps2.next()){
                                reps2.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(reps2.next()){
                                    String id = reps2.getString(1);
                                    String cate = reps2.getString(2);
                                    String title = reps2.getString(3);
                                    String msgone = reps2.getString(4);
                                    String msgtwo = reps2.getString(5);
                                    String msgthree = reps2.getString(6);
                                    String images = reps2.getString(7);
                                    String datetime = reps2.getString(8);
                                    
                                    String img = NewsDAO.getNewsFirstImages(images);
                                    String path = domain+"images/news/"+img;
                                    String date = DateDAO.getDateFromDateTime(datetime);

                                    if(j == 1){
                        %>
                        <div class="row mb-2">  
                        <%            
                                    }
                            %>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="<%= AppData.CONTROLLER %>newsItem&newsid=<%= id %>" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="<%= path %>" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3"><%= Ellipsis.content(title, 80) %></div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0"><%= date %></div>
                                    </div>
                                </a>
                            </div>
                            <%            
                                    j++;
//                                            System.out.println("jb: "+j+"; total: "+total);
                                    if(j >= 5){
                                        j = 1;
                                        i++;
                        %>
                        </div>
                        <%
                                    }else if(j == (total_feat2+1)){
                        %>
                        </div>
                        <%
                                    }

                                }
                            }else{
                        %>
                        <div class="row mb-2">
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                <a href="#" class="text-decoration-none text-black">
                                    <div class="border box rounded height-auto position-relative">
                                        <div class="block w-100 height-250px" id="">
                                            <img src="images/image6.jpeg" class="w-100 h-100" alt="alt"/>
                                        </div>
                                        <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                        <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <%        
                            }
                        %>
                        <div class="mt-3 text-center"><a href="#" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp" ></jsp:include>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
