<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<!-- <link rel="stylesheet" href="../admin/css/bootstrap.css" />
		<script type="text/javascript" src="../admin/component/js/JQuery2.1.4.js"></script>
		<script type="text/javascript" src="../admin/js/vendor/bootstrap.min.js"></script> -->
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
		<!--最外层的布局容器-->
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
   
					<img src="../${car.image }" class="img-responsive img-thumbnail" height="500px"  width="500px"/>
						
      			</td>
      			<td><strong>車詳細情報</strong></td>
    		</tr>
    		<tr>
     			 <td>車名:   ${car.carno }</td>
      			 <td></td>
    		</tr>
    		
    		<tr>
     			 <td>ブランド:    ${car.brandname }</td>
      			 <td></td>
    		</tr>
    		
    		<tr>
     			 <td>色:  ${car.color }</td>
      			 <td></td>
    		</tr>
    		
    		<tr>
     			 <td>レンタル料金：￥  ${car.price }</td>
      			 <td></td>
    		</tr>
    		<tr>
     			 <td>レンタル期間
     			 	  <div class="input-group date input-datepicker mtb0">
                        <input type="text" id="date" placeholder="期間を選択"
                            name="date" class="form-control cursorpointer" readonly>
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    </div>
     			 </td>
      			 <td></td>
    		</tr>

    		<tr>
     			 <td><button class="btn btn-success"><i class="fa fa-floppy-o"></i>book</button></td>
      			 <td></td>
    		</tr>
  			</tbody>
			</table>
		
			
			
			<!--商品部分-->
			<div class="row">
				
				<div class="col-md-10">
					
					
				</div>
			</div>
			
	
			</div>
			
			<jsp:include page="footer.jsp"></jsp:include> 
			  <script>
      
		        //1、日期范围
		        laydate.render({
		        elem: '#date'
		        ,range: true,
		        lang: 'en',
		        theme:"#5cb85c"
		        });
	
    		</script>
		
	</body>

</html>
