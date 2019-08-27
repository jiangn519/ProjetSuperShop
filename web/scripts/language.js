var lang="";
function changeLang(){
    lang=document.getElementById("selectLang").value;
    window.location.href = "IndexServelet?lang=" + lang;
}