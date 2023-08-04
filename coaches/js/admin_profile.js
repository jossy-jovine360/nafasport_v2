/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function changeEmail(email_oldid, email_newid, id){
//    alert(id);
    document.getElementById(id).innerHTML = "loading... <span class='fa fa-spinner fa-spin'></span>";
    if(email_newid.length < 1){
        document.getElementById(id).innerHTML = "You need to provide new email.";
    }else{
        var domain = "http://localhost:8080/jovine360solutions/adminoffice/?msg=Session%20Expired";
        var email_old = document.getElementById(email_oldid).value;
        var email = document.getElementById(email_newid).value;
        var  url = "http://localhost:8080/jovine360solutions/AjaxAdminProfileServlet?function=changeEmail&emailOld="+email_old+"&emailNew="+email+"";
    //    var  url = "http://www.jovinemall.com/AjaxAdminProfileServlet?function=changeEmail&emailOld="+email_old+"&emailNew="+email+""
        var xmlHttp;
        if(window.XMLHttpRequest){
            xmlHttp = new XMLHttpRequest();
        }else if(window.ActiveXObject){
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.open('POST', url, true);
        xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xmlHttp.onreadystatechange = function(){
            if(xmlHttp.readyState === 4 && xmlHttp.status === 200){                
                var status = xmlHttp.responseText;
                var end = status.indexOf("$", 0);
                status = status.substr(0, end);
                if(status === "Session Expired"){
                    window.location.href = domain;
                }else{
                    document.getElementById(id).innerHTML = status;
                }              
//                $("#edit-email").click();
            }else if(xmlHttp.status === 404){

            }
        };
        xmlHttp.send(url);
    }
}
function changePWD(email_newid, id){
//    alert(id);
    document.getElementById(id).innerHTML = "loading... <span class='fa fa-spinner fa-spin'></span>";
    if(email_newid.length < 1){
        document.getElementById(id).innerHTML = "You need to provide new email.";
    }else{
        var domain = "http://localhost:8080/jovine360solutions/adminoffice/?msg=Session%20Expired";
        var email = document.getElementById(email_newid).value;
        var  url = "http://localhost:8080/jovine360solutions/AjaxAdminProfileServlet?function=changePWD&passwordNew="+email+"";
    //    var  url = "http://www.jovine360solutions.com/AjaxAdminProfileServlet?function=changePWD&passwordNew="+email+""
        var xmlHttp;
        if(window.XMLHttpRequest){
            xmlHttp = new XMLHttpRequest();
        }else if(window.ActiveXObject){
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.open('POST', url, true);
        xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xmlHttp.onreadystatechange = function(){
            if(xmlHttp.readyState === 4 && xmlHttp.status === 200){                
                var status = xmlHttp.responseText;
                var end = status.indexOf("$", 0);
                status = status.substr(0, end);
                if(status === "Session Expired"){
                    window.location.href = domain;
                }else{
                    document.getElementById(id).innerHTML = status;
                }              
//                $("#edit-email").click();
            }else if(xmlHttp.status === 404){

            }
        };
        xmlHttp.send(url);
    }
}
