<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css" />
<script type="text/javascript" src="../admin/component/js/JQuery2.1.4.js"></script>
<script type="text/javascript" src="bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../admin/component/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="../admin/component/dist/localization/messages_ja.min.js"></script>
<title>パスワード変更</title>

</head>
<body>
<style>
input.error { border: 1px solid red; }
label.error {


  padding-left: 16px;

  padding-bottom: 2px;

  font-weight: bold;

  color: #EA5200;
}
</style>
<script>

$().ready(function() {

	  $("#changePWDForm").validate({
	    rules: {
	     
	      password: {
	        required: true,
	        minlength: 5
	      },
	      confirm_password: {
	        required: true,
	        minlength: 5,
	        equalTo: "#password"
	      }
	    },
	    messages: {
	      password: {
	        required: "パスワードを入力してください"
	     
	      },
	      confirm_password: {
	        required: "パスワードを入力してください",
	        equalTo: "[パスワードを再入力（確認）]に同じパスワードが入力されていません。"
	      }
	     }
	    })
	});
</script>

<div class="container">
    <jsp:include page="header.jsp"></jsp:include>
    	 
       	   <c:if test="${ischanged ==false}">
       		<div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	現在のパスワードが間違います、もう一度入力してください。
        </div>
       	</c:if>
    
            <form class="form-horizontal" role="form" id="changePWDForm" action="changePWD" method="get">
                <h2>パスワード変更</h2>
                
                 <div class="form-group">
                    <label for="oldpassword" class="col-sm-3 control-label">現在のパスワード<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                  
                        <input type="password" id="oldpassword" name="oldpassword" placeholder="old Password" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">新しいパスワード<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" placeholder="Password" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="repassword" class="col-sm-3 control-label">新しいパスワード(確認用)<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="re-enter Password" class="form-control">
                    </div>
                </div>
                
                 <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block">*古いパスワードと新しい設定するパスワードを間違いないように</span>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary btn-block" style="width:200px;margin-left:150px">変更</button>
            	
            </form> <!-- /form -->
            </div>
        </div> <!-- ./container -->
         <jsp:include page="footer.jsp"></jsp:include> 

    	


</body>
</html>