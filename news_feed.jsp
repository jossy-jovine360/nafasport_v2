<%-- 
    Document   : news_feed
    Created on : 13 Mar 2023, 1:45:22 PM
    Author     : josiah
--%>


<%@page import="com.jovine.ellipsis.Ellipsis"%>
<%@page import="daos.DateDAO"%>
<%@page import="daos.ReportDynaDAO"%>
<%@page import="com.jovine.dao.DataAccessObject"%>
<%@page import="appData.AppData"%>
<%@page import="daos.NewsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String newsid = request.getParameter("newsid");
            String title = "";
            if(newsid == null || newsid.equals("")){
                response.sendRedirect("/");
            }else{
                title = NewsDAO.getNewsTitle(newsid);
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NAFA News | <%= title %></title>
        <meta charset="UTF-8">
        <meta name="description" content="NAFA">
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
        <section class="bg-light p-5 height-120px mb-3" id="navigation-banner">
            <div class="centralize w-50 text-center text-bold"><a href="/" class="text-decoration-none">Home</a> / News</div>
        </section>
        <section>
            <div class="container pt-5">
                <%
                    String query = "select * from "+AppData.NEWS+" where iNewsID = '"+newsid+"'";
                    DataAccessObject obj3 = null;
                    obj3 = ReportDynaDAO.loadRecord(query);
                    if(obj3.next()){
                        String id = obj3.getString(1);
                        String cate = obj3.getString(2);
                        String titles = obj3.getString(3);
                        String msgone = obj3.getString(4);
                        String msgtwo = obj3.getString(5);
                        String msgthree = obj3.getString(6);
                        String images = obj3.getString(7);
                        String datetime = obj3.getString(8);

                        String img = NewsDAO.getNewsFirstImages(images);
                        String domain = AppData.DOMAIN_ADMIN;
                        String path = domain+"images/news/"+img;
                        String date = DateDAO.getDateFromDateTime(datetime);
                        
                        if(msgtwo == null){
                            msgtwo = "";
                        }
                        if(msgthree == null){
                            msgthree = "";
                        }
                %>
                <h1 class="mb-5"><%= titles %></h1>
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <div class="row mb-3">
                            <div class="col-12">
                                <img src="<%= path %>" class="height-auto w-100" alt="<%= titles %>"/>
                            </div>
                        </div>
                        <p><%= msgone %></p>
                        <%
                            int check_video = NewsDAO.checkNewsVideos(newsid);
                            if(check_video < 1){}else{
                                String video = NewsDAO.getNewsVideo(newsid);
                        %>
                        <div class="row mb-3">
                            <div class="col-12">
                                <iframe width="100%" height="415" src="<%= video %>" title="NAFA supports the NAFA U18international Day For Sport Development and Peace Nigeria" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <p><%= msgtwo %></p>
                        <p><%= msgthree %></p>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="row ps-4 mb-5" id="featured-new">
                            <div class="col-12" id="contents-featured">
                                <h4 class=" mb-3">Featured News</h4>
                                <%
                                    int total_feat = 0;
                                    String query_feat = "select * from "+AppData.NEWS+" where vCategory = 'Featured' limit 0,8";
                                    String query_tota_feat = "";
                                    total_feat = NewsDAO.getTotalNewsSummary("Featured", 4);

                                    DataAccessObject reps = null;
                                    reps = ReportDynaDAO.loadRecord(query_feat);
                                    if(reps.next()){
                                        reps.previous();
                                        String domain1 = AppData.DOMAIN_ADMIN;
                                        int j = 1;
                                        int i = 0;
                                        while(reps.next()){
                                            String newsids = reps.getString(1);
                                            String cates = reps.getString(2);
                                            String titless = reps.getString(3);
                                            String msgones = reps.getString(4);
                                            String msgtwos = reps.getString(5);
                                            String msgthrees = reps.getString(6);
                                            String imagess = reps.getString(7);
                                            String datetimes = reps.getString(8);

                                            String imgs = NewsDAO.getNewsFirstImages(imagess);
                                            String paths = domain1+"images/news/"+imgs;
                                            String dates = DateDAO.getDateFromDateTime(datetimes);

                                            if(j == 1){
                                %>
                                <div class="row mb-2">  
                                <%            
                                            }
                                    %>
                                    <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
                                        <a href="<%= AppData.CONTROLLER %>newsItem&newsid=<%= id %>" class="text-decoration-none text-black">
                                            <div class="border box rounded height-auto position-relative">
                                                <div class="block w-100 height-250px" id="">
                                                    <img src="<%= paths %>" class="w-100 h-100" alt="alt"/>
                                                </div>
                                                <div class="block p-4 mb-3"><%= Ellipsis.content(titless, 80) %></div>
                                                <div class="block p-2 text-color-gray text-10px text-right position-absolute bottom-0"><%= dates %></div>
                                            </div>
                                        </a>
                                    </div>
                                    <%            
                                            j++;
        //                                            System.out.println("jb: "+j+"; total: "+total);
                                            if(j >= 3){
                                                j = 1;
                                                i++;
                                %>
                                </div>
                                <%
                                            }else if(j == (total_feat+1)){
                                %>
                                </div>
                                <%
                                            }

                                        }
                                    }else{
                                %>
                                    <div class="row mb-2">
                                        <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                                        <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                                        <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                                        <div class="col-lg-6 col-md-6 col-sm-12 p-2 ">
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
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </section>
        <jsp:include page="footer.jsp" ></jsp:include>
        <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="js/popper.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
