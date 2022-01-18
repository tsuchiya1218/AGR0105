<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
           String message = (String) request.getAttribute("msg");
           if (message == null) {
                message = "";
              }
           if (!message.trim().equals("")) {
                out.println("<script language='javascript'>");
                out.println("alert('" + message + "');");
                out.println("</script>");
               }
               request.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="./component/style/components.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/themes.css">
    <script src="./component/js/JQuery2.1.4.js"></script>
    <script src="./component/plugins/layer/layer.js"></script>
</head>

<body>
    <div id="login">
     <form action="login" method="post">
        <div class="center">
            <dl>
                <dt><i class="gi gi-leaf"></i>GoGo Car · <span> AdminSystem</span></dt>
                <dd><span><i class="fa fa-fw fa-user"></i></span><input type="text" name="username" placeholder="管理者ID入力"></dd>
                <dd><span><i class="fa fa-fw fa-lock"></i></span><input type="password" name="password" placeholder="管理者パスワード"></dd>
                <dd><button>ログイン</button></dd>
            </dl>
        </div>
    </form>
    </div>
</body>

</html>