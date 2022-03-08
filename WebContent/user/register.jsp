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
<title>register</title>
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
/* $.validator.setDefaults({
    submitHandler: function() {
    	confirm($("#registerForm").serialize()+"このまま登録してもよろしいですか？");
    }
}); */
$().ready(function() {

	  $("#registerForm").validate({
	    rules: {
	      username: {
	        required: true,
	        minlength: 2
	      },
	      password: {
	        required: true,
	        minlength: 5
	      },
	      confirm_password: {
	        required: true,
	        minlength: 5,
	        equalTo: "#password"
	      },
	      driverlicense: {
	    	 required: true,
	    	rangelength:[12,12],
	    	digits:true
	      },
	      email: {
	        required: true,
	        email: true
	      },
	      birthDate: { 
	    	 required: true
	      },
	      phoneNumber: {
	    	  required:true,
	    	  minlength:11,
	    	  digits:true
	      },
	      address: {
	    	  required:true
	      },
	      emeg: {
	    	  required:true
	      },
	      emegtel:{
	    	  required:true,
	    	  minlength:11,
	    	  digits:true
	      },
	      licenseexpiredate: {
	    	  
	    	  required: true
	      }
	    },
	    messages: {
	      username: {
	        required: "ユーザー名を入力してください"
	        
	      },
	      password: {
	        required: "パスワードを入力してください"
	     
	      },
	      confirm_password: {
	        required: "パスワードを入力してください",
	        equalTo: "[パスワードを再入力（確認）]に同じパスワードが入力されていません。"
	      },
	      driverlicense: {
		    required: "免許番号を入力してください",
		    rangelength: "12桁の免許番号を正しく入力してください"
		      },
	      email: "メールアドレスの形式が正しくありません",
	      birthDate: { 
		    	 required: "生年月日を入力してください"
		      },
		  phoneNumber: {
		    	  required:"携帯番号を入力してください",
		    	  minlength:"11桁の携帯番号を正しく入力してください"
		      },
		  address: {
		    	  required:"住所を入力してください"
		      },
		  emeg: {
		    	  required:"緊急連絡人を入力してください"
		      },
		  emegtel: {
			  required:"緊急連絡人の携帯番号を入力してください",
	    	  minlength:"11桁の携帯番号を正しく入力してください"	  
		  	},
		  licenseexpiredate: { 
			    required: "有効期限を入力してください"
		      }
		     
	     }
	    })
	});
</script>

<div class="container">
    <jsp:include page="header.jsp"></jsp:include>
       	   <c:if test="${isregisted ==false}">
       		<div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	同名ユーザーがございますので、別のユーザー名でもう一度登録してください。
        </div>
       	</c:if>
            <form class="form-horizontal" role="form" id="registerForm" action="regist" method="post">
                <h2>Registration</h2>
                <div class="form-group">
                    <label for="username" class="col-sm-3 control-label">ユーザー名<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="username" name="username" placeholder="Username" class="form-control" autofocus >
                    </div>
                </div>
                <div class="form-group">
                    <label for="driverlicense" class="col-sm-3 control-label">免許番号<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="driverlicense" name="driverlicense" placeholder="driverlicense" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="licenseexpiredate" class="col-sm-3 control-label">免許有効期限<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="date" id="licenseexpiredate" name="licenseexpiredate" placeholder="有効期限を入力してください" class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="email" id="email" name= "email"　placeholder="Email" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">パスワード<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="password" id="password" name="password" placeholder="Password" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="repassword" class="col-sm-3 control-label">パスワード(確認用)<span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="re-enter Password" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">生年月日 <span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="date" id="birthDate" name="birthDate" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="col-sm-3 control-label">電話番号  <span style="color:red;">※必須</span></label>
                    <div class="col-sm-9">
                        <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Phone number" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                        <label for="address" class="col-sm-3 control-label">連絡先<span style="color:red;">※必須</span> </label>
                    <div class="col-sm-9">
                        <input type="text" id="address" name="address" placeholder="住所を入力してください" class="form-control">
                    </div>
                </div>
                 <div class="form-group">
                        <label for="emeg" class="col-sm-3 control-label">緊急連絡人<span style="color:red;">※必須</span> </label>
                    <div class="col-sm-9">
                        <input type="text" id="emeg" name="emeg" placeholder="緊急連絡人" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                       <label for="emegtel" class="col-sm-3 control-label">緊急連絡人(携帯番号)<span style="color:red;">※必須</span> </label>
                    <div class="col-sm-9">
                        <input type="text" id="emegtel" name="emegtel" placeholder="緊急連絡人(携帯番号)" class="form-control">
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <span class="help-block">*必須項目ご確認の上登録してください</span>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary btn-block" style="width:200px;margin-left:150px">Register</button>
            	
            </form> <!-- /form -->
        </div> <!-- ./container -->
         <jsp:include page="footer.jsp"></jsp:include> 

    	


</body>
</html>