﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="yumiyumi.UI.checkout" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>YumiYumi</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Spicemystery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,700' rel='stylesheet' type='text/css'>
<script src="js/simple.js"></script>
<script src="js/jquery.min.js"></script>
    <script src="js/jquery.cookie.js"> </script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	
</head>
<body onload="loadcart()">
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
							<li ><a href="index2.aspx">主页</a></li>
							<li><a href=" restaurants.aspx">餐厅</a></li>
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
								<h3> <span id="totalprice" class="simpleCart_total">$0.00</span> (<span id="simpleCart_quantity" class="simpleCart_quantity">0</span> items)<img src="images/bag.png" alt=""></h3>
							</a>	
							<p><a href="javascript:;" onclick="emptyCart()" class="simpleCart_empty">empty card</a></p>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
					<div class="clearfix"> </div>
			</div>
	</div>
<!-- header -->
<!-- checkout -->
<div class="cart-items">
	<div class="container">
			 <h1>我的购物车 (<%=shopping_count %>)</h1>
             <%=shopping_cart %>		

     
    
            <form id="Form1" action='#' method='post' runat='server'>
     
      <%if (commitOrder == "Temp1")
      { %>
            <asp:Button ID='Button1' OnClick='Unnamed_Click' runat='server' Text='提交订单'/>
            <span style="float:right" id="totals">总计：￥<%=total_price %></span>
     <%}
     else
      { %>
    <%} %>
    </form>
    </div>

</div>

<!-- checkout -->	
<!-- footer-->
	<div class="footer" style="margin-top:100px;">
		<div class="container">
			<div class="footer-left">
				<p>Copyrights © 2015 SpiceMystery All rights reserved | Design by <a href="http://w3layouts.com/">YumiYumi</a></p>
			</div>
				<div class="clearfix"></div>
		</div>
	</div>
<!-- footer-->	
</body>
</html>