<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>注文履歴</title>
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
			<div class="tablebox">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        
                        <th class="text-center">注文番号</th>
                        <th>車名</th>
                        <th>総計金額</th>
                        <th>レンタル開始時間</th>
                        <th>レンタル終了時間</th>
                        <th>レンタル状態</th>
                        <th class="cell-small text-center"> 車写真</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${userOrder }" var="uomap">
               		
                    <tr>
                        <td class="cell-small text-center"><c:out value="${uomap['id']}"></c:out></td>
                        <td><c:out value="${uomap['carNo']}"></c:out></td>
                        <td><c:out value="${uomap['order_price']}"></c:out></td>
                        <td><c:out value="${uomap['start_time']}"></c:out></td>
                        <td><c:out value="${uomap['end_time']}"></c:out></td>
                        <td><c:out value="${uomap['order_status']}"></c:out></td>
                        <td class="text-center">
                        <img src="../<c:out value="${uomap['image']}"></c:out>" class="img-thumbnail" style="max-width: 80%;"/>
                        
                           <%--  <div class="btn-group">
                                <a href="javascript:void(0)" class="btn btn-xs btn-info" data-toggle="tooltip"
                                    data-placement="top" title="" data-original-title="info"><i
                                        class="fa fa-info-circle"></i></a>
                                <c:if test="${uomap['order_status'] eq 'レンタル中'}">
                                <a href="backCar?orderid=${uomap['id']}" class="btn btn-xs btn-success" data-toggle="tooltip"
                                data-placement="top" title="返却" ><i
                                        class="fa fa-undo"></i></a>
                                </c:if>
                                
                                <a href="#" class="btn btn-xs btn-danger" data-toggle="tooltip"
                                data-placement="top" title="" data-original-title="削除" onclick="return confirm('注文番号「${olist.id }」を削除してもよろしいですか？');"><i
                                        class="fa fa-trash-o" ></i></a> --%>
                            </div>
                        </td>
                    </tr>
                  
                  </c:forEach>
                </tbody>
            </table>
        </div> 		
		 
		</div>
			
			<jsp:include page="footer.jsp"></jsp:include> 
		
		
	</body>

</html>