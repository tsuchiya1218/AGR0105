<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>車更新</title>
    <script src="./component/js/JQuery2.1.4.js"></script>
    <link rel="stylesheet" href="./component/style/components.css">
    <script src="./component/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/themes.css">
    <script>
    		function getUrlParam(name){
    				var reg = new RegExp("(^|&)"+name+"=([^&]*)(&|$)");
    				var r = window.location.search.substr(1).match(reg);
    				if(r!=null) return unescape(r[2]);return null;
    				
    		}
    		
    		$(function(){
   
    			$("#carbrand").val(getUrlParam('carbrand'));
    		})
    	
    	
    
    </script>
    
</head>

<body>
    <div id="body">
        <ol class="breadcrumb">
            <li class="active"><a href="#">システム</a></li>
            <li>料金/状态变更</li>
        </ol>


        <div class="tabli">
            <span>料金/状態更新</span>
        </div>

        <div class="tabbody">
            <div class="bodyli active">
                <!-- ///// -->
                <form action="updateCarPrice" method="post" >
                 
                        <input type="hidden" name="carid"  id="carid" class="form-control input-sm" value="${param.carid }">
                   
               
                
                <div class="inputbox">
                    <span class="title">車名称</span>
                    <div class="inputright">
                        <input type="text"  disabled="disabled" name="carno" id="carno" class="form-control input-sm" value="${param.carno }"　>
                    </div>
                </div>
     
                 <!-- ///// -->
                 <div class="inputbox">
                    <span class="title">価格</span>
                    <div class="inputright">
                        <input type="number" name="price" class="form-control input-sm" min=0 value="${param.carprice }">
                    </div>
                </div>
                
                 <div class="inputbox">
                    <span class="title"><em class="s-red">*</em> レンタル状態</span>
                    <div class="inputright">
                        <select id="example-select" name="carstatus" class="form-control input-sm">
                            <option>レンタル可能</option>
                            <option>レンタル不可</option>
                        </select>
                    </div>
                </div>

           

       
    	
            </div>
            
        </div>
        <div class="tbfooter">
            <button class="btn btn-success"><i class="fa fa-floppy-o"></i>料金/状態更新</button>
        </div>
        </form>
    </div>

 
</body>

</html>