﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="waiterPlatform.UI.index" %>

<!DOCTYPE html>
<html lang="en">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />    
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
    <![endif]-->                
    <title>服务员主页</title>
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
    
    <script type='text/javascript' src='js/plugins/jflot/jquery.flot.js'></script>    
    <script type='text/javascript' src='js/plugins/jflot/jquery.flot.stack.js'></script>    
    <script type='text/javascript' src='js/plugins/jflot/jquery.flot.pie.js'></script>
    <script type='text/javascript' src='js/plugins/jflot/jquery.flot.resize.js'></script>
    
    <script type='text/javascript' src='js/plugins/sparklines/jquery.sparkline.min.js'></script>        
    
    <script type='text/javascript' src='js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    
    <script type='text/javascript' src="js/plugins/uniform/jquery.uniform.min.js"></script>
    
    <script type='text/javascript' src='js/plugins/shbrush/XRegExp.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shCore.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushXml.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushJScript.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushCss.js'></script>    
    
    <script type='text/javascript' src='js/plugins.js'></script>
    <script type='text/javascript' src='js/charts.js'></script>
    
    <script type='text/javascript' src='js/actions.js'></script>

    <script language=javascript>
        function postMessage() {
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

        function deleteService(env) {
            var id = (env.getAttribute("id"));
            alert("单机按钮" + id);
            $.ajax({
                type: 'get',
                url: 'deleteService.ashx?serviceId=' + id,
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

        function finishOrder(env) {
            var id = (env.getAttribute("id"));
            alert("单机按钮" + id);
            $.ajax({
                type: 'get',
                url: 'finishOrder.ashx?orderId=' + id,
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
    <!--  模态窗口    -->
    <style type="text/css">
        <!--
        #ap {
        position:absolute;
        z-index:1; left: 400px;
        top: 140px;
        background-color: #DAF5FC;
        border: 1px solid #00CCFF;
        display:none;
        }
        #qp{
        position:absolute;
        z-index:1;
        filter:alpha(opacity=60);
        width:100%;
        height:100%;
        background-color: #eeeeee;
        display:none;
        }
        body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        }
        -->
</style>
    <script language="javascript">
        i = 1;
        function acdiv() {
            qp.style.display = 'block';
            ap.style.display = 'block';
            if (i < 15) {
                i++;
                ap.style.width = 2 * i * i;
                ap.style.height = 1.1 * i * i;
                ap.style.left = 20 * i;
                ap.style.top = 10 * i;
                var timer = setTimeout("acdiv()", 1);
            }

        }
        function closediv() {
            ap.style.display = 'none';
            qp.style.display = 'none';
            i = 0;
        }
    </script>


    <script>
        function strokeRect(env) {
            var id = (env.getAttribute("id"));
            alert("单机按钮" + id);
            //绘制路径
            $.ajax({
                type: 'get',
                url: 'GetPath.ashx?to=' + id,
                async: true,
                success: function (result) {
                   // alert(result);

                    eval(result);

                },
                error: function () {
                    alert("请求失败，请重新尝试");
                    setContainer('ERROR!');
                }
            });
    }
</script>


<script type="text/javascript" src="http://www.websjy.com/club/websjy_index/54/images/websjy.js"></script>
</head>
<body>    
    <div id="loader"><img src="img/loader.gif"/></div>
    <div class="wrapper">
        
        <div class="sidebar">
            
            <div class="top">
                <a href="index.aspx" class="logo"><img src="../UI/img/logo.jpg" /></a>
                <div class="search">
                    <div class="input-prepend">
                        <span class="add-on orange"><span class="icon-search icon-white"></span></span>
                        <input type="text" placeholder="search..."/>                                                      
                    </div>            
                </div>
            </div>
            <div class="nContainer">                
                <ul class="navigation">         
                    <li class="active"><a href="index.aspx" class="blblue">当前店面呼叫信息</a></li>
                    <li class="active"><a href="index2.aspx" class="blblue">用户界面信息</a></li>
                    <li>
                        <a href="#" class="blyellow">餐厅信息</a>
                        <div class="open"></div>
                        <ul>
                            <li><a href="add_restaurant.aspx">编辑餐厅信息</a></li>
                            <li><a href="restaurant_list.aspx">餐厅列表</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="blgreen">菜单信息</a>
                        <div class="open"></div>
                        <ul>
                            <li><a href="add_menu.aspx">增加菜单</a></li>
                            <li><a href="menu_list.aspx">菜单列表</a></li>
                            
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
                        <span class="ico-arrow-right"></span>
                    </div>
                    <h1>当前店面呼叫信息<small>METRO STYLE ADMIN PANEL</small></h1>
                </div>
                <div class="row-fluid">

                </div>
                <div class="row-fluid">
                    
                    <div class="span7">
                        
                      
                        <div class="block">
                            <canvas id="demoCanvas" width="500" height="353"> <p>爷，你还在上个世纪吧，现在都html5了，您还在ie6时代？</p> </canvas>
                            <script type="text/javascript">
                                //通过id获得当前的Canvas对象
                                var canvasDom = document.getElementById("demoCanvas");
                                //通过Canvas Dom对象获取Context的对象
                                var context = canvasDom.getContext("2d");

                                var image = new Image();//创建一张图片

                                image.src = "img/timg.jpg";//设置图片的路径
                                image.onload = function () {//当图片加载完成后
                                    //参数：（1）绘制的图片  （2）坐标x，（3）坐标y
                                    context.drawImage(image, 0, 0);

                                };
                            </script>
                            <div id="qp"></div>
<p></p>
<input type="button" onClick="route();" value="绘制路线" />

                            <div class="head orange">                                
                                <h2>实时呼叫服务</h2>
                                <ul class="buttons">
                                    <li><a href="#" onClick="route(); return false;"><div class="icon"><span class="ico-info"></span></div></a></li>
                                    <li><a href="#" class="ublock"><div class="icon"><span class="ico-undo"></span></div></a></li>
                                    <li><a href="#" class="cblock"><div class="icon"><span class="ico-sort"></span></div></a></li>
                                </ul>
                            </div>
                            <div class="data-fluid">
                                <table cellpadding="0" cellspacing="0" width="100%" class="table lcnp">
                                    <thead>
                                        <tr>
                                            <th width="16"><input type="checkbox" class="checkall"/></th>                                        
                                            <th>桌号</th>
                                            <th>呼叫服务原因</th>
                                            <th>呼叫时间</th> 
                                            <th>状态</th>                       
                                            <th width="78">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%=servicePart %>
                                                                       
                                    </tbody>
                                </table>
                            </div>                            
                        </div>                        
                        
                    </div>
                    <div class="span5">
                        <div class="block">
                            <div class="head">
                                <div class="icon"><span class="ico-tag"></span></div>
                                <h2>实时点单情况</h2>
                                <ul class="buttons">             
                                    <li><a href="#" onClick="source('tickets'); return false;"><div class="icon"><span class="ico-info"></span></div></a></li>
                                    <li><a href="#" class="ublock"><div class="icon"><span class="ico-undo"></span></div></a></li>
                                    <li><a href="#" class="cblock"><div class="icon"><span class="ico-sort"></span></div></a></li>
                                </ul>                                
                            </div>
                            <div class="data-fluid">
                                <table width="100%" class="table tickets">
                                    <%=orderPart %>
                                   
                                </table>
                            </div>                                   
                        </div>                        
                        
                        <div class="block">
                            <div class="head dblue">                                
                                <h2>信息</h2>
                                <ul class="buttons">             
                                    <li><a href="#" onClick="source('messages'); return false;"><div class="icon"><span class="ico-info"></span></div></a></li>
                                    <li><a href="#" class="ublock"><div class="icon"><span class="ico-undo"></span></div></a></li>
                                    <li><a href="#" class="cblock"><div class="icon"><span class="ico-sort"></span></div></a></li>
                                </ul>                                
                            </div>
                            <div class="data dark npr npb">                                
                                <div id="message_list" class="messages scroll" style="height: 200px;">
                                    <%=messagePart %>                                       
                                </div>                                
                            </div>    
                            <div class="toolbar dark">
                                <div class="input-prepend input-append">
                                    <span class="add-on dblue"><span class="icon-envelope icon-white"></span></span>
                                    <input id="messageBox" type="text"/>                              
                                    <button class="btn dblue" type="button" onclick="postMessage()">发送 <span class="icon-arrow-next icon-white"></span></button>
                                </div>                                 
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
