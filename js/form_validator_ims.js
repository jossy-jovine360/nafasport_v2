/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/**
 * id
 * msgid
 */
function validateSpecialCharacter(id, msgid) {
    var val = $("#"+id).val();
    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    var res = format.test(val);
    if(res){
        document.getElementById(msgid).innerHTML = "You cannot use any of the following special characters: \n\
            ~ ` , . \ / ? < > [ ]{ } ( ) ^ % # = +";
    }else{
        $("#"+msgid).text("");
    }
}
function validateSpecialCharacterByValue(val, msgid) {
//    var val = $("#"+id).val();
    var format = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    var res = format.test(val);
    if(res){
        document.getElementById(msgid).innerHTML = "You cannot use any of the following special characters: \n\
            ~ ` , . \ / ? < > [ ]{ } ( ) ^ % # = +";
    }else{
        $("#"+msgid).text("");
    }
}
/**
 * Comment
 */
function confirmEmail(id, id2, msgid) {
    var email1 = $("#"+id).val();
    var email2 = $("#"+id2).val();
    if(email1 === email2){
        document.getElementById(msgid).innerHTML = "Email Match";
    }else{
        document.getElementById(msgid).innerHTML = "Email do not match";
    }
}
function showPassword(id, id2) {
    var text = $("#"+id2).text();
    if(text === "show"){
        document.getElementById(id).setAttribute("type","text");
        document.getElementById(id2).innerHTML = "hide";
    }else {
        document.getElementById(id).setAttribute("type","password");
        document.getElementById(id2).innerHTML = "show";
    }
}