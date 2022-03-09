<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="../admin/component/js/JQuery2.1.4.js"></script>
<script type="text/javascript" src="bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<title>Login</title>
</head>
<body>
<div id="login">
       
        <div class="container">
        <jsp:include page="header.jsp"></jsp:include>
         <c:if test="${ischanged ==true}">
       		<div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	パスワードが変更しましたので、新しいパスポートでもう一度ログインしてください。
        	</div>
       	</c:if>
       	 <c:if test="${isregisted ==true}">
       		<div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	新規ユーザー登録が完了しました。新規登録確認メールを送信しました、ご登録ありがとうございました。
            	こちらでログインしてください。
        	</div>
       	</c:if>
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                    
                        <form id="login-form" class="form" action="login" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group">
             
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="register.jsp" class="text-info">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    	<jsp:include page="footer.jsp"></jsp:include> 
</body>