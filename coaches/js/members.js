/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkMember(val_id, id, id2){
    var memid = $("#"+val_id).val();
//    alert(memid);
    if(memid.length === 0 | memid.length < 1){
        $("#"+id).slideUp(500);
    }else if(memid.length < 10){
        document.getElementById("indicator").className = "fa fa-warning"; 
        $("#"+id).slideDown(500);
        document.getElementById(id2).innerHTML = "Member ID length is not valid.";
        return false;
    }else if(memid.length > 10){
        document.getElementById("indicator").className = "fa fa-warning"; 
        $("#"+id).slideDown(500);
        document.getElementById(id2).innerHTML = "Member ID length is not valid.";
        return false;
    }else{
        document.getElementById(id).style.display = "block";
        $("#"+id).animate({width: '95%'},"slow");
        document.getElementById(id2).innerHTML = "loading...";
        var  url = "http://localhost:8080/cooperativesocietysolutions/AjaxMemberServlet?action=checkMemberID&memid="+memid+"";
//          var  url = "http://www.cooperativesocietysolutions.com/AjaxMemberServlet?action=checkMemberID&memid="+memid+"";
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
                var flag = status.substring(0, 1);
                if(flag === "V"){
                    document.getElementById("indicator").className = "fa fa-warning";
                    status = status.substring(1, status.length);   
                    document.getElementById(id2).innerHTML = status; 
                    return false;
                }else{
                    document.getElementById("indicator").className = "glyphicon glyphicon-ok-sign"; 
                    document.getElementById(id2).innerHTML = status; 
                    return true;
                }                         
            }else if(xmlHttp.status === 404){
                document.getElementById(id2).innerHTML = "* validation fail. Please fill appropriately";
                document.getElementById(id).style.display = "block";
            }
        };
        xmlHttp.send(url);
    }    
}
