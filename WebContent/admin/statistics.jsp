<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>集計グラフ</title>
    <script src="./component/js/JQuery2.1.4.js"></script>
    <link rel="stylesheet" href="./component/style/components.css">
    <script src="./component/js/bootstrap.min.js"></script>
     <script src="./js/echarts.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/themes.css">
    <script src="./component/plugins/laydate/laydate.js"></script>
    <script src="./component/plugins/layer/layer.js"></script>
</head>

<body>
    <div id="body">
        <ol class="breadcrumb">
            <li class="active"><a href="#">システム</a></li>
            <li>集計グラフ</li>
        </ol>
       	
    
        
      
        
        <div class="barboxs">
          <!--   <button class="btn btn-warning pull-left " data-toggle="tooltip" title="" data-placement="right" data-original-title="下架图片"><i class="fa fa-level-down"></i></button>
            <button class="btn btn-danger pull-left ml10" data-toggle="tooltip" title="" data-placement="right" data-original-title="删除文档"><i class="fa fa-trash-o"></i></button> -->

            <div class="leftbox">
                
                <form action="searchcars" method="get">
         
                <div class="liselect w300 ml10">
                    <!-- <div class="input-group">
                        <input type="text" id="example-input-typeahead" class="form-control example-typeahead" name="search" placeholder="車番号で検索">
                        <span class="input-group-btn">
                            <button class="btn btn-success"><i class="fa fa-search"></i></button>
                        </span>
                    </div> -->
                </div>
                </form>
            </div>
        </div>
        <div class="tablebox">
           <div id="main" style="width: 600px;height:400px;"></div>
           <div id="main2" style="width: 600px;height:400px;"></div>
	 <script type="text/javascript">
  
      var myChart = echarts.init(document.getElementById('main'));
	  var myChart2= echarts.init(document.getElementById('main2'));
      
     myChart.setOption({
 		 aria: {
             show: true
         },
         title : {
             text: 'Top4顧客レンタル数',
             subtext: '顧客ごと予約集計グラフ',
             x:'center'
         },
         tooltip : {
             trigger: 'item',
             formatter: "{a} <br/>{b} : {c} ({d}%)"
         },
         legend: {
             orient: 'vertical',
             left: 'left',
             
         },
         series : [
             {
                 name: '顧客/レンタル数',
                 type: 'pie',
                 radius : '55%',
                 center: ['50%', '60%'],
                 data:[
                     
                      
                 ],
                 itemStyle: {
                     emphasis: {
                         shadowBlur: 10,
                         shadowOffsetX: 0,
                         shadowColor: 'rgba(0, 0, 0, 0.5)'
                     }
                 }
             }
         ]
     
 	  });

		var nums=[];
		var usernames=[];
      $.ajax({
		  url:"http://localhost:8080/GoGoCar/admin/draw",
		  cache: false, 
	      data: "time="+new Date().getTime(),
	      async: false, 
	      dataType:"JSON",
	      success:function(data){
	    	  if(data){
	    		
	    		 
	    		  for(var key in data){
	    			 
	    			  usernames.push(key);
	    			  nums.push(data[key]);
	    		  }
	    		   myChart.setOption({
	    			  series : [
	    		             {
	    		                 data:[
	    		                     {value:nums[0], name:usernames[0]} , 
	    		                     {value:nums[1], name:usernames[1]},
	    		                     {value:nums[2], name:usernames[2]},
	    		                     {value:nums[3], name:usernames[3]}, 
	    		                 ]	    		            	
	    		             }
	    		         ]
		          });
	    	  }
	    	   
	    	 
	      },
	      error : function(errorMsg) {
	         
	            alert("failed");
	            myChart.hideLoading();
	        }
	      
		})

	//-------------------
	
	 myChart2.setOption({
 		 aria: {
             show: true
         },
         title : {
             text: 'ブランドごとレンタル数',
             subtext: 'ブランドごと予約集計グラフ',
             x:'center'
         },
         tooltip : {
             trigger: 'item',
             formatter: "{a} <br/>{b} : {c} ({d}%)"
         },
         legend: {
             orient: 'vertical',
             left: 'left',
             
         },
         series : [
             {
                 name: 'ブランド/レンタル数',
                 type: 'pie',
                 radius : '55%',
                 center: ['50%', '60%'],
                 data:[
                     
                      
                 ],
                 itemStyle: {
                     emphasis: {
                         shadowBlur: 10,
                         shadowOffsetX: 0,
                         shadowColor: 'rgba(0, 0, 0, 0.5)'
                     }
                 }
             }
         ]
     
 	  });
      
  	var bnums=[];
	var brands=[];
  $.ajax({
	  url:"http://localhost:8080/GoGoCar/admin/drawbrand",
	  cache: false, 
      data: "time="+new Date().getTime(),
      async: false, 
      dataType:"JSON",
      success:function(data){
    	  if(data){
    		
    		 
    		  for(var key in data){
    			 
    			  brands.push(key);
    			  bnums.push(data[key]);
    		  }
    		  myChart2.setOption({
    			  series : [
    		             {
    		                 data:[
    		                     {value:bnums[0], name:brands[0]} , 
    		                     {value:bnums[1], name:brands[1]},
    		                     {value:bnums[2], name:brands[2]},
    		                     {value:bnums[3], name:brands[3]}, 
    		                 ]	    		            	
    		             }
    		         ]
	          });
    	  }
    	   
    	 
      },
      error : function(errorMsg) {
         
            alert("failed");
            myChart2.hideLoading();
        }
      
	})
	
  
      myChart.setOption(option);
  	myChart2.setOption(option);
    </script>
        </div>

       
    </div>

</body>

</html>