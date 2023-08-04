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
    var format = /[!@#$%^&*()_+\-=\[\]{};':"~`\\|,.<>\/?]+/;
    var res = format.test(val);
    if(res){
        document.getElementById(msgid).innerHTML = "You cannot use any of the following special characters: \n\
            ~ ` , . \ / ? < > [ ]{ } ( ) ^ % # = +";
        document.getElementById(id).value = "";
        $("#"+id).focus();
    }else{
        $("#"+msgid).text("");
    }
}
function validateSpecialCharacterByValue(val, msgid) {
//    var val = $("#"+id).val();
    var format = /[!@#$%^&*()_+\-=\[\]{};':"~`\\|,.<>\/?]+/;
    var res = format.test(val);
    if(res){
        document.getElementById(msgid).innerHTML = "You cannot use any of the following special characters: \n\
            ~ ` , . \ / ? < > [ ]{ } ( ) ^ % # = +";
        document.getElementById(id).value = "";
        $("#"+id).focus();
    }else{
        $("#"+msgid).text("");
    }
}