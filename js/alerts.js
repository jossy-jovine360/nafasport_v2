/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function displayNotice(topic, msg) {
    document.getElementById("alert-title").innerHTML =  "<span class='fa fa-info-circle text-right'></span> " +topic;
    document.getElementById("alert-notice").innerHTML = msg;
    $("#alert-panel").fadeIn(500);
}
function displayDynaNotice(topic, msg, topicid, msgid, panelid) {
    document.getElementById(topicid).innerHTML =  "<span class='fa fa-info-circle text-right'></span> " +topic;
    document.getElementById(msgid).innerHTML = msg;
    $("#"+panelid).fadeIn(500);
}