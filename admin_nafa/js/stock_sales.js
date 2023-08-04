/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



function getItemsInCart(id, userid) { 
    
//    var  url = "http://localhost:8080/jovine360workspace/AjaxAdminOrderCartServlet?action=getItemInCart&userid="+userid+"";
    var  url = "https://www.jovine360workspace.com/AjaxAdminOrderCartServlet?action=getItemInCart&userid="+userid+"";

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
            
//            document.getElementById(labelid).innerHTML = status;
        }else if(xmlHttp.status === 404){
            document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> Cart Items";
            document.getElementById("alert-notice").innerHTML = "* validation fail. Please fill appropriately";
            document.getElementById("alert-panel").style.display = "block";
        }
    };
    
    xmlHttp.send(url);
    
}
function deleteItemFromCart(id, userid) { 

//    var  url = "http://localhost:8080/jovine360workspace/AjaxAdminOrderCartServlet?action=deleteItemFromCart&cartid="+id+"";
    var  url = "https://www.jovine360workspace.com/AjaxAdminOrderCartServlet?action=deleteItemFromCart&cartid="+id+"";
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
            
            document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> Item Removal";
            document.getElementById("alert-notice").innerHTML = status;
            $("#alert-panel").fadeIn(500);
            getItemsInCart("checkout", userid);
//            document.getElementById(labelid).innerHTML = status;
        }else if(xmlHttp.status === 404){
            document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> Item Removal";
            document.getElementById("alert-notice").innerHTML = "* validation fail. Please fill appropriately";
            document.getElementById("alert-panel").style.display = "block";
        }
    };
    
    xmlHttp.send(url);
    
}
function checkoutItemsInCart(orderno) { 
    
//    var  url = "http://localhost:8080/jovine360workspace/AjaxAdminOrderCheckoutFromCartServlet?action=checkout&flag=yes&orderNo="+orderno+"";
    var  url = "https://www.jovine360workspace.com/AjaxAdminOrderCheckoutFromCartServlet?action=checkout&flag=yes&orderNo="+orderno+"";

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
            
            document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> Item checkout";
            document.getElementById("alert-notice").innerHTML = status;
            $("#alert-panel").fadeIn(500);
            getItemsInCart("checkout");
//            document.getElementById(labelid).innerHTML = status;
        }else if(xmlHttp.status === 404){
            document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> Item Checkout";
            document.getElementById("alert-notice").innerHTML = "* validation fail. Please fill appropriately";
            document.getElementById("alert-panel").style.display = "block";
        }
    };
    
    xmlHttp.send(url);
    
}
function getStockOPtions(value, userid, id) { 
//    alert(value);
//    var  url = "http://localhost:8080/jovine360workspace/AjaxAdminGetStockOptionsServlet?action=getStocks&value="+value+"&userid="+userid+"";
    var  url = "https://www.jovine360workspace.com/AjaxAdminGetStockOptionsServlet?action=getStocks&valÇue="+value+"&userid="+userid+"";

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
            document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> Item Checkout";
            document.getElementById("alert-notice").innerHTML = "* validation fail. Please fill appropriately";
            document.getElementById("alert-panel").style.display = "block";
        }
    };
    
    xmlHttp.send(url);
    
}