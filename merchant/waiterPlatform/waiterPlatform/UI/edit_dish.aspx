<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_dish.aspx.cs" Inherits="waiterPlatform.UI.edit_dish" %>


<!DOCTYPE html>
<html lang="en">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />    
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
    <![endif]-->                
    <title>修改菜单</title>
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

        <!--checkbutton -->
    <link href="css/inserthtml.com.radios.css" rel="stylesheet" type="text/css"/>    <script src="js/modernizr.js"></script>
    
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
                        <span class="ico-ok"></span>
                    </div>
                    <h1>新建菜单<small>查看已有菜单</small></h1>
                </div>
                <form id="Form1" runat="server" action="" >
                <div class="row-fluid">
                    <div class="span8">                
                        <div class="block">
                            <div class="head">                                
                                <h2>菜单信息</h2>
                                <ul class="buttons">             
                                    <li><a href="#" onClick="source('form_validation'); return false;"><div class="icon"><span class="ico-info"></span></div></a></li>
                                </ul>                                
                            </div>                                               
                            <form id="validate" method="POST" action="javascript:alert('Form #validate submited');">
                            <div class="data-fluid">

                                <div class="row-form">
                                    <div class="span2">菜品名称</div>
                                    <div class="span10">
                                        <input name ="name" type="text" value="<%=name %>" class="validate[required,maxSize[8]]"/>
                                        <span class="bottom">必填，最多8个字</span>
                                    </div>
                                </div>                                      
                                <div class="row-form">
                                    <div class="span2">单价</div>
                                    <div class="span5">
                                        <input name="price" type="text" value="<%=price %>" class="validate[required,custom[integer],min[0],max[120]]"/>
                                        <span class="bottom">必填，单价在0~120之间，默认单位为“元”</span>
                                    </div>                        
                                    <div class="span2 TAR">辣度</div>
                                    <div class="span3">
                                        <nobr><input type="radio" class="validate[required]" name="gender" value="1"/> 不辣</nobr> <nobr><input type="radio" class="validate[required]" name="gender" value="0"/> 辣</nobr>
                                        <span class="bottom">必填</span>
                                    </div>                        
                                </div>
                                <div class="row-form">
                                	<div class="span2">简介</div>
                                	<div class="span10">
                                        <textarea name="description" ><%=description %></textarea>
                                    </div>
                                </div>
                                   
                                <div class="row-form">
                                    <div class="span2">图片</div>
                                    <div class="span10">
                                         <div class="data-fluid editor">        
                                             <div id="uploader_v5"><center>Your browser doesnt support HTML5</center></div>
                                    </div>                    
                                </div>  
                                    </div>
                                </div>                              
                           <div class="span12">                                              
                                <div class="toolbar bottom tar">
                                    <div class="btn-group">
                                        <button class="btn btn-info" type="button" onClick="$('#validate').validationEngine('hide');">隐藏提醒</button>
                                        <asp:button ID="Button1" runat="server" class="btn" type="submit" OnClick="Unnamed_Click" Text="提交"></asp:button>
                                    </div>
                                </div>

                            </div>                
                            </form>
                        </div>
                    </div>

                    <div class="span4">
                        <div class="block">
                            <div class="head">
                                <h2>设定优惠价格</h2>
                            </div>                   
                             
                            <form id="validate_custom" method="POST" action="javascript:alert('#validate_custom submited');">
                            <div class="data-fluid">
                               
                                <div class="row-form">  
                                    <div class="span5">选择优惠方式:</div>
                                    <div class="span7">                            
                                        <select name="s_example" class="validate[required]" style="width: 100%;">
                                            <option value=""></option>
                                            <option value="1">Andorra</option>
                                            <option value="2">Antarctica</option>                                
                                            <option value="3">Ukraine</option>                                                                       
                                        </select>                            
                                        <span class="bottom">Required</span>
                                    </div>
                                </div>
                                <div class="row-form">
                                    <div class="span5">优惠截止日期:</div>
                                    <div class="span7">                            
                                        <input type="text" class="validate[required] datepicker"/>
                                        <span class="bottom">Required</span>
                                    </div>
                                </div>                                       

                                <div class="row-form"></div>

                                <div class="row-form">
                                    <div class="span5">优惠价格:</div>
                                    <div class="span7">                            
                                        <input class="validate[groupRequired[payments]]" type="text" name="credit" id="credit" />
                                        <span class="bottom">Any of group fields must be filled.</span>
                                    </div>
                                </div>

                                </div>                    

                            </div>
                            </form>
                        </div>
                    </div>

                </div>                 
                </form>
            </div>
            
        </div>
        
    </div>
    <div class="dialog" id="source" style="display: none;" title="Source"></div>
</body>
</html>
