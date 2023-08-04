/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadStatesAdmin(country, stateid, id1, id2) { 
    $("#"+stateid).html("<option>loading...</option>");
    var  url = "http://localhost:8080/jovine360solutions/AdminLoadSelectOptionsServlet?action=getStates&countryid="+country+"";
//    var  url = "https://www.greenlifetreasurepurse.com/AdminLoadSelectOptionsServlet?action=getStates&countryid="+country+"";
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
            
            document.getElementById(stateid).innerHTML = status;
//            $("#"+id1).slideDown(500);
        }else if(xmlHttp.status === 404){
            document.getElementById(id2).innerHTML = "* validation fail. Please fill appropriately";
            document.getElementById(id1).style.display = "block";
        }
    };
    xmlHttp.send(url);
}
function loadLgasAdmin(state, lga, id1, id2) { 
    $("#"+lga).html("<option>loading...</option>");
    var  url = "http://localhost:8080/jovine360solutions/AdminLoadSelectOptionsServlet?action=getLgas&stateid="+state+"";
//    var  url = "https://www.greenlifetreasurepurse.com/AjaxLoadOptionsServlet?action=getLgas&stateid="+state+"";
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
            
            document.getElementById(lga).innerHTML = status;
//            $("#"+id1).slideDown(500);
        }else if(xmlHttp.status === 404){
            document.getElementById(id2).innerHTML = "* validation fail. Please fill appropriately";
            document.getElementById(id1).style.display = "block";
        }
    };
    xmlHttp.send(url);
}
