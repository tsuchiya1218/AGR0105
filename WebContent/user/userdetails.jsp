<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>ユーザ情報</title>
		<link rel="stylesheet" href="../admin/css/bootstrap.css" />
		<script type="text/javascript" src="../admin/component/js/JQuery2.1.4.js"></script>
		<script type="text/javascript" src="../admin/js/vendor/bootstrap.min.js"></script>
	
		
		   <link rel="stylesheet" href="../admin/css/themes.css">
		   <link rel="stylesheet" href="../admin/css/plugins.css">
   		   <link rel="stylesheet" href="../admin/css/main.css">
    		<script src="../admin/component/plugins/laydate/laydate.js"></script>
    		<script src="../admin/component/plugins/layer/layer.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">

	
	</head>

	<body>
		
		<div class="container">
			<jsp:include page="header.jsp"></jsp:include>
			 <c:if test="${isupdated ==true}">
       		<div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	ユーザ情報を更新しました。
        	</div>
       	</c:if>
       <c:if test="${isupdated ==false}">
       		<div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	ユーザ情報を更新できませんでした、もう一度試してください。
        </div>
       	</c:if>
		 <div class="tablebox col-md-6 col-md-offset-3">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                    
                    </tr>
                </thead>
                <tbody>
					<tr>
                        <td>ユーザ名</td>
                        <td>${sessionScope.user.username }</td>
                    </tr>
                    
                    <tr>
                        <td>生年月日</td>
                        <td>${sessionScope.user.birthday }</td>
                    </tr>
                    
                     <tr>
                        <td>免許番号</td>
                        <td>${sessionScope.user.drivelicense }</td>
                    </tr>
                     <tr>
                        <td>免許期限</td>
                        <td>${sessionScope.user.expiredate }</td>
                    </tr>
                    
                     <tr>
                        <td>電話番号</td>
                        <td>${sessionScope.user.tel }</td>
                    </tr>
                    
                     <tr>
                        <td>Email</td>
                        <td>${sessionScope.user.email }</td>
                    </tr>
			
              		 <tr>
                        <td>アドレス</td>
                        <td>${sessionScope.user.address }</td>
                    </tr>
                    
                    <tr>
                        <td>緊急連絡人</td>
                        <td>${sessionScope.user.emegname }</td>
                    </tr>
                    
                     <tr>
                        <td>緊急連絡先</td>
                        <td>${sessionScope.user.emegtel }</td>
                    </tr>
                    
                     <tr>
                        <td>登録日</td>
                        <td>${sessionScope.user.regdate }</td>
                    </tr>
                </tbody>
            </table>
            <a href="changePWD.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">パスワード変更</a>
        	<a href="changeUserInfo.jsp?username=${sessionScope.user.username }&birthday=${sessionScope.user.birthday }&drivelicense=${sessionScope.user.drivelicense  }&expiredate=${sessionScope.user.expiredate }&email=${sessionScope.user.email }&address=${sessionScope.user.address }&tel=${sessionScope.user.tel }&emegname=${sessionScope.user.emegname }&emegtel=${sessionScope.user.emegtel }"  class="btn btn-primary btn-lg active" role="button" aria-pressed="true" style="float:right;">ユーザ情報変更</a>
        </div>
			</div>
			
			<jsp:include page="footer.jsp"></jsp:include> 
		
		
	</body>

</html>
