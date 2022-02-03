<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="bootstrap-3.4.1-dist/css/bootstrap.min.css" />
		<script type="text/javascript" src="../admin/component/js/JQuery2.1.4.js"></script>
		<script type="text/javascript" src="bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

		<meta name="viewport" content="width=device-width, initial-scale=1">

	
	</head>

	<body>
		<!--最外层的布局容器-->
		<div class="container">
			<jsp:include page="header.jsp"></jsp:include>
			
		
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="2500">
				
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

			
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="../img/campaign1.jpeg" alt="...">
						<div class="carousel-caption">
							...
						</div>
					</div>
					<div class="item">
						<img src="../img/campaign2.jpeg" alt="...">
						<div class="carousel-caption">
							...
						</div>
					</div>
					<div class="item">
						<img src="../img/campaign3.jpeg" alt="...">
						<div class="carousel-caption">
							...
						</div>
					</div>
				</div>

			
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div> 
			
			<div class="row">
				<div class="col-md-12">
					<h3>車一覧</h3>
				</div>
			</div>
			
			
		
			<div class="row">
				
				<!-- <div class="col-md-2 hidden-sm hidden-xs" style="height: 480px;">
					<img src="../products/hao/big01.jpg" width="100%" height="100%"/>
				</div> -->
				
				<div class="col-md-10">
					<h1 class="page-header">carList 1</h1>
					<!-- 	<div class="col-md-6 hidden-sm hidden-xs" style="height: 240px;">
							<img src="../products/hao/middle01.jpg" style="width: 100%;" />
						</div> -->
					<c:forEach items="${carList }" var="clist">
						<div class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
							<img src="../${clist.image }" class="img-thumbnail" style="max-width: 80%;"/>
							<p>${clist.carno}</p>
							<p class="text-info">￥ ${clist.price } </p>
							<a href="../car/cardetail?carid=${clist.id} " style="text-decoration:none;color: black;">
					 			<button type="button" class="btn btn-default btn-sm">
         				 			<span class="glyphicon glyphicon-th-list"></span> 詳細
       							</button>
       				 		</a>
						</div>
					</c:forEach>

				</div>
				
				<div class="col-md-10">
					<h1 class="page-header">carList 2</h1>
					<!-- 	<div class="col-md-6 hidden-sm hidden-xs" style="height: 240px;">
							<img src="../products/hao/middle01.jpg" style="width: 100%;" />
						</div> -->
					<c:forEach items="${carList }" var="clist">
						<div class="col-md-2 col-sm-4 col-xs-6" style="text-align: center;height: 240px;">
							<img src="../${clist.image }" class="img-thumbnail" style="max-width: 80%;"/>
							<p>${clist.carno}</p>
							<p class="text-info">￥ ${clist.price } </p>
							<a href="../car/cardetail?carid=${clist.id} " style="text-decoration:none;color: black;">
					 			<button type="button" class="btn btn-default btn-sm">
         				 			<span class="glyphicon glyphicon-th-list"></span> 詳細
       							</button>
       				 		</a>
						</div>
					</c:forEach>

				</div>  					
  					
			
			</div>
			
	
			</div>
			
			<jsp:include page="footer.jsp"></jsp:include> 
			
		
	</body>

</html>
