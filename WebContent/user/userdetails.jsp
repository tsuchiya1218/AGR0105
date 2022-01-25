<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
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
        </div>
			</div>
			
			<jsp:include page="footer.jsp"></jsp:include> 
		
		
	</body>

</html>
