/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadSingleUploadAsURLByFile(file, id, msgid, msgs){
    if(typeof window.FileReader === "undefined"){
        document.getElementById(msgs).innerHTML = "Not Supported";
        document.getElementById(msgid).className = "show";
    }else{
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (evt){
          document.getElementById(id).setAttribute("src", evt.target.result);
        };    
        var img_width = document.querySelector("#"+id).width; 
        var img_height = document.querySelector("#"+id).height; 
    }    
}
function loadSingleUploadAsURL(evt, id, msgid){
    if(typeof window.FileReader === "undefined"){
        document.getElementById(msgid).innerHTML = "Not Supported";
    }else{
        var files = evt.target.files;
        var reader = new FileReader();
        for (i = 0; i < files.length; i++) {
            var file = files[i];
            reader.readAsDataURL(file);
            reader.onload = function (evt){
              document.getElementById(id).setAttribute("src", evt.target.result);
            }; 
        }                          
    }    
}
function loadMultipleUploadAsURL(evt, id, msgid, msgs){
    if(typeof window.FileReader === "undefined"){
        document.getElementById(msgs).innerHTML = "Not Supported";
//        document.getElementById(msgid).style.display = "block";
        $("#"+msgid).addClass("show");
    }else{
        var files = evt.target.files;     
        for (i = 0; i < files.length; i++) {
            var reader = new FileReader();
            var file = files[i];
            reader.readAsDataURL(file);
            reader.onload = function (evt){
              document.getElementById(id).setAttribute("src", evt.target.result);
            }; 
//            var img_width = document.querySelector("#"+id).width; 
//            var img_height = document.querySelector("#"+id).height; 
            
        }                          
    }    
}
function loadMultipleUploads(evt, id, msgs){
    if(typeof window.FileReader === "undefined"){
        document.getElementById(msgs).innerHTML = "Not Supported";
//        document.getElementById(msgid).style.display = "block";
    }else{
        var files = evt.target.files;
        for (i = 0; i < files.length; i++) {
            var reader = new FileReader();
            var file = files[i];
            reader.readAsDataURL(file);         
            reader.onload = function (evt){
                const node = document.createElement("img");
                node.className = "bg-image-placeholder img-thumbnail inline-block w-200px height-200px me-2";
                node.setAttribute("src", evt.target.result);   
                document.getElementById(id).appendChild(node);
            }; 
//            var img_width = document.querySelector("#"+id).width; 
//            var img_height = document.querySelector("#"+id).height; 
            
//            alert(img_height);
        }     
        
    }    
}