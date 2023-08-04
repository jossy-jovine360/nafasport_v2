/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


/**
 * Comment
 */
function pushOnline() {
    var checked = $(".checkitems:checked").length;
    if(checked === 0){
        var msg = "You have to select the Items you want to push online.";
        var topic = "Online Notice";
        displayNotice(topic, msg);
    }else{
        var ids = "";
        var items = "";
        var flag = "";
        $(".checkitems:checked").each(function (){
            var id = $(this).val();
            var online = $("#online"+id).val();
            var item = $("#item"+id).val();
            if(online === "Yes"){
                items += item+", ";

                var topic = "Public Status";
                var msg = items+" items already public";
                displayNotice(topic, msg);
            }else if(online === "No") {
                ids += id + ",";
                flag = "y";
            }                        
        });
        if(flag === "y"){
            ids = ids.substr(0, ids.length-1);                       

            var storeid = $("#store_id").val();
            var sectionid = $("#store_sectionid").val();
            window.location.href = "AdminStoreControllerServlet?action=PushItemOnline&itemids="+ids+"&storeid="+storeid+"&sectionid="+sectionid;
        }
//                        var msg = ids;
//                        displayNotice("ItemsID", msg);
    }
}
function pushOffline() {
    var checked = $(".checkitems:checked").length;
    if(checked === 0){
        var msg = "You have to select the Items you want to push offline.";
        var topic = "Offline Notice";
        displayNotice(topic, msg);
    }else{
        var ids = "";
        var items = "";
        var flag = "";
        $(".checkitems:checked").each(function (){
            var id = $(this).val();
            var online = $("#online"+id).val();
            var item = $("#item"+id).val();
            if(online === "No"){
                items += item+", ";

                var topic = "Public Status";
                var msg = items+" items already offline";
                displayNotice(topic, msg);
            }else if(online === "Yes") {
                ids += id + ",";
                flag = "y";
            }                        
        });
        if(flag === "y"){
            ids = ids.substr(0, ids.length-1);                       

            var storeid = $("#store_id").val();
            var sectionid = $("#store_sectionid").val();
            window.location.href = "AdminStoreControllerServlet?action=PushItemOffline&itemids="+ids+"&storeid="+storeid+"&sectionid="+sectionid;
        }
//                        var msg = ids;
//                        displayNotice("ItemsID", msg);
    }
}
function pushPromo() {
    var checked = $(".checkitems:checked").length;
    if(checked === 0){
        var msg = "You have to select the Items you want to make as promo.";
        var topic = "Promo Notice";
        displayNotice(topic, msg);
    }else{
        var ids = "";
        var items = "";
        var flag = "";
        $(".checkitems:checked").each(function (){
            var id = $(this).val();
            var online = $("#promo"+id).val();
            var item = $("#item"+id).val();
            if(online === "Yes"){
                items += item+", ";

                var topic = "Promo Status";
                var msg = items+" items already a promo";
                displayNotice(topic, msg);
            }else if(online === "No") {
                ids += id + ",";
                flag = "y";
            }                        
        });
        if(flag === "y"){
            ids = ids.substr(0, ids.length-1);                       

            var storeid = $("#store_id").val();
            var sectionid = $("#store_sectionid").val();
            window.location.href = "AdminStoreControllerServlet?action=PushItemAsPromo&itemids="+ids+"&storeid="+storeid+"&sectionid="+sectionid;
        }
//                        var msg = ids;
//                        displayNotice("ItemsID", msg);
    }
}
function popPromo() {
    var checked = $(".checkitems:checked").length;
    if(checked === 0){
        var msg = "You have to select the Items you want to remove as promo.";
        var topic = "Promo Notice";
        displayNotice(topic, msg);
    }else{
        var ids = "";
        var items = "";
        var flag = "";
        $(".checkitems:checked").each(function (){
            var id = $(this).val();
            var online = $("#promo"+id).val();
            var item = $("#item"+id).val();
            if(online === "No"){
                items += item+", ";

                var topic = "Promo Status";
                var msg = items+" items is already not on promo";
                displayNotice(topic, msg);
            }else if(online === "Yes") {
                ids += id + ",";
                flag = "y";
            }                        
        });
        if(flag === "y"){
            ids = ids.substr(0, ids.length-1);                       

            var storeid = $("#store_id").val();
            var sectionid = $("#store_sectionid").val();
            window.location.href = "AdminStoreControllerServlet?action=RemoveItemAsPromo&itemids="+ids+"&storeid="+storeid+"&sectionid="+sectionid;
        }
//                        var msg = ids;
//                        displayNotice("ItemsID", msg);
    }
}