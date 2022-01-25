<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
	
<!--LOGO部分-->
			<div class="row">
				<div class="col-md-4 col-sm-6 col-xs-6">
					<img src="../img/logo.jpg" style="height: 6rem;"/>
				</div>
				<div class="col-md-4 col-sm-6 col-xs-6" style="line-height: 50px;height: 50px;">
					<a href="#">登录</a>
					<a href="#">注册</a>
					<a href="#">购物车</a>
				</div>
			</div>
			
			<!--导航栏部分-->
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
						<a class="navbar-brand" href="#">GoGoCar</a>
			 		</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active">
								<a href="<%=basePath %>user/doindex">車センター <span class="sr-only">(current)</span></a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">ユーザーセンター <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a href="<%=basePath %>user/userinfo">ユーザ情報</a>
									</li>
									<li>
										<a href="#">レンタル履歴</a>
									</li>
								<!-- 	<li>
										<a href="#">鞋靴箱包</a>
									</li> -->
								</ul>
							</li>
						</ul>
						<form class="navbar-form navbar-right" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>

					</div>
					
				</div>
				
			</nav>
			