<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="yumiyumi.UI.login" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Spicemystery a Hotel and Resturant Category Flat Bootstarp Responsive Website Template | Login :: w3layouts</title>
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
</head>
<body>
<!-- header -->
<div class="head-top">
			
		</div>
	<div class="header">
		
		<div class="container">
			<div class="logo">
				<a href="index.aspx"><img src="images/logo.png" class="img-responsive" alt=""></a>
			</div>
			<div class="header-left">
				<div class="head-nav">
					<span class="menu"> </span>
						<ul>
							<li><a href="index.aspx">主页</a></li>
							<li><a href="restaurants.aspx">餐厅</a></li>
							<li class="active"><a href=" login.aspx">登录</a></li>
							<li><a href=" contact.aspx">联系我们</a></li>
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
							<a href="checkout.html">
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
<!-- register -->
    
	<div class="login-page">
		<div class="container">
			<div class="account_grid">
				<div class="col-md-6 login-left wow fadeInLeft" data-wow-delay="0.4s">
					<h3>新用户</h3>
					<p>创建账户使用我们的服务。</p>
					<a class="acount-btn" href="register.aspx">创建账户</a>
			   </div>
			   <div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
					<h3>已注册用户</h3>
					<p>已注册用户请直接登录。</p>
					<form runat="server" action="" method="post">
						<div>
							<span>邮箱地址<label>*</label></span>
							<input name="txtEmail" type="text"> 
						</div>
						<div>
							<span>密码<label>*</label></span>
							<input name="txtPwd" type="password"> 
						</div>
						<a class="forgot" href="#">忘记密码？</a>
						<input type="submit" value="登录">
					</form>
			   </div>	
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>

<!-- register -->	
<!-- footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-left">
				<p>Copyrights © 2015  All rights reserved | Design by </p>
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
