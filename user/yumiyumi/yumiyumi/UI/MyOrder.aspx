<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="yumiyumi.UI.MyOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>本桌订单</title>
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
        function cancleOrder(env) {
            var id = (env.getAttribute("id"));
            alert("单机按钮" + id);

            $.ajax({
                type: 'get',
                url: 'CancleOrder.ashx?order_id=' + id,
                async: true,
                success: function (result) {
                    alert(result);
                    self.location.reload();
                },
                error: function () {
                    alert("请求失败，请重新尝试");
                    setContainer('ERROR!');
                }
            });
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
							<li><a href="login2.aspx">登录</a></li>
							<li><a href=" contact.aspx">联系我们</a></li>
                            <li><a href=" CallService.aspx">呼叫服务</a></li>
                            <li  class="active"><a href=" MyOrder.aspx">订单查询</a></li>
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
							<p><a href="javascript:;" onclick="emptyCart();" class="simpleCart_empty">empty card</a></p>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
					<div class="clearfix"> </div>
			</div>
	</div>
<!-- header -->
    <div class="contact">
	 <div class="container">
         <!-- 显示呼叫状态 -->
                     <div class="block">
                            <div class="head orange">                                
                                <h2>我的订单</h2>
                            </div>
                            <div class="data-fluid">
                                <table cellpadding="0" cellspacing="0" width="100%" class="table lcnp">
                                    <thead>
                                        <tr>
                                            <th width="16"></th>                                        
                                            <th>桌号</th>
                                            <th></th>
                                            <th>点单情况</th>
                                            <th>点单时间</th> 
                                            <th>支付情况</th>  
                                            <th>价格</th>                      
                                            <th width="78">状态</th>
                                            <th width="78">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%=orderPart %>
                                                                       
                                    </tbody>
                                </table>
                            </div>                            
                        </div>  	
         <p>合计：￥<%=total_price %></p> 
     </div>
    </div>


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
