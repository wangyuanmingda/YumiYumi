<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="waiterPlatform.UI.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<script>
    function strokeRect() {
        var canvas = document.getElementById('demoCanvas');
        var ctx = canvas.getContext("2d");
        //绘制路径
        context.beginPath(); // 开始路径绘制
        context.moveTo(166, 120); // 设置路径起点，坐标为(20,20)
        context.lineTo(208, 120); // 绘制一条到(200,20)的直线
        context.closePath();
        context.lineWidth = 2.0; // 设置线宽
        context.strokeStyle = "#CC0000"; // 设置线的颜色
        context.stroke(); // 进行线的着色，这时整条线才变得可见
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <canvas id="demoCanvas" width="500" height="353"> <p>爷，你还在上个世纪吧，现在都html5了，您还在ie6时代？</p> </canvas>
    <input type="button" value="绘制" onclick="strokeRect();"/> 
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

            context.beginPath(); // 开始路径绘制
            context.moveTo(166, 120); // 设置路径起点，坐标为(20,20)
            context.lineTo(208, 120); // 绘制一条到(200,20)的直线
            context.closePath();
            context.lineWidth = 2.0; // 设置线宽
            context.strokeStyle = "#CC0000"; // 设置线的颜色
            context.stroke(); // 进行线的着色，这时整条线才变得可见

        };

    </script>
        <p><%=number %></p>
    </div>
    </form>
</body>
</html>
