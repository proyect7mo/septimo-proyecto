function obtiene_http_request(){
    var req=false;
    req=new XMLHttpRequest();
    return req;
    
}
var mipeticion =obtiene_http_request();
function cargarcanton(id,ide,url){
    var vinculo=url+"?id"+id;
    mipeticion.open("GET",vinculo,true);
    mipeticion.onreadystatechange=mipeticion.onreadystatechange=function(){
        var http=mipeticion.responseText;
        document.getElementById(ide).innerHTML=http;
        
    }
    mipeticion.send(null);
}
