<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="offical.aspx.cs" Inherits="offical.UI.offical" %>

<!DOCTYPE HTML>
<html>
<head>
<title>商家服务</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }>
</script>
<meta name="keywords" content="We Photography Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->
<link href='http://fonts.useso.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

<!--模态窗口 -->
  <link rel="stylesheet" type="text/css" media="all" href="css/style2.css">
  <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/sendtodatabase.js"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function ($) {
	        $(".scroll").click(function (event) {
	            event.preventDefault();
	            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
	        });
	    });

	    function login() {
	        alert("单机按钮");
	        var text = document.getElementById("messageBox").value;
	        document.getElementById("messageBox").value = "";
	        alert("单机按钮");
	        $.ajax({
	            type: 'get',
	            url: 'addMessage.ashx?content=' + text,
	            async: true,
	            success: function (result) {
	                self.location.reload();
	            },
	            error: function () {
	                alert("请求失败，请重新尝试");
	                setContainer('ERROR!');
	            }
	        });
	    }

	    function oneMonth() {
	        alert("单机按钮");
	        var text = document.getElementById("messageBox").value;
	        document.getElementById("messageBox").value = "";
	        alert("单机按钮");
	        $.ajax({
	            type: 'get',
	            url: 'addMessage.ashx?content=' + text,
	            async: true,
	            success: function (result) {
	                self.location.reload();
	            },
	            error: function () {
	                alert("请求失败，请重新尝试");
	                setContainer('ERROR!');
	            }
	        });
	    }

	    function oneYear() {
	    }

	    function oneMonthPro() {
	    }
	</script>
<!-- //end-smoth-scrolling -->
</head>
<body>
<!--header start here-->
<div class="header">
    <div class="container">
       	  <div class="header-main">
			<div class="logo">
				<a href="index.html"> <img style="width:150px;"src="images/logo.png" alt=""/> </a>
			</div>
			<div class="top-nav">
				<span class="menu"> <img src="images/icon.png" alt=""/></span>
			<nav class="cl-effect-1">	
				<ul class="res">
					    <li><a href="#" class="scroll"> <span data-hover="Home">介绍</span></a></li>
						<li><a href="#About" class="scroll"> <span data-hover="About">关于我们</span></a></li>
						<li><a href="#Services" class="scroll"> <span data-hover="Services">服务介绍</span></a></li>
						<li><a href="#Work" class="scroll"> <span data-hover="Work">用户展示</span></a></li>
						<li><a href="#Pricing" class="scroll"> <span data-hover="Pricing">购买</span></a></li>
						<li><a href="#Contact" class="scroll"> <span data-hover="Contact">联系我们</span></a></li>
				</ul>
			</nav>

				<!-- script-for-menu -->
							 <script>
							     $("span.menu").click(function () {
							         $("ul.res").slideToggle(300, function () {
							             // Animation complete.
							         });
							     });
							</script>
			<!-- /script-for-menu -->
			</div>
			<div class="clearfix"> </div>
	 	</div>
	 </div>
</div>
<div class="banner">
  <div class="container">
	 <div class="banner-main" id="home">
		 <div class="bann-right">
		 	<h1>电子商务订餐平台</h1>
		 	<h2>创新</h2>
		 	<p>开创新型订餐平台</p>
		 	<img style="width:200px"src="images/logo2.png" alt=""/>
		 </div>
		<div class="clearfix"> </div>
    </div>
  </div>
</div>
<!--header end here-->	
<!--about start here-->
<div class="about" id="About">
	<div class="container">
		<div class="about-main">
			<div class="col-md-3 about-left">
				
			</div>
			<div class="col-md-9 about-right">
		  <div class="about-top">
			<h3>关于</h3>
			<h5>市场调研</h5>
			<ul>
				<li><p> Yumiyumi食谱将本着“合作，互利，多赢”的原则，和众多企业如腾讯、其他软件公司、室内定位企业等展开合作，在实现多方共赢的同时完善业务模式，拓展业务经营范围，为餐饮行业建立包括电子菜单在内的产业链。
  yumiyumi食谱将本着“追求卓越，持续创新”的理念，在yumiyumi食谱日益成熟的时候，在电子菜单的功能模块、商业模式和业务范围方面不断进行拓展，致力于让yumiyumi食谱带来最大的社会效益。
  Yumiyumi食谱将本着“取之于社会，用之于社会”的理想，以解决社会就业、带动经济发展为己任，积极从事慈善活动，将企业赚取的财富回馈于社会。
  Yumiyumi食谱将本着促进电子菜单市场自由竞争、促进小微企业发展的原则，微电子菜单行业注入新鲜的血液。
</p></li>
			</ul>
		 </div>
		
	  </div>
   <div class="clearfix"> </div>
	   </div>
    </div>
</div>
<!--about end here-->
<!--services start here-->
<div class="services" id="Services">
	<div class="container">
		<div class="services-main">
			<div class="ser-top">
				<h3>相关服务</h3>
				<h4>介绍</h4>
			</div>
			<div class="ser-bottom">
			  <div class="ser-grid">
				  <div class="col-md-8 ser-left">
					<h5>服务一·菜单定制</h5>
					<p>  初期Yumiyumi食谱是现有电子菜单的延伸，主要由基于安卓平板的基础菜单、基于windows的后台软件和网页版网上购物商城。
  初期yumiyumi食谱的优点在于：已经形成了餐厅定位系统的这个构想，能够大大提高餐厅服务效率，节约劳动成本，向餐厅实现实现电子化和向物联网迈进提供了一条思路；形成了网上购物商城的概念，利用分模块购买降低餐厅成本、组建一个规范的电子菜单买卖平台推进电子菜单行业的发展。
  在对市场进行进一步的调查后我们发现，基于安卓平板的电子菜单并不能够摆脱电子菜单前期对平板电脑投入过多这个问题，不能解决餐厅使用电子菜单的最大顾忌——前期对固定资产投入太多，经营风险过高。同时，餐厅需要运用到室内定位技术，对精确度要求很高，如何与相关企业取得业务往来的机会成了我们需要解决的头等问题。然而，团队一开始经营规模小，不论是技术实力还是资金实力方面都极为有限，攻克技术难题已经成为了一个大问题，在这种情况下想要取得相关企业的技术难上加难。
</p>
				   </div>
				   <div class="col-md-4 ser-right">
				   	<img src="images/bike.png" alt=""/>
				   </div>
			     <div class="clearfix"> </div>
			  </div>
			  <div class="ser-grid">
				  <div class="col-md-4 ser-left wlta">
					<img src="images/dotts.png" alt=""/>
				   </div>
				   <div class="col-md-8 ser-right wltatext">
				   	 <h5>服务二·路径绘制</h5>
				   	 <p> 按照客户的呼叫服务归类并按照时间的先后顺序为服务员绘制服务路径。</p>
				   </div>
			     <div class="clearfix"> </div>
			  </div>
			  <div class="ser-grid">
				  <div class="col-md-8 ser-left">
					<h5>服务三 餐厅定位系统</h5>
					<p>与网页电子菜单不同，餐厅定位系统分为两部分，一部分的使用者是去餐厅用餐的顾客，购买者是餐厅，我们姑且称之为客户端，另一部分的使用者是餐厅管理者，购买者也是餐厅，我们姑且称之为服务端。客户端和服务端必须同时购买，餐厅定位系统功能才能够使用。在餐厅购买定位系统之后，扫描二维码跳转出的网页电子菜单将包括客户端的内容。服务端的内容在餐厅主机上以电脑版软件终端的形式显示。</p>
				   </div>
				   <div class="col-md-4 ser-right">
				   	<img src="images/wedding.png" alt=""/>
				   </div>
			     <div class="clearfix"> </div>
			  </div>
			  <div class="clearfix"> </div>
		   </div>
		   <div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--services end here-->
<!--portfolio start here-->
<link rel="stylesheet" href="css/swipebox.css">
	<script src="js/jquery.swipebox.min.js"> </script> 
	    <script type="text/javascript">
	        jQuery(function ($) {
	            $(".swipebox").swipebox();
	        });
</script>

<div class="gallery" id="Work">
	<!--	<div class="portfolio-main">
			<div class="port-folio-top">
				<h3>我们的用户</h3>
				<h4>用户。。。</h4>
			</div>
			<div class="port-folio-bottom">
					<div id="portfoliolist">
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p1.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p1.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  		</div></a>
		                </div>				
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p3.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p3.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  	 </div></a>
		                </div>
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p2.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p2.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  	 </div></a>
		                </div>				
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p4.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p4.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  	 </div></a>
		                </div>
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p5.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p5.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  	 </div></a>
		                </div>
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p6.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p6.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  	 </div></a>
		                </div>	
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p7.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p7.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  	 </div></a>
		                </div>	
						<div class="col-md-3 portfolio-wrapper">		
							<a href="images/b-p8.jpg" class="b-link-stripe b-animate-go  swipebox"  title="Image Title">
						     <img src="images/p8.jpg" alt=""><div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03"><img src="images/plus.png" alt=""/></h2>
						  	 </div></a>
		                </div>	
					<div class="clearfix"> </div>
			</div>
		  <div class="clearfix"> </div>
		 
		  <span class="port-line"> </span>-->
	</div>
  </div>
</div>
<!--portfolio end here-->
<!--happy start here-->
<script src="js/responsiveslides.min.js"></script>
 <script>
     // You can also use "$(window).load(function() {"
     $(function () {
         $("#slider").responsiveSlides({
             auto: true,
             manualControls: '#slider3-pager',
         });
     });
  </script>
<div class="happy">
	<div class="container">
		<div class="happy-main">
			<div class="happy-top">
				<h3>我们的用户</h3>
				<h4>我们的用户遍及天南海北</h4>
			</div>
			<div class="happy-bottom">
				 <div class="slider">
	    <!-- Slideshow 3 -->
	    <ul class="rslides" id="slider">
	      <li><p> Yumiyumi食谱将本着“合作，互利，多赢”的原则，和众多企业如腾讯、其他软件公司、室内定位企业等展开合作，在实现多方共赢的同时完善业务模式，拓展业务经营范围，为餐饮行业建立包括电子菜单在内的产业链。
  yumiyumi食谱将本着“追求卓越，持续创新”的理念，在yumiyumi食谱日益成熟的时候，在电子菜单的功能模块、商业模式和业务范围方面不断进行拓展，致力于让yumiyumi食谱带来最大的社会效益。</p></li>
	      <li><p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore  vitae dicta sunt explicabo."</p></li>
	      <li><p>"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire."</p></li>
	      <li><p>"These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best."</p></li>
	    </ul>
	    <!-- Slideshow 3 Pager -->
	    <ul id="slider3-pager">
	      <li><a href="#"><img src="images/sli1.png" alt=""></a></li>
	      <li><a href="#"><img src="images/sli2.png" alt=""></a></li>
	      <li><a href="#"><img src="images/sli3.png" alt=""></a></li>
	      <li><a href="#"><img src="images/sli4.png" alt=""></a></li>
	    </ul>
    </div>
		  <div class="clearfix"> </div>
		</div>
	</div>
 </div>
</div>
<!--happy end here-->
<!--price start here-->
<div class="price" id="Pricing">
	<div class="container">
		<div class="price-main">
			<div class="price-top">
				<h3>价格</h3>
				<h4>按服务按年？</h4>
			</div>
			
			<div class="price-bottom">
				<div class="col-md-4 order">
				<div class="price-grid">
					<h3>基础服务</h3>
					<span class="price-line"> </span>
					<ul>
						<li><a href="#"><i> </i>包括什么什么什么</a></li>
					</ul>
						<h4>1个月</h4>
						<h5>￥10</h5>
						<span class="pricebott-line"> </span>
						<h6>选择</h6>
				</div>
				</div>
				<div class="col-md-4 order">
				<div class="price-grid" onclick="postMessage()">
					<h3>餐厅定位服务</h3>
					<span class="price-line"> </span>
					<ul>
						<li><a href="#"><i> </i>餐厅定位功能</a></li>
					</ul>
						<h4>1个月</h4>
						<h5>￥5</h5>
						<span class="pricebott-line"> </span>
						<h6>选择</h6>
				</div>
				</div>
				<div class="col-md-4 order no-mar">
				<div class="price-grid">
					<h3>路径选择服务</h3>
					<span class="price-line"> </span>
					<ul>
						<li><a href="#"><i> </i>路径选择功能</a></li>
					</ul>
						<h4>1个月</h4>
						<h5>￥7</h5>
						<span class="pricebott-line"> </span>
						<h6>选择</h6>
				</div>
				</div>

                <a href="#loginmodal" class="flatbtn" id="modaltrigger">Modal Login</a>
	  <div id="loginmodal" style="display:none;">
    <h1>User Login</h1>
    <form runat="server" id="loginform" name="loginform" method="post" action="">
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" class="txtfield" tabindex="1">
      
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" class="txtfield" tabindex="2">
      
      <div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="Log In" tabindex="3"></div>
    </form>
  </div>
<script type="text/javascript">
			    $(function () {

			        $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
			    });
</script>	
				<div class="clearfix"> </div>
			</div>
		
			<p>如果您有需要的服务我们没有请在下表中联系我们，一经采纳，我们将为您免费提供该服务一年的使用权。</p>
		 
		</div>
	</div>
</div>

<!--price end here-->
<!--contact start here-->
<div class="contact" id="Contact">
   <div class="contact-bg">
	<div class="container">
		<div class="contact-main">
			 <div class="contact-top">
			 	<h3>联系我们</h3>
			 	<P>如果您有任何的建议请联系我们。</P>
			 </div>
			 <div class="contact-bottom">
			 	<form>
			 		<input id="myname" type="text" value="姓名" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '姓名';}">
			 		<input id="mymail" type="text" value="电子邮件" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '电子邮件';}">
			 		<input id="title" type="text" class="no-mar" value="标题" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '标题';}">
			 		<textarea id="message" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '信息';}">信息</textarea>
			 		<div class="con-send">
			 		<input onclick="res();" type="submit"  value="发送"/>
			 		</div>
			 	</form>
			 </div>
		  <div class="clearfix"> </div>
		</div>
	</div>
   </div>
</div>
<!--contact end here-->
<!--footer start here-->
<div class="footer">
	<div class="container">
		<div class="footer-main">
		    <div class="footer-left">
			   <a href="#"><img style="width: 200px" src="images/logo2.png" alt=""/></a>
			</div>
		</div>
		<script type="text/javascript">
		    $(document).ready(function () {
		        /*
                var defaults = {
                    containerID: 'toTop', // fading element id
                    containerHoverID: 'toTopHover', // fading element hover id
                    scrollSpeed: 1200,
                    easingType: 'linear' 
                };
                */

		        $().UItoTop({ easingType: 'easeOutQuart' });

		    });
									</script>
						<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
</div>
<!--footer end here-->
</body>
</html>