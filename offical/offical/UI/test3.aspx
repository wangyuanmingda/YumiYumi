<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test3.aspx.cs" Inherits="offical.UI.test3" %>


<!doctype html>
<html lang="en-US">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>jQuery模态窗口登陆效果 - 站长素材</title>
  <link rel="stylesheet" type="text/css" media="all" href="css/style2.css">
  <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
</head>

<body>
<a href="#loginmodal" class="flatbtn" id="modaltrigger">Modal Login</a>

  <div id="loginmodal">
    <h1>User Login</h1>
    <form runat="server" id="loginform" name="loginform" method="post" action="offical.aspx">
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" class="txtfield" tabindex="1">
      
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" class="txtfield" tabindex="2">
      
      <div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="Log In" tabindex="3"></div>
    </form>
  </div>
<script type="text/javascript">
    $(function () {
        $('#loginform').submit(function (e) {
            return false;
        });

        $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
    });
</script>

</body>
</html>