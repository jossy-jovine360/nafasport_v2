<%-- 
    Document   : camp_registration
    Created on : 14 Mar 2023, 7:36:12 PM
    Author     : josiah
--%>


<%@page import="daos.CountryDAO"%>
<%@page import="appData.AppData"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="daos.StateDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String msg = (String)request.getAttribute("msg");
            String disp = "hidden";
            if(msg == null){
                msg = "";
            }else{
                disp = "show";
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to NAFA | Official Site of the National American Football Association</title>
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
                $("#stateid").change(function(){
                    var lga = $("#stateid").val();
                    if(lga === "specify"){
                        $("#stateid-new").slideDown("slow");
                    }else{
                        $("#stateid-new").slideUp("slow");
                    }
                });
                $("#lgaid").change(function(){
                    var lga = $("#lgaid").val();
                    if(lga === "specify"){
                        $("#lgaid-new").slideDown("slow");
                    }else{
                        $("#lgaid-new").slideUp("slow");
                    }
                });
                $("#countryid").change(function(){
                    var lga = $("#countryid").val();
                    if(lga === "specify"){
                        $("#countryid-new").slideDown("slow");
                    }else{
                        $("#countryid-new").slideUp("slow");
                    }
                });
                $("#country_residence").change(function(){
                    var lga = $("#country_residence").val();
                    if(lga === "specify"){
                        $("#country-residence-new").slideDown("slow");
                    }else{
                        $("#country-residence-new").slideUp("slow");
                    }
                });
                $("#state_resid").change(function(){
                    var lga = $("#state_resid").val();
                    if(lga === "specify"){
                        $("#state-resid-new").slideDown("slow");
                    }else{
                        $("#state-resid-new").slideUp("slow");
                    }
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
            <div class="centralize w-50 text-center text-bold"><a href="/" class="text-decoration-none">Home</a> / Registration</div>
        </section>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <img src="images/camp_banner.jpeg" class="w-100" alt="alt"/>
                    </div>
                </div>
            </div>
        </section>
        <section class="mb-3">
            <div class="container pt-5">
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
                <div class="row">
                    <div class="col-12">
                        <div class="w-50 centralize height-auto">
                            <h2 class="text-center">Online Registration Form</h2>
                            <h4>Requirements</h4>
                            <div class="block">All eligible candidate must:</div>
                            <ul style="list-style-type: disc">
                                <li>be either minimum of 18yrs and not above 35 years of age.</li>
                                <li>play at least one type of team sport or the track and field.</li>
                                <li>be physically fit with no medical condition</li>
                                <li>have a minimum height of 5.7FT</li>
                            </ul>
                            <div class="mb-4 text-bold">Note: All Non-Nigerian candidate must present a Nigerian Passport</div>
                            <form action="<%= AppData.CONTROLLER %>CampRegistration" method="post">
                                <div class="row mb-2">
                                    <div class="col-12 bg-light pt-2 rounded"><h3>Personal Information</h3></div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Enter Full Name:</label>
                                        <input type="text" class="form-control" name="fullname" placeholder="enter full name here" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Enter Email:</label>
                                        <input type="email" class="form-control" name="email" placeholder="enter your email here" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Phone:</label>
                                        <input type="number" class="form-control" name="phone" placeholder="enter your phone here" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Country of Origin:</label>
                                        <%
                                            LinkedHashMap link2 = CountryDAO.loadAllCountries();
                                            if(link2 == null || link2.isEmpty()){
                                        %>
                                        <input type="text" class="form-control" name="countryid" placeholder="enter your country of origin here" required />
                                        <%
                                            }else{
                                                out.println("<select name='countryid' id='countryid' class='form-control' required>");
                                                out.println("<option value=''>Select Country</option>");
                                                out.println("<option value='specify'>Specify Country</option>");
                                                Set keys = link2.keySet();
                                                Iterator itr = keys.iterator();
                                                for(int i = 0; i < keys.size(); i++){
                                                    String id = itr.next().toString();
                                                    String names = link2.get(id).toString();
                                                    out.println("<option value = '"+ id +"'>"+ names +"</option>");  
                                                }
                                                out.println("<option value='specify'>Specify Country</option>");
                                                out.println("</select>");
                                            }
                                        %>
                                    </div>
                                    
                                </div>
                                <div class="row mb-3 display-none" id="countryid-new">
                                    <div class="col-12">
                                        <label>Specify Country of Origin:</label>
                                        <input type="text" class="form-control" name="countryid_new" placeholder="enter your country of origin here" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Country of Residence:</label>
                                        <%
                                            LinkedHashMap link3 = CountryDAO.loadAllCountries();
                                            if(link3 == null || link3.isEmpty()){
                                        %>
                                        <input type="text" class="form-control" name="country_residence" placeholder="enter your country here" required />
                                        <%
                                            }else{
                                                out.println("<select name='country_residence' id='country_residence' class='form-control' required>");
                                                out.println("<option value=''>Select Country</option>");
                                                out.println("<option value='specify'>Specify Country of Residence</option>");
                                                Set keys = link3.keySet();
                                                Iterator itr = keys.iterator();
                                                for(int i = 0; i < keys.size(); i++){
                                                    String id = itr.next().toString();
                                                    String names = link3.get(id).toString();
                                                    out.println("<option value = '"+ id +"'>"+ names +"</option>");  
                                                }
                                                out.println("<option value='Specify'>Specify Country</option>");
                                                out.println("</select>");
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="row mb-3 display-none" id="country-residence-new">
                                    <div class="col-12">
                                        <label>Specify Country of Residence:</label>
                                        <input type="text" class="form-control" name="country_residence_new" placeholder="enter your country of residence here" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Select State/Province of Origin:</label>
                                        <%
                                            LinkedHashMap link = StateDAO.loadAllStatesOnly();
                                            if(link == null || link.isEmpty()){
                                        %>
                                        <input type="text" class="form-control" name="stateid" placeholder="enter your state here" required />
                                        <%
                                            }else{
                                                out.println("<select name='stateid' id='stateid' class='form-control' required>");
                                                out.println("<option value=''>Select State</option>");
                                                out.println("<option value='specify'>Specify State</option>");
                                                Set keys = link.keySet();
                                                Iterator itr = keys.iterator();
                                                for(int i = 0; i < keys.size(); i++){
                                                    String id = itr.next().toString();
                                                    String names = link.get(id).toString();
                                                    out.println("<option value = '"+ id +"'>"+ names +"</option>");  
                                                }
                                                out.println("<option value='specify'>Specify State</option>");
                                                out.println("</select>");
                                            }
                                        %>
                                    </div>
                                    
                                </div>
                                <div class="row mb-3 display-none" id="stateid-new">
                                    <div class="col-12">
                                        <label>Specify State/Province:</label>
                                        <input type="text" class="form-control" name="stateid_new" placeholder="enter your state/province here" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                        <div class="col-12">
                                        <label>LGA/City of Origin</label>
                                        <%
                                            LinkedHashMap link1 = StateDAO.loadAllLGAs();
                                            if(link1 == null || link1.isEmpty()){
                                        %>
                                        <input type="text" class="form-control" name="lgaid" placeholder="enter your lga here" required />
                                        <%
                                            }else{
                                                out.println("<select name='lgaid' id='lgaid' class='form-control' required>");
                                                out.println("<option value=''>Select LGA</option>");
                                                out.println("<option value='specify'>Specify LGA</option>");
                                                Set keys = link1.keySet();
                                                Iterator itr = keys.iterator();
                                                for(int i = 0; i < keys.size(); i++){
                                                    String id = itr.next().toString();
                                                    String names = link1.get(id).toString();
                                                    out.println("<option value = '"+ id +"'>"+ names +"</option>");  
                                                }
                                                out.println("<option value='specify'>Specify LGA</option>");
                                                out.println("</select>");
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="row mb-3 display-none" id="lgaid-new">
                                    <div class="col-12">
                                        <label>Specify LGA/City:</label>
                                        <input type="text" class="form-control" name="lgaid_new" placeholder="enter your lga here" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>State of Residence/Province:</label>
                                        <%
                                            LinkedHashMap link4 = StateDAO.loadAllStatesOnly();
                                            if(link4 == null || link4.isEmpty()){
                                        %>
                                        <input type="text" class="form-control" name="state_resid" placeholder="enter your state here" required />
                                        <%
                                            }else{
                                                out.println("<select name='state_resid' id='state_resid' class='form-control' required>");
                                                out.println("<option value=''>Select State/Province</option>");
                                                out.println("<option value='specify'>Specify State/Province</option>");
                                                Set keys = link4.keySet();
                                                Iterator itr = keys.iterator();
                                                for(int i = 0; i < keys.size(); i++){
                                                    String id = itr.next().toString();
                                                    String names = link4.get(id).toString();
                                                    out.println("<option value = '"+ id +"'>"+ names +"</option>");  
                                                }
                                                out.println("<option value='specify'>Specify State/Province</option>");
                                                out.println("</select>");
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="row mb-3 display-none" id="state-resid-new">
                                    <div class="col-12">
                                        <label>Specify State of Residence:</label>
                                        <input type="text" class="form-control" name="state_resid_new" placeholder="enter your state of residence here" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Gender:</label>
                                        <select class="form-control" name="gender" required>
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Specify Height (inches):</label>
                                        <input type="number" class="form-control" name="height" placeholder="enter your height here" required />
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Specify Weight (kg):</label>
                                        <input type="number" class="form-control" name="weight" placeholder="enter your weight here" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Religion:</label>
                                        <select class="form-control" name="religion" required>
                                            <option>Christian</option>
                                            <option>Islam</option>
                                            <option>Rather not say</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Any Tattoo?:</label>
                                        <select class="form-control" name="tattoo" required>
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-12">
                                        <label>Are You A Member of NAFA?:</label>
                                        <select class="form-control" name="nafa-member" required>
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Academic Qualification:</label>
                                        <select class="form-control" name="education" required>
                                            <option>S.S.C.E.</option>
                                            <option>OND</option>
                                            <option>HND</option>
                                            <option>B.Sc</option>
                                            <option>Master</option>
                                            <option>Other</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Specify Occupation:</label>
                                        <select class="form-control" name="occupation" required>
                                            <option>Student</option>
                                            <option>Employed</option>
                                            <option>Self Employed</option>
                                            <option>Unemployed</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="row mb-2">
                                    <div class="col-12 bg-light pt-2 rounded"><h3>Sport Information</h3></div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Other Sport:</label>
                                        <input type="text" class="form-control" name="otherSport" placeholder="enter other spoprt played here" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Current Sport:</label>
                                        <input type="text" class="form-control" name="currentSport" placeholder="enter current spoprt played here" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Position:</label>
                                        <input type="text" name="position" class="form-control" id="position" placeholder="enter position here" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Current Team:</label>
                                        <input type="text" name="team" class="form-control" id="team" placeholder="enter current team here" required />
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-12 bg-light pt-2 rounded"><h3>Sponsor Information</h3></div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Sponsor Full Name:</label>
                                        <input type="text" name="sponsor" class="form-control" id="sponsor" placeholder="enter sponsor full name" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Sponsor's Occupation:</label>
                                        <input type="text" name="sponsor_occupation" class="form-control" id="sponsor_occupation" placeholder="enter sponsor's occupation" required />
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                        <label>Relation with Sponsor:</label>
                                        <input type="text" name="sponsor_relationship" class="form-control" id="sponsor_relationship" placeholder="enter relationship with sponsor" required />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Is Sponsor A Member of NAFA?:</label>
                                        <select class="form-control" name="sponsor_member" required>
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Will You Be Able To Finance Yourself to A Game Within and Outside Country, If required?:</label>
                                        <select class="form-control" name="finance" required>
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <label>Additional Information:</label>
                                        <textarea id="remark" name="remark" rows="3" class="form-control" placeholder="enter additional info here or 'none'" required></textarea>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <input type="hidden" name="function" value="new" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-success btn-lg">
                                                <span>Register Now</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
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
