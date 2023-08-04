/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function loadStoreSection(storeid, section, id1) { 
    $("#"+section).html("<option>loading...</option>");
    var  url = "http://localhost:8080/jovine360solutions/AdminLoadSelectOptionsServlet?action=getStoreSection&storeid="+storeid+"";
//    var  url = "https://www.greenlifetreasurepurse.com/AdminLoadSelectOptionsServlet?action=getStoreSection&storeid="+storeid+"";
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
            
            document.getElementById(section).innerHTML = status;
//            $("#"+id1).slideDown(500);
        }else if(xmlHttp.status === 404){
            document.getElementById(id1).innerHTML = "* validation fail. Please fill appropriately";
//            document.getElementById(id1).style.display = "block";
        }
    };
    xmlHttp.send(url);
}
function loadStoreSectionWithAllOption(storeid, section, id1) { 
    $("#"+section).html("<option>loading...</option>");
    var  url = "http://localhost:8080/jovine360solutions/AdminLoadSelectOptionsServlet?action=getStoreSectionwithAllOption&storeid="+storeid+"";
//    var  url = "https://www.greenlifetreasurepurse.com/AdminLoadSelectOptionsServlet?action=getStoreSectionwithAllOption&storeid="+storeid+"";
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
            
            document.getElementById(section).innerHTML = status;
//            $("#"+id1).slideDown(500);
        }else if(xmlHttp.status === 404){
            document.getElementById(id1).innerHTML = "* validation fail. Please fill appropriately";
//            document.getElementById(id1).style.display = "block";
        }
    };
    xmlHttp.send(url);
}