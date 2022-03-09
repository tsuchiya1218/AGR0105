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
    		<script type="text/javascript" src="../admin/component/plugins/layui.js"></script>
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
  			
  		<form action="checkout" method="post">
  			<input name="carinfo" value="${car.id }" type="hidden" />
  			<input name="userinfo" value="${sessionScope.user.id }" type="hidden" />
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
                        <br>
                    </div>
                    <span style="color:red; ">*選択できないレンタル期間は既に予約取れた期間です、他の日時を選択してください。</span>
     			 </td>
      			 <td></td>
    		</tr>
			
    		<tr>
     			 <td><button class="btn btn-success"><i class="fa fa-car" aria-hidden="true"></i>予約</button></td>
      			 <td></td>
    		</tr>
    	</form>	
    		
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
			 	 var now = new Date();
		        var arr = [];
		        $.ajax({
		  		  url:"http://localhost:8080/GoGoCar/user/setDate?carid=${car.id }",
		  		  cache: false, 
		  	      data: "time="+new Date().getTime(),
		  	      async: false, 
		  	      dataType:"JSON",
		  	      success:function(data){
		  	    	  if(data){
		  	    		
		  	    	
		  	    		  for(var value in data){
		  	    			 arr.push(data[value]);
		  	    		
		  	    		  }
		  	    		 // alert(arr);
		  	    		  
		  	    		laydate.render({
		  			        elem: '#date'
		  			        ,range: true,
		  			        format: 'yyyy-MM-dd HH:mm',
		  			        min: 0,
		  			        type: 'datetime',
		  			        lang: 'en',
		  			        theme:"#5cb85c",
		  			        ready: function(){
		  		                var elem = $(".layui-laydate-content");//获取table对象
		  		                layui.each(elem.find('tr'), function (trIndex, trElem) {//遍历tr
		  		                	layui.each($(trElem).find('td'), function (tdIndex, tdElem) {
		  		                        //遍历td
		  		                        var tdTemp = $(tdElem);
		  		                        if (tdTemp.hasClass('laydate-day-next') || tdTemp.hasClass('laydate-day-prev')) {
		  		                            return;
		  		                        }
		  		                        // if (tdIndex == 1) { //此时周一不可选
		  		                        //     //此处判断，是1的加上laydate-disabled，0代表星期日
		  		                        //     tdTemp.addClass('laydate-disabled');
		  		                        // }
		  		                        if(arr.indexOf(tdTemp.attr("lay-ymd"))>-1){//指定数组中的日期不可选
		  		                        	
		  		                            tdTemp.addClass('laydate-disabled');
		  		                        }
		  		                    });
		  		                });
		  		            },
		  			        });
		  	    	  }
		  	    	   
		  	    	 
		  	      },
		  	      error : function(errorMsg) {
		  	         
		  	            alert("failed");
		  	       
		  	        }
		  	      
		  		})
		        
		        
		        
		        
		        //1、日期范围
		        	laydate.render({
		  			        elem: '#date'
		  			        ,range: true,
		  			        format: 'yyyy-MM-dd HH:mm',
		  			        min: 0,
		  			        type: 'datetime',
		  			        lang: 'en',
		  			        theme:"#5cb85c",
		  			        ready: function(){
		  		                var elem = $(".layui-laydate-content");//获取table对象
		  		                layui.each(elem.find('tr'), function (trIndex, trElem) {//遍历tr
		  		                	layui.each($(trElem).find('td'), function (tdIndex, tdElem) {
		  		                        //遍历td
		  		                        var tdTemp = $(tdElem);
		  		                        if (tdTemp.hasClass('laydate-day-next') || tdTemp.hasClass('laydate-day-prev')) {
		  		                            return;
		  		                        }
		  		                        // if (tdIndex == 1) { //此时周一不可选
		  		                        //     //此处判断，是1的加上laydate-disabled，0代表星期日
		  		                        //     tdTemp.addClass('laydate-disabled');
		  		                        // }
		  		                        if(arr.indexOf(tdTemp.attr("lay-ymd"))>-1){//指定数组中的日期不可选
		  		                        	
		  		                            tdTemp.addClass('laydate-disabled');
		  		                        }
		  		                    });
		  		                });
		  		            },
		  			        });
	
    		</script>
		
	</body>

</html>
