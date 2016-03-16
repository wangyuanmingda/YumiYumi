function res() { 
//获取输入值(myname和mymail是两个文本框的id) 
var uname = document.getElementById("myname").value; 
var umail = document.getElementById("mymail").value; 
var utitle = document.getElementById("title").value;
var umessage = document.getElementById("message").value;

//数据库连接对象 
//ie 专用 var con = new ActiveXObject("ADODB.Connection"); 
var con = new XMLHttpRequest("ADODB.Connection");
//连接字符串 
var str = "DRIVER={SQL SERVER};SERVER=rdsn4s3622rg192by7s9.mysql.rds.aliyuncs.com;uid=chengyuhong;pwd=chengyuhong;database=yumiyumi"; 
//打开数据源 
con.open("POST",str,true);//true表示异步 
//sql语句 
//var sql = "insert into yumiyumi(name,mail) values(''" + uname + "'',''" + umail + "'')"; 
var sql = "insert into `yumi_advice` (`advice_name`,`advice_email`,`advice_title`,`advice_message`)values("+uname + ","+umail+","+utitle+","+utitle+")";
try { 
//执行sql语句 
con.send(sql); 
//关闭连接 
con.close(); 
//转向成功页面 
//window.location.href = "/uploadfile/201101/18/AF93632542.gif" />
 } 
catch (e) { 
alert(e); 
}
}