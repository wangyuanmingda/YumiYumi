   function addtocart(env,i) {
                var id = (env.getAttribute("id"));
                id = id.substr(1);
                var sd = getCookie("yumiyumi_cart" + id);
                var quantity = 0;
                var price = 0;
                if (sd == null) {
                     var cookie_value = "quantity:" + 1 + ";price:"+ 12;
                    setCookie("yumiyumi_cart" + id,cookie_value, "3600")
                } else {
                     quantity = parseInt(sd.split(";")[0].split(":")[1]) + 1;
                     price = sd.split(";")[1].split(":")[1];
                     var cookie_value = "quantity:" + quantity + ";price:" + price;       
                    setCookie("yumiyumi_cart" + id, cookie_value, "3600");
                }
                //遍历cookie 计算菜的个数以及总价
               total(i);
               if (i == 1) {
               	var temptotal = price * quantity;
               	var idtemp = "q" + id;
                var totaltemp = "t" + id;
                document.all[idtemp].innerText= "数量：" + parseInt(quantity);
                document.all[totaltemp].innerText = "总价：￥" + parseInt(temptotal);

               }
                alert("添加成功");
          
            }
            function deletefromcart(env){
                var id = (env.getAttribute("id"));
                var each_price = (env.getAttribute("every_price"));
                id = id.substr(1);
				alert(id);
                var sd = getCookie("yumiyumi_cart" + id);
				alert(sd);
                if (sd == null) {
                    alert("Wrong");
                }else{
                    quantity = parseInt(sd.split(";")[0].split(":")[1]);
                    price = sd.split(";")[1].split(":")[1];
                    if (quantity == 1) {
                        alert("不能再减了。");
                    }else{
                        quantity = parseInt(quantity) - 1;
                        var temptotal = price * quantity;
                        var cookie_value = "quantity:" + quantity +";price:" + price;
						alert(cookie_value);
                        setCookie("yumiyumi_cart" + id, cookie_value, "3600");
                        var idtemp = "q" + id;
                        var totaltemp = "t" + id;
                        document.all[idtemp].innerText="数量：" +  quantity;
                        document.all[totaltemp].innerText = "总价：￥" + parseInt(temptotal);
                    }
                //    total();
                     
                }
                loadcart();
            }

           function deletepart(env){
            	//把cookie中所有相关id 的cookie都删除。
            	var idtotel = (env.getAttribute("id"));
            	var id = idtotel.split(";")[1];
            	var j = idtotel.split(";")[0].split("e")[1]; 
            	var allcookies = document.cookie;
            	var sd = "yumiyumi_cart" + id ;



            	var eachcookie = allcookies.split(";");
                        for(var i = 0; i <eachcookie.length;i++){
                        //cookiename前几位为YumiYumi_cart的cookie 将过期时间设为过去的某一时间。
                        var cookiename = eachcookie[i].split("=")[0];
                        if(cookiename.indexOf(sd) != -1) {
                                    var date = new Date(); 
                                    date.setTime(date.getTime() - 10000); 
                                    setCookie(cookiename , null, date.toGMTString());
                                    elem = "#cart-header" + j ;
                                    fadeOut(elem);
                                    } 
                                }
            }
    function fadeOut(elem, speed, opacity){
    /*
     * 参数说明
     * elem==>需要淡入的元素
     * speed==>淡入速度,正整数(可选)
     * opacity==>淡入到指定的透明度,0~100(可选)
     */
    speed = speed || 20;
    opacity = opacity || 0;
    //初始化透明度变化值为0
    var val = 100;
     var iBase = {
            	 	Id: function(name){
            	 		return document.getElementById(name);
       					},
       					//设置元素透明度,透明度值按IE规则计,即0~100
       				SetOpacity: function(ev, v){
       					ev.filters ? ev.style.filter = 'alpha(opacity=' + v + ')' : ev.style.opacity = v / 100;
       					}
       				}
    //循环将透明值以5递减,即淡出效果
    (function(){
        iBase.SetOpacity(elem, val);
        val -= 5;
        if (val >= opacity) {
            setTimeout(arguments.callee, speed);
        }else if (val < 0) {
            //元素透明度为0后隐藏元素
            elem.style.display = 'none';
        }
    })();
}


            function setCookie(cookieName, cookieValue, cookieExpires) {
                cookieValue = escape(cookieValue);//编码latin-1  
                if (cookieExpires == "") {
                    var nowDate = new Date();
                    nowDate.setMonth(nowDate.getMonth() + 6);
                    cookieExpires = nowDate.toGMTString();
                }
                document.cookie = cookieName + "=" + cookieValue + ";expires=" + cookieExpires + ";path=/";
            }
            function getCookie(cookie_name) {
                var value = null;
                var allcookies = document.cookie;
                var cookie_pos = allcookies.indexOf(cookie_name);
                // 如果找到了索引，就代表cookie存在，    
                // 反之，就说明不存在。    
                if (cookie_pos != -1) {
                    // 把cookie_pos放在值的开始，只要给值加1即可。    
                    cookie_pos += cookie_name.length + 1;
                    var cookie_end = allcookies.indexOf(";", cookie_pos);
                    if (cookie_end == -1) {
                        cookie_end = allcookies.length;
                    }
                    value = unescape(allcookies.substring(cookie_pos, cookie_end));
                }
                return value;
            }

             function total(j){
                var allcookies = document.cookie;
                var totalquantity = 0;
                var totalprice = 0;
                if (allcookies != ""){
                        var eachcookie = allcookies.split(";");//得到一个数组
                        for(var i = 0; i < eachcookie.length ;i++){
                                    var temp = unescape(eachcookie[i].split("=")[1]).split(";");
                                    totalquantity += parseInt(temp[0].split(":")[1]);
                                    totalprice +=parseInt(temp[0].split(":")[1])*temp[1].split(":")[1];
                        }
                 }
               document.all["totalprice"].innerText="￥" + totalprice;
               document.all["simpleCart_quantity"].innerText = totalquantity;
               if (j == 1) {
               	document.all["totals"].innerText = "总价：￥" + totalprice;
               }
               
             }
             
            function emptycart(){
                var allcookies = document.cookie;
                if(allcookies != ""){
                        var eachcookie = allcookies.split(";");
                        for(var i = 0; i <eachcookie.length;i++){
                        //cookiename前几位为YumiYumi_cart的cookie 将过期时间设为过去的某一时间。
                        var cookiename = eachcookie[i].split("=")[0];
                        if(cookiename.indexOf("yumiyumi_cart") != -1) {
                                    var date = new Date(); 
                                    date.setTime(date.getTime() - 10000); 
                                    setCookie(cookiename , null, date.toGMTString());
                                    } 
                       }
                        total();
                }
             } 

             function loadcart(){
                total();
             }

