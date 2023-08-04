/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function loadTeamsOptions(groupid, teamid, flag, id) { 
    
//    var  url = "http://localhost:8080/nafasports/AjaxAdminGetTeamsOptionsServlet?action=getTeamsFromGroup&groupid="+groupid+"&teamid="+teamid+"&flag="+flag+"";
    var  url = "https://www.nafafootball.com/AjaxAdminGetTeamsOptionsServlet?action=getTeamsFromGroup&groupid="+groupid+"&teamid="+teamid+"&flag="+flag+"";
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
            
            document.getElementById(id).innerHTML = status;
        }else if(xmlHttp.status === 404){
            document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> Error Loading Teams";
            document.getElementById("alert-notice").innerHTML = "* validation fail. Please fill appropriately";
            document.getElementById("alert-panel").style.display = "block";
        }
    };
    
    xmlHttp.send(url);
    
}