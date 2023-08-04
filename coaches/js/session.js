/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkIMSsession(username){
//    alert(id);
//    document.getElementById(id).innerHTML = "loading...";
//    var  domain = "http://localhost:8080/jovine360workspace/ims/logout.jsp?username="+username;
//    var  url = "http://localhost:8080/jovine360workspace/AjaxSessionServlet?action=checkSession";

    var  domain = "https://www.nafafootball.com/coaches/logout.jsp?username="+username;
    var  url = "https://www.nafafootball.com/AjaxSessionServlet?action=checkSession";
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
            if(status === "no"){
//                document.getElementById(id).click();
                window.location.href = domain;
            }
        }else if(xmlHttp.status === 404){
            
        }
    };
    xmlHttp.send(url);
}
function checkSAsession(email){
//    alert(id);
//    document.getElementById(id).innerHTML = "loading...";
//    var  domain = "http://localhost:8080/jovine360workspace/logout.jsp?email="+email;
//    var  url = "http://localhost:8080/jovine360workspace/AjaxSessionServlet?action=checkSession";
    
    var  domain = "https://www.nafafootball.com/coaches/logout.jsp?email="+email;
    var  url = "https://www.nafafootball.com/AjaxSessionServlet?action=checkSession";
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
            if(status === "no"){
//                document.getElemenÇtById(id).click();
                window.location.href = domain;
            }
        }else if(xmlHttp.status === 404){
            
        }
    };
    xmlHttp.send(url);
}