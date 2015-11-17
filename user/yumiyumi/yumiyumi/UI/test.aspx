<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="yumiyumi.UI.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <script language=javascript>
            function query() {
                alert("hehe");
                var form1 = document.getElementById("form1");
                form1.action = "restaurant.aspx?id=1";
                form1.submit();
            }

            function update() {
                form1.action = "restaurant.aspx";
                form1.submit();
            }
            function addtocart(env) {
                var id = (env.getAttribute("id"));
                var sd = getCookie("yumiyumi_cart" + id);
                if (sd == null) {
                    alert(6);
                    setCookie("yumiyumi_cart" + id, 1, "3600")
                } else {
                    setCookie("yumiyumi_cart" + id, parseInt(sd)+1, "3600");
                }
                alert(id + " " + sd);
            }
            function setCookie(cookieName, cookieValue, cookieExpires) {
                cookieValue = escape(cookieValue);//编码latin-1  
                if (cookieExpires == "") {
                    var nowDate = new Date();
                    nowDate.setMonth(nowDate.getMonth() + 6);
                    cookieExpires = nowDate.toGMTString();
                }
                document.cookie = cookieName + "=" + cookieValue + ";expires=" + cookieExpires;
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
</script>
</head>
<body>
    <form id="form1" runat="server" action="#">
    <div>
       
    </div>
    </form>
    <span  id="wqdq" onclick="addtocart(this)"><a class="morebtn hvr-rectangle-in" href="#">Add to cart</a></span>
</body>
</html>
