<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_list.aspx.cs" Inherits="waiterPlatform.UI.menu_list" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />    
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
    <![endif]-->                
    <title>当前菜单列表</title>
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
    
    <script type='text/javascript' src='js/plugins/datatables/jquery.dataTables.min.js'></script>
    
    <script type='text/javascript' src='js/plugins/shbrush/XRegExp.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shCore.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushXml.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushJScript.js'></script>
    <script type='text/javascript' src='js/plugins/shbrush/shBrushCss.js'></script>    
    
    <script type='text/javascript' src='js/plugins.js'></script>
    <script type='text/javascript' src='js/charts.js'></script>
    <script type='text/javascript' src='js/actions.js'></script>
    <script language=javascript> 
        function editDish(env) {
            var id = (env.getAttribute("id"));
            alert("单机按钮" + id);
            $.ajax({
                type: 'get',
                url: 'editDish.ashx?dish_id=' + id,
                async: true,
                success: function (result) {
                    alert(result);
                },
                error: function () {
                    alert("请求失败，请重新尝试");
                    setContainer('ERROR!');
                }
            });
        }

        function deleteDish(env) {
            var id = (env.getAttribute("id"));
            alert("单机按钮"+id);
            $.ajax({
                type: 'get',
                url: 'deleteDish.ashx?dish_id=' + id,
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
            
            <form runat="server">
            <div class="content">
                
                <div class="page-header">
                    <div class="icon">
                        <span class="ico-layout-7"></span>
                    </div>
                    <h1>当前菜单列表 <small>电子商务点餐系统</small></h1>
                </div>
                
                <asp:button runat="server" button class="btn" type="submit" OnClick="Unnamed_Click" Text="提交"></asp:button>
                    
                <div class="row-fluid">
                    <div class="span12">
                    
                                     
                        <div class="block">
                            <div class="head dblue">
                                <div class="icon"><span class="ico-layout-9"></span></div>
                                <h2>菜单列表</h2>
                                <ul class="buttons">
                                    <li><a href="#" onClick="source('table_sort_pagination'); return false;"><div class="icon"><span class="ico-info"></span></div></a></li>
                                </ul>                                                        
                            </div>                
                                <div class="data-fluid">
                                    <table class="table fpTable lcnp" cellpadding="0" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" class="checkall"/></th>
                                                <th width="20%">菜品名</th>
                                                <th width="20%">单号</th>
                                                <th width="20%">单价</th>
                                                <th width="20%">主要原料</th>
                                                <th width="80" class="TAC">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>   
                                            <%=dishList %>                        
                                        </tbody>
                                    </table>                    
                                </div> 
                        </div>            

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
