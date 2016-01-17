<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order_list.aspx.cs" Inherits="waiterPlatform.UI.order_list" %>

<!DOCTYPE html>
<html lang="en">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />    
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
    <![endif]-->                
    <title>OrderList </title>
    <link rel="icon" type="image/ico" href="favicon.ico"/>
    
    <link href="css/stylesheets.css" rel="stylesheet" type="text/css" />
    <!--[if lte IE 7]>
        <link href="css/ie.css" rel="stylesheet" type="text/css" />
        <script type='text/javascript' src='js/plugins/other/lte-ie7.js'></script>
    <![endif]-->    
    <script type='text/javascript' src='js/plugins/jquery/jquery-1.9.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/jquery-migrate-1.1.1.min.js'></script>
    <script type='text/javascript' src='js/plugins/jquery/globalize.js'></script>
    <script type='text/javascript' src='js/plugins/other/excanvas.js'></script>
    
    <script type='text/javascript' src='js/plugins/other/jquery.mousewheel.min.js'></script>
        
    <script type='text/javascript' src='js/plugins/bootstrap/bootstrap.min.js'></script>            
    
    <script type='text/javascript' src='js/plugins/cookies/jquery.cookies.2.2.0.min.js'></script>
    
    <script type='text/javascript' src="js/plugins/uniform/jquery.uniform.min.js"></script>
    
    <script type='text/javascript' src='js/plugins/shbrush/XRegExp.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shCore.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushXml.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushJScript.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushCss.js'></script>    
    
    <script type='text/javascript' src='js/plugins/fancybox/jquery.fancybox.pack.js'></script>
    
    <script type='text/javascript' src='js/plugins.js'></script>
    <script type='text/javascript' src='js/charts.js'></script>
    <script type='text/javascript' src='js/actions.js'></script>
    
</head>
<body>    
    <div id="loader"><img src="img/loader.gif"/></div>
    <div class="wrapper">
        
         <div class="sidebar">
                    <div class="top">
                <a href="index.html" class="logo"><img src="../img/logo.jpg" /></a>
                <div class="search">
                    <div class="input-prepend">
                        <span class="add-on orange"><span class="icon-search icon-white"></span></span>
                        <input type="text" placeholder="search..."/>                                                      
                    </div>            
                </div>
            </div>
            <div class="nContainer">                
                <ul class="navigation">         
                    <li class="active"><a href="index.html" class="blblue">当前店面呼叫信息</a></li>
                    <li>
                        <a href="#" class="blyellow">餐厅信息</a>
                        <div class="open"></div>
                        <ul>
                            <li><a href="add_restaurant.html">编辑餐厅信息</a></li>
                            <li><a href="restaurant_list.html">餐厅列表</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="blgreen">菜单信息</a>
                        <div class="open"></div>
                        <ul>
                            <li><a href="add_menu.html">增加菜单</a></li>
                            <li><a href="menu_list.html">菜单列表</a></li>
                            
                        </ul>
                    </li>
                   
                </ul>
                <a class="close">
                    <span class="ico-remove"></span>
                </a>
            </div>
            <div class="widget">
                <div class="datepicker"></div>
            </div>
            
        </div>
        
        <div class="body">
            
             <ul class="navigation">
                     
                <li>
                    <div class="user">
                        <img src="img/examples/users/dmitry_m.jpg" align="left"/>
                        <a href="#" class="name">
                            <span>Dmitry Ivaniuk</span>
                            <span class="sm">Administrator</span>
                        </a>
                    </div>
                   
                </li>               
            </ul>
            
            <div class="content">
                
                <div class="page-header">
                    <div class="icon">                        
                        <span class="ico-pictures"></span>
                    </div>
                    <h1>菜单 <small><%=userId %>></small></h1>
                    <h2 style="float:right;"><small>总价:2340rmb</small>&nbsp;<small>数量：12道</small></h2>
                </div>
                          
                <div class="row-fluid">
                    
                    <div class="span12">
                        <div class="block">
                            <div class="head">
                            <div class="data-fluid thumbs">
                               <%=orderList%>                       
                                
                            </div>
                        </div>
                        
                    </div>                    
                </div>
                
            </div>
            
        </div>
        
    </div>
    <div class="dialog" id="source" style="display: none;" title="Source"></div>    
</body>
</html>
