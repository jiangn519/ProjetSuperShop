function addCheck() {
    
    var password = document.getElementById("password").value;
    var newword = document.getElementById("newword").value;
     if (password != newword) {
        alert("Inconsistent password!");
        document.getElementById("newword").focus();
        return false;
    }
    
}
function validate() {
     var flag = addCheck();
     if (flag == false)
        return false;
    return true;
}
