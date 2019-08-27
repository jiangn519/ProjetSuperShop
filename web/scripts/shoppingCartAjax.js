

function getValue(obj) {
    var prdno = $(obj).attr("prdno");
    var i=$(obj).attr("indexCh");
    changeCart(prdno,i);
}
function getValueDel(obj) {
    var prdnoD = $(obj).attr("prdnoDel");
    deleteCart(prdnoD);
}

function changeCart(prdno,i) {

    var x = document.getElementById("tableCart").getElementsByClassName("changeQuan");
   
    var quantity =x[i].value;
    
 //   alert("quantity:" + quantity + "prd:" + prdno+"index:" + i);
    url = "ShoppingAjaxServlet?trait=update&quantity=" + quantity + "&prdno=" + prdno;
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
            var s = '<tr><th class="goods-page-image">Image</th><th class="goods-page-description">Description</th><th class="goods-page-ref-no">Ref No</th>' +
                    '<th class="goods-page-quantity">Quantity</th><th class="goods-page-price">Unit price</th><th class="goods-page-total" colspan="2">Total</th></tr>';
            var total = 0;
            var nombre=liste.length;
            for (i = 0; i < liste.length; i++)
            {
                var totalPrd = Math.round(liste[i].pricesale * liste[i].quantityCart*100)/100;
                 total += totalPrd;
                
                s += '<tr><td class="goods-page-image"><a href="DetailleServelet?no=' + liste[i].noprd + '"><img src="images/' + liste[i].photo
                        + '/1.jpg" alt="' + liste[i].nameprd + '"></a></td><td class="goods-page-description"><h3><a href="DetailleServelet?no=' + liste[i].noprd
                        + '">' + liste[i].nameprd + '</a></h3><p><strong>Size: </strong>' + liste[i].size + '</p></td><td class="goods-page-ref-no" id="produit-id">'
                        + liste[i].noprd + '</td><td class="goods-page-quantity"><div class="product-quantity"><input id="product-quantity" type="text" value="'
                        + liste[i].quantityCart + '"  class="form-control input-sm changeQuan" onchange="getValue(this)" prdno="' + liste[i].noprd + '"  indexCh="' + i + '"></div></td><td class="goods-page-price"><strong>'
                        + '<span>$</span>' + liste[i].pricesale + '</strong></td><td class="goods-page-total"><strong><span>$</span>' + totalPrd + '</strong></td><td class="del-goods-col">'
                        + '<a class="del-goods" href="javascript:void(0);" onclick="getValueDel(this)" prdnoDel="' + i + '">&nbsp;</a></td></tr>';
               
            }
            var sheader='<ul class="scroller" style="height: 250px;">';
            for (i = 0; i < liste.length; i++)
            {
               var totalPrd = Math.round(liste[i].pricesale * liste[i].quantityCart*100)/100;
               sheader +=  '<li><a href="DetailleServelet?no=' + liste[i].noprd + '"><img src="images/' + liste[i].photo
                + '/1.jpg" alt="' + liste[i].nameprd + '" width="37" height="34"></a><span class="cart-content-count">x '+ liste[i].quantityCart + '</span>'
                +'<strong><a href="DetailleServelet?no=' + liste[i].noprd + '">' + liste[i].nameprd + ': ' + liste[i].size + '</a></strong><em>$' + totalPrd
                + '</em></li>'
            }
            
            sheader +='</ul>';
            
            total =Math.round(total*100)/100;
            var totalT=Math.round((total+10)*100)/100;
            document.getElementById("tableCart").innerHTML = s;
            document.getElementById("produit-total").innerHTML = total;
            document.getElementById("headerTotal").innerHTML = total;
            document.getElementById("headerNombre").innerHTML = nombre;
            document.getElementById("headerCart").innerHTML = sheader;
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}


function deleteCart(prdnoD) {
    url = "ShoppingAjaxServlet?trait=delete&prdnoD=" + prdnoD;
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
            var s = '<tr><th class="goods-page-image">Image</th><th class="goods-page-description">Description</th><th class="goods-page-ref-no">Ref No</th>' +
                    '<th class="goods-page-quantity">Quantity</th><th class="goods-page-price">Unit price</th><th class="goods-page-total" colspan="2">Total</th></tr>';
            var total = 0;
            var total = 0;
            var nombre=liste.length;
            for (i = 0; i < liste.length; i++)
            {
                var totalPrd = Math.round(liste[i].pricesale * liste[i].quantityCart*100)/100;
                 total += totalPrd;
                
                s += '<tr><td class="goods-page-image"><a href="DetailleServelet?no=' + liste[i].noprd + '"><img src="images/' + liste[i].photo
                        + '/1.jpg" alt="' + liste[i].nameprd + '"></a></td><td class="goods-page-description"><h3><a href="DetailleServelet?no=' + liste[i].noprd
                        + '">' + liste[i].nameprd + '</a></h3><p><strong>Size: </strong>' + liste[i].size + '</p></td><td class="goods-page-ref-no" id="produit-id">'
                        + liste[i].noprd + '</td><td class="goods-page-quantity"><div class="product-quantity"><input id="product-quantity" type="text" value="'
                        + liste[i].quantityCart + '"  class="form-control input-sm changeQuan" onchange="getValue(this)" prdno="' + liste[i].noprd + '"  indexCh="' + i + '"></div></td><td class="goods-page-price"><strong>'
                        + '<span>$</span>' + liste[i].pricesale + '</strong></td><td class="goods-page-total"><strong><span>$</span>' + totalPrd + '</strong></td><td class="del-goods-col">'
                        + '<a class="del-goods" href="javascript:void(0);" onclick="getValueDel(this)" prdnoDel="' + i + '">&nbsp;</a></td></tr>';
               
            }
            var sheader='<ul class="scroller" style="height: 250px;">';
            for (i = 0; i < liste.length; i++)
            {
               var totalPrd = Math.round(liste[i].pricesale * liste[i].quantityCart*100)/100;
               sheader +=  '<li><a href="DetailleServelet?no=' + liste[i].noprd + '"><img src="images/' + liste[i].photo
                + '/1.jpg" alt="' + liste[i].nameprd + '" width="37" height="34"></a><span class="cart-content-count">x '+ liste[i].quantityCart + '</span>'
                +'<strong><a href="DetailleServelet?no=' + liste[i].noprd + '">' + liste[i].nameprd + ': ' + liste[i].size + '</a></strong><em>$' + totalPrd
                + '</em></li>'
            }
            
            sheader +='</ul>';
            
            total =Math.round(total*100)/100;
            var totalT=Math.round((total+10)*100)/100;
            document.getElementById("tableCart").innerHTML = s;
            document.getElementById("produit-total").innerHTML = total;
            document.getElementById("headerTotal").innerHTML = total;
            document.getElementById("headerNombre").innerHTML = nombre+'<fmt:message key="Items"/>';
            document.getElementById("headerCart").innerHTML = "$"+sheader;
         

        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
