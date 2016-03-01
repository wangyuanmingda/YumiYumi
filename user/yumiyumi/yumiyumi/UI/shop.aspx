<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="yumiyumi.UI.orders" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>YumiYumi食谱</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Spicemystery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,700' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script src="js/simpleCart.min.js"> </script>	
<script language=javascript>
    function addtocart(env) {
                var id = (env.getAttribute("id"));
                id = id.substr(1);
                var sd = getCookie("yumiyumi_cart" + id);
                if (sd == null) {
                    setCookie("yumiyumi_cart" + id, 1, "3600")
                } else {
                    setCookie("yumiyumi_cart" + id, parseInt(sd) + 1, "3600");
                }
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
</script>	
</head>
<body>
<!-- header -->
<div class="head-top">
			
		</div>
	<div class="header">
		
		<div class="container">
			<div class="logo">
				<a href="index2.aspx"><img src="images/logo.png" class="img-responsive" alt=""></a>
			</div>
			<div class="header-left">
				<div class="head-nav">
					<span class="menu"> </span>
						<ul>
							<li><a href="index2.aspx">主页</a></li>
							<li><a href=" restaurants.aspx">餐厅</a></li>
							<li class="active"><a href="login2.aspx">登录</a></li>
							<li><a href=" contact.aspx">联系我们</a></li>
                            <li><a href=" CallService.aspx">呼叫服务</a></li>
                            <li><a href=" MyOrder.aspx">订单查询</a></li>
								<div class="clearfix"> </div>		
						</ul>
								<!-- script-for-nav -->
							<script>
							    $("span.menu").click(function () {
							        $(".head-nav ul").slideToggle(300, function () {
							            // Animation complete.
							        });
							    });
							</script>
						<!-- script-for-nav --> 
					</div>
					<div class="header-right1">
						<div class="cart box_1">
							<a href="checkout.aspx">
								<h3> <span class="simpleCart_total">$0.00</span> (<span id="simpleCart_quantity" class="simpleCart_quantity">0</span> items)<img src="images/bag.png" alt=""></h3>
							</a>	
							<p><a href="javascript:;" class="simpleCart_empty">empty card</a></p>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
					<div class="clearfix"> </div>
			</div>
	</div>
<!-- header -->
<!-- about -->
<div class="orders">
	<div class="container">
        <%=restaurantName %>
	    <%=dishList %>
	</div>
</div>
<!-- about -->	
<!-- footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-left">
				<p>Copyrights © 2015 All rights reserved | Design by YumiYumi</p>
			</div>
			<div class="footer-right">
				<ul>
					<li><a href="#"><i class="fbk"></i></a></li>
					<li><a href="#"><i class="googpl"></i></a></li>
					<li><a href="#"><i class="link"></i></a></li>
					<li><a href="#"><i class="rss"></i></a></li>
					<li><a href="#"><i class="twt"></i></a></li>
				</ul>
			</div>	
				<div class="clearfix"></div>
		</div>
	</div>
<!-- footer-->	
</body>
</html>