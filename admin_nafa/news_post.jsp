<%-- 
    Document   : news_post
    Created on : 15 Feb 2023, 10:26:32 PM
    Author     : josiah
--%>


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
        <title>Welcome to NAFA Admin Portal:: News</title>
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
        <script type="text/javascript" src="<%= portal %>js/previewimage.js"></script>
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
                $("#newsImage").on("change", function() {
                    if ($("#newsImage")[0].files.length > 10) {
                        alert("You can select only 2 images");
                        $("#newsImage").val("");
                    } 
                });
                $("#newsImage").change(function (evt){          
                    loadMultipleUploads(evt, "placeholder","placeholder");
//                    loadMultipleUploadAsURL(evt, "passport", "msg-alert", "msgs");
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
                    <div class="col-lg-4 col-md-4 col-sm-12 text-center d-flex align-items-center">
                        <span class="">Welcome to Jovine360 POPMAN</span>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-5">

                                </div>
                                <div class="col-7">
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
                                <h3>Post a News</h3>
                            </div>
                        </div>
                        <%
                            String function = request.getParameter("function");
                            String label = "Post News";
                            if(function == null){
                                function = "new";
                            }else{
                                label = "Save News Changes";
                            }
                            String newsid = request.getParameter("newsid");
                            if(newsid == null){
                                newsid = "";
                            }
                            String category = request.getParameter("category");
                            if(category == null){
                                category = "";
                            }
                            String title = request.getParameter("title");
                            if(title == null){
                                title = "";
                            }
                            String par1 = request.getParameter("par1");
                            if(par1 == null){
                                par1 = "";
                            }
                            String par2 = request.getParameter("par2");
                            if(par2 == null){
                                par2 = "";
                            }
                            String par3 = request.getParameter("par3");
                            if(par3 == null){
                                par3 = "";
                            }
                        %>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <form action="<%= AppData.ADMIN_CONTROLLER_SUBDOMAIN %>NewsPostManager" method="post" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <label>Category:</label>
                                            <select class="form-control" name="category" id="category" required>
                                                <option value="">Select Category</option>
                                                <option <% if(category.equals("Latest")){out.print("selected='true'");} %> value="Latest">Latest News</option>
                                                <option <% if(category.equals("Featured")){out.print("selected='true'");} %> value="Featured">Featured News</option>
                                                <option <% if(category.equals("Breaking")){out.print("selected='true'");} %> value="Breaking">Breaking News</option>
                                                <option <% if(category.equals("League")){out.print("selected='true'");} %> value="League">League News</option>
                                                <option <% if(category.equals("Match")){out.print("selected='true'");} %> value="Match">Match News</option>
                                                <option <% if(category.equals("Team")){out.print("selected='true'");} %> value="Team">Team News</option>
                                                <option <% if(category.equals("Player")){out.print("selected='true'");} %> value="Player">Players News</option>
                                                <option <% if(category.equals("Transfer")){out.print("selected='true'");} %> value="Transfer">Transfer News</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-12">
                                            <label>Title:</label>
                                            <input type="text" name="title" class="form-control" id="title" value="<%= title %>" placeholder="enter news title here" required />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Paragraph One (1):</label>
                                            <textarea id="msgPar1" maxlength="4500" name="msgPar1" rows="7" class="form-control" placeholder="enter first paragraph here" required><%= par1 %></textarea>
                                            <div class="form-text text-danger text-italics" id="storenameHelpText">* maximum character length is 1500</div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Paragraph Two (2):</label>
                                            <textarea id="msgPar2" maxlength="4500" name="msgPar2" rows="7" class="form-control" placeholder="enter second paragraph here"><%= par2 %></textarea>
                                            <div class="form-text text-danger text-italics" id="storenameHelpText">* maximum character length is 1500</div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Paragraph Three (3):</label>
                                            <textarea id="msgPar3" maxlength="4500" name="msgPar3" rows="7" class="form-control" placeholder="enter third paragraph here"><%= par3 %></textarea>
                                            <div class="form-text text-danger text-italics" id="storenameHelpText">* maximum character length is 1500</div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label>Upload News Image:</label>
                                            <input type="file" name="newsImage" id="newsImage" class="form-control"  required>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <input type="hidden" name="function" value="<%= function %>" class="form-control" required>
                                            <input type="hidden" name="newsid" value="<%= newsid %>" class="form-control" id="officialid" />
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
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="img-placeholder width-100 overflow-hidden flex-row p-1" id="placeholder">

                                        </div>
                                    </div>
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
