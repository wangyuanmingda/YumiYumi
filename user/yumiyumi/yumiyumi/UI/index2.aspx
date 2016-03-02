<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index2.aspx.cs" Inherits="yumiyumi.UI.index" %>

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
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/yumiyumi.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<script src="js/simpleCart.min.js"> </script>
    <script language=javascript>
        function query() {
            var form1 = document.getElementById("form1");
            var select = document.getElementById("country");
            var day = select.selectedIndex;
            var content = document.getElementById("search_text").value;
            if (content == "Resturant Name") {
                form1.action = "restaurants.aspx?city_id=" + day ;
            } else {
                form1.action = "restaurants.aspx?city_id=" + day + "&search=" + content;
            }
            form1.method = "post";
            form1.submit();
        }
 
        function update(){
            form.action = "restaurant.aspx";
            form.submit();
        }
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
							<li class="active"><a href="index2.aspx">主页</a></li>
							<li><a href=" restaurants.aspx">餐厅</a></li>
							<li><a href="login2.aspx">登录</a></li>
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
								<h3> <span class="simpleCart_total"> $0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span> items)<img src="images/bag.png" alt=""></h3>
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
<!-- banner -->
	<div class="banner">
		<div class="container">
		<div class="b_room">
				<div class="booking_room"><br />
					<div class="reservation">
						<div class="book-top">
							<div class="b-search">
								<div class="boo-lef">
								<i class="sear"></i>
								<p>搜索</p>
								</div>
							</div>
							<div class="pick">
								<div class="boo-lef">
								<i class="sele"></i>
								<p>选择</p>
								</div>
							</div>
							<div class="delv">
								<div class="boo-lef">
								<i class="ca-r"></i>
								<p>购买</p>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
						<ul>
							<li class="span1_of_1">
								 <!----------start section_room----------->
								 <form>
									<input id="search_text" type="text" class="textbox" value="餐厅名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Resturant Name';}">
								</form>
							 </li>	
							<li class="span1_of_1">
								 <!----------start section_room----------->
								 <div class="section_room">
									  <select id="country" onchange="change_country(this.value)" class="frm-field required">
											<option value="1">请输入城市</option>
											<option value="2">上海</option>         
											<option value="3">北京</option>
											<option value="4">深圳</option>
									  </select>
								 </div>	
							 </li>				  
							 <li class="span1_of_3">
									<div class="date_btn">
										<form id="form1" runat="server" action="#" method="get">
											<input type="submit" onclick="query()" value="查找餐厅">
										</form>
									</div>
							 </li>
								<div class="clearfix"></div>
						</ul>
					</div>
				</div>	
			</div>
	</div>
	</div>
<!-- banner -->	
<!-- latis -->	
	<div class="latis">
		<div class="container">
		<div class="col-md-4 latis-left">
			<h3>肉夹馍</h3>
			<img src="images/4.jpg" class="img-responsive" alt="">
			<div class="special-info grid_1 simpleCart_shelfItem">
				<p>Cum sociis natodiculus mus.rhoncus egestas ac sit </p>
				<div class="cur">
					<div class="cur-left">
						<div class="item_add"><span id="a1" onclick="addtocart(this)"  class="item_price"><a class="morebtn hvr-rectangle-in" href="#">加入菜单</a></span></div>
					</div>
					<div class="cur-right">
						<div class="item_add"><span class="item_price"><h6>only $45.00</h6></span></div>
					</div>
						<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="col-md-4 latis-left">
			<h3>肉卷饼</h3>
			<img src="images/1.jpg" class="img-responsive" alt="">
			<div class="special-info grid_1 simpleCart_shelfItem">
				<p>Cum sociis natodiculus mus.rhoncus egestas ac sit </p>
				<div class="cur">
					<div class="cur-left">
						<div class="item_add"><span id="a2" onclick="addtocart(this)" class="item_price"><a class="morebtn hvr-rectangle-in" href="#">加入菜单</a></span></div>
					</div>
					<div class="cur-right">
						<div class="item_add"><span class="item_price"><h6>only $55.00</h6></span></div>
					</div>
						<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="col-md-4 latis-left">
			<h3>老鸭粉丝汤</h3>
			<img src="images/3.jpg" class="img-responsive" alt="">
			<div class="special-info grid_1 simpleCart_shelfItem">
				<p>Cum sociis natodiculus mus.rhoncus egestas ac sit </p>
				<div class="cur">
					<div class="cur-left">
						<div class="item_add"><span id="a3" onclick="addtocart(this)" class="item_price"><a class="morebtn hvr-rectangle-in" href="#">加入菜单</a></span></div>
					</div>
					<div class="cur-right">
						<div class="item_add"><span class="item_price"><h6>only $65.00</h6></span></div>
					</div>
						<div class="clearfix"> </div>
				</div>
			</div>
		</div>
			<div class="clearfix"> </div>
			
				
	</div>
	</div>
<!-- latis -->	
<!-- feature -->
<div class="feature">
		<div class="container">
			<div class="fle-xsel">
				<ul id="flexiselDemo3">
					<li>
							
									<img src="images/1p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/2p.jpg" class="img-responsive" alt="">		
								
					</li>			
					<li>
							
									<img src="images/3p.png" class="img-responsive" alt="">		
								
					</li>		
					<li>
							
									<img src="images/4p.jpg" class="img-responsive" alt="">		
								
									
					</li>
					<li>
							
									<img src="images/5p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/6p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/7p.jpg" class="img-responsive" alt="">		
								
					</li>
					<li>
							
									<img src="images/8p.jpg" class="img-responsive" alt="">		
								
					</li>
									
				</ul>
							
							 <script type="text/javascript">
							     $(window).load(function () {

							         $("#flexiselDemo3").flexisel({
							             visibleItems: 8,
							             animationSpeed: 1000,
							             autoPlay: true,
							             autoPlaySpeed: 3000,
							             pauseOnHover: true,
							             enableResponsiveBreakpoints: true,
							             responsiveBreakpoints: {
							                 portrait: {
							                     changePoint: 480,
							                     visibleItems: 2
							                 },
							                 landscape: {
							                     changePoint: 640,
							                     visibleItems: 3
							                 },
							                 tablet: {
							                     changePoint: 768,
							                     visibleItems: 3
							                 }
							             }
							         });

							     });
								</script>
								<script type="text/javascript" src="js/jquery.flexisel.js"></script>
					<div class="clearfix"> </div>
				
			</div>
		</div>
	</div>
<!-- feature -->
<!-- magnust -->	
	<div class="magnust">
		<div class="container">
			<h3>Nascetur ridiculus mus</h3>
		<div class="col-md-4 magnust-top">
			
			<div class="magnust-left">
				<img src="images/9b.jpg" class="img-responsive" alt="">	
			</div>
			<div class="magnust-right">
				<h4><a href="#">Cites of the</a></h4>
				<p> Lorem Ipsum passage, and going through the cites of the undoubtable source. Lorem sections</p>
				<a class="see" href="#">See More</a>
			</div>
				<div class="clearfix"> </div>
		</div>
		<div class="col-md-4 magnust-top">
			<div class="magnust-left">
				<img src="images/8b.jpg" class="img-responsive" alt="">	
			</div>
			<div class="magnust-right">
				<h4><a href="#">Lorem Ipsum</a></h4>
				<p> Lorem Ipsum passage, and going through the cites of the undoubtable source. Lorem sections</p>
				<a class="see" href="#">See More</a>
			</div>
				<div class="clearfix"> </div>
		</div>
		<div class="col-md-4 magnust-top">
			<div class="magnust-left">
				<img src="images/10b.jpg" class="img-responsive" alt="">	
			</div>
			<div class="magnust-right">
				<h4><a href="#">Will uncove</a></h4>
				<p> Lorem Ipsum passage, and going through the cites of the undoubtable source. Lorem sections</p>
				<a class="see" href="#">See More</a>
			</div>
				<div class="clearfix"> </div>
		</div>
			<div class="clearfix"> </div>
	</div>
	</div>
<!-- magnust -->	
<!-- footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-left">
				<p>Copyrights 2015 All rights reserved | Design by </p>
			</div>
				<div class="clearfix"></div>
		</div>
	</div>
<!-- footer-->	
</body>
</html>