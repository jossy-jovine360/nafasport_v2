/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function createNotification(icon, title, msg) {

    // Let's check if the browser supports notifications
    if (!"Notification" in window) {
      console.log("This browser does not support notifications.");
    }

    // Let's check if the user is okay to get some notification
    else if (Notification.permission === "granted") {
      // If it's okay let's create a notification

//      var img = '/testNotification/img/icon-128.png';
      var img = icon;
      var text = msg;
//      var notification = new Notification('To do list', { body: text, icon: img });
      var notification = new Notification(title, { body: text, icon: img });

      window.navigator.vibrate(500);
    }

    // Otherwise, we need to ask the user for permission
    // Note, Chrome does not implement the permission static property
    // So we have to check for NOT 'denied' instead of 'default'
    else {
        if (Notification.permission !== 'denied') {
            Notification.requestPermission(function (permission) {

              // Whatever the user answers, we make sure Chrome stores the information
              if(!('permission' in Notification)) {
                Notification.permission = permission;
              }

              // If the user is okay, let's create a notification
              if (permission === "granted") {
      //          var img = '/testNotification/img/icon-128.png';
                var img = icon;
                var text = msg;
                var notification = new Notification(title, { body: text, icon: img });

                window.navigator.vibrate(500);
              }
            });
      }else{
          Notification.requestPermission(function (permission) {

              // Whatever the user answers, we make sure Chrome stores the information
              if(!('permission' in Notification)) {
                Notification.permission = permission;
              }

              // If the user is okay, let's create a notification
              if (permission === "granted") {
      //          var img = '/testNotification/img/icon-128.png';
                var img = icon;
                var text = msg;
                var notification = new Notification(title, { body: text, icon: img });

                window.navigator.vibrate(500);
              }
            });
      }
  }
}

function countPaymentConfirmationRequests(id){
//    alert(id);
//     var  url = "http://localhost:8084/greenlifemultinational/AjaxConfirmationNotificationServlet?action=CountRequest";
     var  url = "http://www.greenlifemultinational.com/AjaxConfirmationNotificationServlet?action=CountRequest";
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
//               var end = status.indexOf("$", 0);
//               status = status.substr(0, end);
            document.getElementById(id).innerHTML = status;

            if(status > 0){
                var icon = "images/logo.png";   // for online
//                var icon = "/greenlifemultinational/admin_gl2015/images/logo.png";
                var title = "Payment Confirmation to e-Wallets";
                var msg = "You have "+status+" payment(s) confirmation to credit.";
                createNotification(icon, title, msg);
            }
//           document.getElementsByClassName(id).innerHTML = status;
        }else if(xmlHttp.status === 404){
            document.getElementById(id).innerHTML = "...";
        }
    };
    xmlHttp.send(url);
}
function countPaymentConfirmationRequestsTitle2(id){
//    alert(id);
//     var  url = "http://localhost:8084/greenlifemultinational/AjaxConfirmationNotificationServlet?action=CountRequest";
     var  url = "http://www.greenlifemultinational.com/AjaxConfirmationNotificationServlet?action=CountRequest";
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
//               var end = status.indexOf("$", 0);
//               status = status.substr(0, end);
//            document.getElementById(id).innerHTML = "You have "+status+" payment(s) confirmation to credit.";

            if(status > 0){
                document.getElementById(id).innerHTML = "You have "+status+" payment(s) confirmation to credit.";
            }
//           document.getElementsByClassName(id).innerHTML = status;
        }else if(xmlHttp.status === 404){
            document.getElementById(id).innerHTML = "...";
        }
    };
    xmlHttp.send(url);
}
function countPaymentConfirmationRequestsTitle(id){
//    alert(id);
//     var  url = "http://localhost:8084/greenlifemultinational/AjaxConfirmationNotificationServlet?action=CountRequest";
     var  url = "http://www.greenlifemultinational.com/AjaxConfirmationNotificationServlet?action=CountRequest";
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
//               var end = status.indexOf("$", 0);
//               status = status.substr(0, end);
//            alert(status);
            if(status === 0 || status === '0'){
                document.getElementById(id).innerHTML = "You have "+status+" payment(s) confirmation to credit.";
            }else{
                document.getElementById(id).innerHTML = "You have "+status+" payment(s) confirmation to credit.";
            }            

//           document.getElementsByClassName(id).innerHTML = status;
        }else if(xmlHttp.status === 404){
            document.getElementById(id).innerHTML = "...";
        }
    };
    xmlHttp.send(url);
}