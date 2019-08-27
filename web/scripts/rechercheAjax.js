
    var catMere="";
    var catChild="";
    var genre="";
    var size="";
    var price="";
    var sizeProDetail="";
    var quantityProDetail="";
    var noProduit="";
    var xmlhttp,url;
    
function getValue(obj){
    catChild=$(obj).attr("nocat");
    catMere=$(obj).attr("nocatMere");
    recherche();
}
function recherche(){
    var radio="";
    radio = document.getElementsByName("groupradio");
    
    for (i = 0; i < radio.length; i++) {
        if (radio[i].checked) {
            genre=radio[i].value;
        }
    }
    size=document.getElementById("sizeselect").value;
    price=document.getElementById("priceselect").value;
//alert("catMere:"+catMere+",catChild:"+catChild+",genre:"+genre+",size:"+size+",price:"+price);

    
    
    
    url = "rechercheAjax?catM=" + catMere+"&catC="+ catChild+"&genreP="+ genre+"&sizeP="+ size+"&priceP="+ price;
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

            var liste = JSON.parse(rep);
            var s = "";
            for (i = 0; i < liste.length; i++)
            {
                s +=  '<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper"><img src="images/' 
         + liste[i].PHOTO + '/1.jpg" class="img-responsive" alt="' + liste[i].NAMEPRD + '"><div><a href="images/' + liste[i].PHOTO 
         + '/1.jpg" class="btn btn-default fancybox-button">Zoom</a> <a href="DetailleServelet?no=' + liste[i].NOPRD
         + '" class="btn btn-default fancybox-fast-view">View</a></div></div><h3><a href="shop-item.html">' + liste[i].NAMEPRD 
         + '</a></h3><div class="pi-price">' + liste[i].PRICESALE + '</div><a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>';
         if(liste[i].GENRE=='S'){
             s+=' <div class="sticker sticker-sale"></div>'
         }
           if(liste[i].GENRE=='N'){
             s+=' <div class="sticker sticker-new"></div>'
         }      
          s+= '</div></div>';
            }
   
            document.getElementById("produitAjax").innerHTML = s;    
         
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function rechercheQuantity(obj){
      
    sizeProDetail=document.getElementById("sizeselectpro").value;
   noProduit=$(obj).attr("nop");
   // alert(sizeProDetail+"   "+noProduit);
    
     url = "rechercheQuantityAjax?sizeP=" + sizeProDetail+"&noP="+ noProduit;
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

            var liste = JSON.parse(rep);
            document.getElementById("product-quantity").innerHTML = liste[0].QUANTITYSTOCK;    
         
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send(); 
}


