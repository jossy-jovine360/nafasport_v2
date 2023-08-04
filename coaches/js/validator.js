/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function validateUsername(val, id, id2){
    alert(val);
//    document.getElementById(id2).innerHTML = "loading...";
//    var val = document.getElementById(id).value;
//    var  url = "http://localhost:8080/jovine360workspace/AjaxValidateInputServlet?action=checkUsername&input="+val;
    var  url = "https://www.jovine360workspace.com/AjaxValidateInputServlet?action=checkUsername&input="+val;

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
            
            if(status === "yes"){
                document.getElementById(id2).innerHTML = val+" is available.";
                return true;
            }else{
                document.getElementById(id).value = "";
                document.getElementById(id2).innerHTML = status;
                return false;
            }
        }else if(xmlHttp.status === 404){
            
        }
    };
    xmlHttp.send(url);
}

