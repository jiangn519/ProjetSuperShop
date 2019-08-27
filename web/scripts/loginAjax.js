
function check() {

   var name = document.getElementById("email-login").value;
    var pwd = document.getElementById("password-login").value;
    //alert("name:" + name + ",pwd:" + pwd);
    var url = "login?loginname=" + name + "&loginpwd=" + pwd;
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            var rep = xmlhttp.responseText;
            
            if (rep == "true") {
                window.location.href = "index.jsp";
            } else {
                document.getElementById("state").innerHTML = '<font color="red">username or password is wrong!!!</font>';
            }


        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
function register(){
    
    window.location.href = "register.jsp" ;
}