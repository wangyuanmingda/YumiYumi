   function addtocart(env) {
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
               total();
                alert("添加成功");
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

             function total(){
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

