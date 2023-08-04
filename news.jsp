<%-- 
    Document   : news
    Created on : 4 Mar 2023, 11:06:41 PM
    Author     : josiah
--%>


<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="appData.AppData"%>
<%@page import="daos.NewsDAO"%>
<%@page import="com.jovine.ellipsis.Ellipsis"%>
<%@page import="daos.DateDAO"%>
<%@page import="daos.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA | Official Site of the National American Football Association</title>
        <meta charset="UTF-8">
        <meta name="description" content="NAFA News">
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

            });
            /*
             * For custom alerts notifications, use any of the functions below:
             * displayNotice(topic, msg);
             * displayDynaNotice(topic, msg, topicid, msgid, panelid);
             */


        </script>
    </head>
    <body>
        <section id="menu-bar" class="sticky-lg-top">
            <jsp:include page="header.jsp"></jsp:include>
        </section>
        <section class="bg-light p-5 height-120px" id="navigation-banner">
            <div class="centralize w-50 text-center text-bold"><a href="./" class="text-decoration-none">Home</a> / News</div>
        </section>
        <section>
            <div class="container">
                <div class="row p-4 mb-5" id="latest-new">
                    <div class="col-12" id="contents-latest">
                        <h4 class="p-3 mb-3">Latest News</h4>
                        <%
                            int total_latest = 0;
                            String query_latest = "select * from "+AppData.NEWS+" where vCategory = 'Latest' limit 0,8";
                            String query_total_latest = "";
                            total_latest = NewsDAO.getTotalNewsSummary("Latest", 8);
                            
                            DataAccessObject reps = null;
                            reps = ReportDynaDAO.loadRecord(query_latest);
                            if(reps.next()){
                                reps.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(reps.next()){
                                    String id = reps.getString(1);
                                    String cate = reps.getString(2);
                                    String title = reps.getString(3);
                                    String msgone = reps.getString(4);
                                    String msgtwo = reps.getString(5);
                                    String msgthree = reps.getString(6);
                                    String images = reps.getString(7);
                                    String datetime = reps.getString(8);
                                    
                                    String img = NewsDAO.getNewsFirstImages(images);
                                    String path = domain+"images/news/"+img;
                                    String date = DateDAO.getDateFromDateTime(datetime);

                                    if(j == 1){
                        %>
                        <div class="row mb-2">  
                        <%            
                                    }
                            %>
                            <div class="col-lg-3 col-md-3 col-sm-12 p-2 height-auto">
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
                                    i++;
//                                            System.out.println("jb: "+j+"; total: "+total);
                                    if(j >= 5){
                                        j = 1;
                        %>
                        </div>
                        <%
                                    }else if(j < 5 && i == total_latest){
                        %>
                        </div>
                        <%
                                    }
                                }
                            }else{
                        %>
                            <div class="row mb-2">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 height-auto">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-200px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-450px position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
                                            </div>
                                            <div class="block p-4 mb-3">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adi...</div>
                                            <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0">2023-03-03</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 ">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-450px position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                        <div class="mt-3 text-center"><a href="latest_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="featured-new">
                    <div class="col-12" id="contents-featured">
                        <h4 class="p-3 mb-3">Featured News</h4>
                        <%
                            int total_feat = 0;
                            String query_feat = "select * from "+AppData.NEWS+" where vCategory = 'Featured' limit 0,4";
                            String query_tota_feat = "";
                            total_feat = NewsDAO.getTotalNewsSummary("Featured", 8);
                            
                            DataAccessObject rep = null;
                            rep = ReportDynaDAO.loadRecord(query_feat);
                            if(rep.next()){
                                rep.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(rep.next()){
                                    String id = rep.getString(1);
                                    String cate = rep.getString(2);
                                    String title = rep.getString(3);
                                    String msgone = rep.getString(4);
                                    String msgtwo = rep.getString(5);
                                    String msgthree = rep.getString(6);
                                    String images = rep.getString(7);
                                    String datetime = rep.getString(8);
                                    
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
                                    <div class="border box rounded height-450px position-relative">
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
                                    i++;
                                    if(j >= 5){
                                        j = 1;
                                        
                        %>
                        </div>
                        <%
                                    }else if(j < 5 && i == total_feat){
                        %>
                        </div>
                        <%
                                    }

                                }
                            }else{
                        %>
                            <div class="row mb-2">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-2 height-auto">
                                    <a href="#" class="text-decoration-none text-black">
                                        <div class="border box rounded height-auto position-relative">
                                            <div class="block w-100 height-250px" id="">
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                        <div class="mt-3 text-center"><a href="feature_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="league-new">
                    <div class="col-12" id="contents-league">
                        <h4 class="p-3 mb-3">League News</h4>
                        <%
                            int total_league = 0;
                            String query_league = "select * from "+AppData.NEWS+" where vCategory = 'League' limit 0,4";
                            String query_tota_league = "";
                            total_league = NewsDAO.getTotalNewsSummary("League", 8);
                            
                            DataAccessObject obj = null;
                            obj = ReportDynaDAO.loadRecord(query_league);
                            if(obj.next()){
                                obj.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(obj.next()){
                                    String id = obj.getString(1);
                                    String cate = obj.getString(2);
                                    String title = obj.getString(3);
                                    String msgone = obj.getString(4);
                                    String msgtwo = obj.getString(5);
                                    String msgthree = obj.getString(6);
                                    String images = obj.getString(7);
                                    String datetime = obj.getString(8);
                                    
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
                                    i++;
                                    if(j >= 5){
                                        j = 1;
                                        
                        %>
                        </div>
                        <%
                                    }else if(j < 5 && i == total_league){
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                        <div class="mt-3 text-center"><a href="league_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="match-new">
                    <div class="col-12" id="contents-match">
                        <h4 class="p-3 mb-3">Match News</h4>
                        <%
                            int total_match = 0;
                            String query_match = "select * from "+AppData.NEWS+" where vCategory = 'Match' limit 0,4";
                            String query_tota_match = "";
                            total_match = NewsDAO.getTotalNewsSummary("Match", 8);
                            
                            DataAccessObject obj4 = null;
                            obj4 = ReportDynaDAO.loadRecord(query_league);
                            if(obj4.next()){
                                obj4.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(obj4.next()){
                                    String id = obj4.getString(1);
                                    String cate = obj4.getString(2);
                                    String title = obj4.getString(3);
                                    String msgone = obj4.getString(4);
                                    String msgtwo = obj4.getString(5);
                                    String msgthree = obj4.getString(6);
                                    String images = obj4.getString(7);
                                    String datetime = obj4.getString(8);
                                    
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
                                    i++;
                                    if(j >= 5){
                                        j = 1;
                                        
                        %>
                        </div>
                        <%
                                    }else if(j < 5 && i == total_match){
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                        <div class="mt-3 text-center"><a href="match_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="team-new">
                    <div class="col-12" id="contents-team">
                        <h4 class="p-3 mb-3">Team News</h4>
                        <%
                            int total_team = 0;
                            String query_team = "select * from "+AppData.NEWS+" where vCategory = 'Team' limit 0,4";
                            String query_tota_team = "";
                            total_team = NewsDAO.getTotalNewsSummary("Team", 8);
                            
                            DataAccessObject obj2 = null;
                            obj2 = ReportDynaDAO.loadRecord(query_team);
                            if(obj2.next()){
                                obj2.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(obj2.next()){
                                    String id = obj2.getString(1);
                                    String cate = obj2.getString(2);
                                    String title = obj2.getString(3);
                                    String msgone = obj2.getString(4);
                                    String msgtwo = obj2.getString(5);
                                    String msgthree = obj2.getString(6);
                                    String images = obj2.getString(7);
                                    String datetime = obj2.getString(8);
                                    
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
                                    i++;
                                    if(j >= 5){
                                        j = 1;
                                        
                        %>
                        </div>
                        <%
                                    }else if(j < 5 && i == total_team){
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                        <div class="mt-3 text-center"><a href="team_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="player-news">
                    <div class="col-12" id="contents-players">
                        <h4 class="p-3 mb-3">Players News</h4>
                        <%
                            int total_player = 0;
                            String query_player = "select * from "+AppData.NEWS+" where vCategory = 'Player' limit 0,4";
                            String query_tota_player = "";
                            total_player = NewsDAO.getTotalNewsSummary("Player", 8);
                            
                            DataAccessObject obj1 = null;
                            obj1 = ReportDynaDAO.loadRecord(query_player);
                            if(obj1.next()){
                                obj1.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(obj1.next()){
                                    String id = obj1.getString(1);
                                    String cate = obj1.getString(2);
                                    String title = obj1.getString(3);
                                    String msgone = obj1.getString(4);
                                    String msgtwo = obj1.getString(5);
                                    String msgthree = obj1.getString(6);
                                    String images = obj1.getString(7);
                                    String datetime = obj1.getString(8);
                                    
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
                                    i++;
                                    if(j >= 5){
                                        j = 1;
                                        
                        %>
                        </div>
                        <%
                                    }else if(j < 5 && i == total_player){
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                        <div class="mt-3 text-center"><a href="players_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
                <div class="row p-4 mb-5" id="transfer-new">
                    <div class="col-12" id="contents-transfer">
                        <h4 class="p-3 mb-3">Transfer News</h4>
                        <%
                            int total_transfer = 0;
                            String query_transfer = "select * from "+AppData.NEWS+" where vCategory = 'Transfer' limit 0,4";
                            String query_tota_transfer = "";
                            total_transfer = NewsDAO.getTotalNewsSummary("Transfer", 8);
                            
                            DataAccessObject obj3 = null;
                            obj3 = ReportDynaDAO.loadRecord(query_transfer);
                            if(obj3.next()){
                                obj3.previous();
                                String domain = AppData.DOMAIN_ADMIN;
                                int j = 1;
                                int i = 0;
                                while(obj3.next()){
                                    String id = obj3.getString(1);
                                    String cate = obj3.getString(2);
                                    String title = obj3.getString(3);
                                    String msgone = obj3.getString(4);
                                    String msgtwo = obj3.getString(5);
                                    String msgthree = obj3.getString(6);
                                    String images = obj3.getString(7);
                                    String datetime = obj3.getString(8);
                                    
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
                                    i++;
                                    if(j >= 5){
                                        j = 1;
                                        
                        %>
                        </div>
                        <%
                                    }else if(j < 5 && i == total_transfer){
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                                                <img src="images/image3.jpeg" class="w-100 h-100" alt="alt"/>
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
                        <div class="mt-3 text-center"><a href="transfer_news.jsp" class="text-decoration-none text-bold">Read More</a></div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
