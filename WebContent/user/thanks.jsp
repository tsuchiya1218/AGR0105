<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
      <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<link rel="stylesheet" href="/GoGoCar/user/bootstrap-3.4.1-dist/css/bootstrap.min.css" />
		<script type="text/javascript" src="../admin/component/js/JQuery2.1.4.js"></script>
		<script type="text/javascript" src="/GoGoCar/user/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
		
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
			<table class="table">
  			<thead>
    			<tr>
      				<th style="width:50%;"></th>
      				<th></th>
    			</tr> 
  			</thead> 
  			<tbody>
  			
  		
	    		<tr>
	      			<td rowspan="8">
	   
						<img src="../img/thanks.jpeg" class="img-responsive img-thumbnail" height="500px"  width="500px"/>
							
	      			</td>
	      		
	    		</tr>
	    		<tr>
	     			 <td rowspan="8" style="vertical-align: middle !important;text-align: center;">
		     			 <p style="font-size:18px; font-weight:bold;">ご予約ありがとうございます</p>
		     			 <p>この度は、GoGoCarにご予約頂き誠にありがとうございます。<br>
								スタッフ一同、当日のご来店を心よりお待ちしております。</p><br>
						　<p style="font-size:18px; font-weight:bold;">ご予約内容の確認</p>
						<p><img src="../img/guide1.jpeg" class="img-responsive img-thumbnail"></p>	
						 <p>予約内容の確認には　<span style="color:green;font-weight:bold;">ユーザーセンター</span>　＝＝＞　<span style="color:green;font-weight:bold;">レンタル履歴まで</span>　<br>もしくは下記のボタンを押してください</p>
						　<p><a href="<%=basePath %>user/orderhistory?userid=${sessionScope.user.id}"><button type="button" class="btn btn-info btn-lg">レンタル予約内容照会</button></a></p>	
	     			 </td>
	      		
	    		</tr>
	    		
    		
    		
  			</tbody>
			</table>
		
			
	
			</div>
			
			<jsp:include page="footer.jsp"></jsp:include> 
		
		
	</body>

</html>