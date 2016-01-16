<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_restaurant.aspx.cs" Inherits="waiterPlatform.UI.add_restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />    
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
    <![endif]-->                
    <title>编辑餐厅信息</title>
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
    
    <script type='text/javascript' src='js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>    
    
    <script type='text/javascript' src="js/plugins/uniform/jquery.uniform.min.js"></script>
    <script type='text/javascript' src="js/plugins/select/select2.min.js"></script>
    <script type='text/javascript' src='js/plugins/tagsinput/jquery.tagsinput.min.js'></script>
    <script type='text/javascript' src='js/plugins/maskedinput/jquery.maskedinput-1.3.min.js'></script>
    <script type='text/javascript' src='js/plugins/multiselect/jquery.multi-select.min.js'></script>

    <script type='text/javascript' src='js/plugins/validationEngine/languages/jquery.validationEngine-en.js'></script>
    <script type='text/javascript' src='js/plugins/validationEngine/jquery.validationEngine.js'></script>    
    
    <script type='text/javascript' src='js/plugins/shbrush/XRegExp.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shCore.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushXml.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushJScript.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushCss.js'></script>    
     
    <script type='text/javascript' src='js/plugins/plupload/plupload.js'></script>
    <script type='text/javascript' src='js/plugins/plupload/plupload.gears.js'></script>
    <script type='text/javascript' src='js/plugins/plupload/plupload.silverlight.js'></script>
    <script type='text/javascript' src='js/plugins/plupload/plupload.flash.js'></script>
    <script type='text/javascript' src='js/plugins/plupload/plupload.browserplus.js'></script>
    <script type='text/javascript' src='js/plugins/plupload/plupload.html4.js'></script>
    <script type='text/javascript' src='js/plugins/plupload/plupload.html5.js'></script>
    <script type='text/javascript' src='js/plugins/plupload/jquery.plupload.queue/jquery.plupload.queue.js'></script> 
    <script type='text/javascript' src='js/plugins.js'></script>
    <script type='text/javascript' src='js/charts.js'></script>
    <script type='text/javascript' src='js/actions.js'></script>
    
</head>
<body>    
    <div id="loader"><img src="img/loader.gif"/></div>
    <div class="wrapper">
        
        <div class="sidebar">
            
                  <div class="top">
                <a href="index.html" class="logo"></a>
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
                        <span class="ico-ok"></span>
                    </div>
                    <h1>编辑餐厅<small>查看已有餐厅列表</small></h1>
                </div>
                
                <div class="row-fluid">

                    <div class="span8">                

                        <div class="block">
                            <div class="head">                                
                                <h2>餐厅信息</h2>
                                <ul class="buttons">             
                                    <li><a href="#" onClick="source('form_validation'); return false;"><div class="icon"><span class="ico-info"></span></div></a></li>
                                </ul>                                
                            </div>                                               
                            <form id="validate" method="POST" action="javascript:alert('Form #validate submited');">
                            <div class="data-fluid">

                                <div class="row-form">
                                    <div class="span2">餐厅名称</div>
                                    <div class="span10">
                                        <input type="text" class="validate[required,maxSize[8]]"/>
                                        <span class="bottom">必填，最多8个字</span>
                                    </div>
                                </div>                                      
                                <div class="row-form">
                                    <div class="span2">负责人</div>
                                    <div class="span5">
                                        <input type="text" class="validate[required,maxSize[18]]"/>
                                        <span class="bottom">必填</span>
                                    </div>
                                </div>

                                     <div class="row-form">
                                    <div class="span2">地址</div>
                                    <div class="span10">
                                        <input type="text" class="validate[required,maxSize[30]]"/>
                                        <span class="bottom">必填，最多30字</span>
                                    </div>
                                </div>                          
                                                       
                                </div>
                                <div class="row-form">
                                	<div class="span2">简介</div>
                                	<div class="span10">
                                        <textarea name=
                                        "text"></textarea>
                                    </div>
                                </div>
                                   
   
                                <div class="row-form">
                                    <div class="span2">图片</div>
                                    <div class="span10">
                                         <div class="data-fluid editor">        <div id="uploader_v5"><center>Your browser doesnt support HTML5</center></div>
                                    </div>                    
                                </div> 
                                <div class="toolbar bottom tar">
                                    <div class="btn-group">
                                        <button class="btn btn-info" type="button" onClick="$('#validate').validationEngine('hide');">隐藏提醒</button>
                                        <button class="btn" type="submit">提交</button>
                                    </div>
                                </div>

                            </div>                
                            </form>
                        </div
                    </div>
                    </div>


                </div>                 
                

            </div>
            
        </div>
        
    </div>
    <div class="dialog" id="source" style="display: none;" title="Source"></div>
</body>
</html>

