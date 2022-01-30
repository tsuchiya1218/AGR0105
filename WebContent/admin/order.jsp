<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注文一覧</title>
    <script src="./component/js/JQuery2.1.4.js"></script>
    <link rel="stylesheet" href="./component/style/components.css">
    <script src="./component/js/bootstrap.min.js"></script>
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
            <li>注文一覧</li>
        </ol>
       	<c:if test="${isdeleted !=null}">
       		<div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	削除しました。
        </div>
       	</c:if>
       	<c:if test="${deletedfault !=null}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	該当注文を削除出来ません(注文状態をもう一度確認してください)
        </div>
       	</c:if>
    
        
      
        
        <div class="barboxs">
            <button class="btn btn-warning pull-left " data-toggle="tooltip" title="" data-placement="right" data-original-title="下架图片"><i class="fa fa-level-down"></i></button>
            <button class="btn btn-danger pull-left ml10" data-toggle="tooltip" title="" data-placement="right" data-original-title="删除文档"><i class="fa fa-trash-o"></i></button>

            <div class="leftbox">
                
                <form action="searchcars" method="get">
          <!--     <div class="ml10">
                    <div class="input-group date input-datepicker mtb0">
                        <input type="text" id="date" placeholder="期間を選択"
                            name="date" class="form-control cursorpointer" readonly>
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                   </div>
                </div>  -->
                <div class="liselect w300 ml10">
                    <div class="input-group">
                        <input type="text" id="example-input-typeahead" class="form-control example-typeahead" name="search" placeholder="車番号で検索">
                        <span class="input-group-btn">
                            <button class="btn btn-success"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="tablebox">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th width="50"  class="text-center"><input type="checkbox" id="check5-all" name="check5-all"></th>
                        <th class="text-center">注文ID</th>
                        <th>ユーザ番号</th>
                        <th>車番号</th>
                        <th>総計金額</th>
                        <th>レンタル開始時間</th>
                        <th>レンタル終了時間</th>
                        <th>レンタル状態</th>
                        <th class="cell-small text-center"><i class="fa fa-bolt"></i> 操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderList }" var="olist">
                    <tr>
                        <td class="text-center"><input type="checkbox" id="check5-td1" name="check5-td1">
                        </td>
                        <td class="cell-small text-center">${olist.id }</td>
                        <td>${olist.userId} </td>
                        <td>${olist.carId} </td>
                        <td>${olist.orderPrice} </td>
                        <td>${olist.startTime }</td>
                        <td>${olist.endTime }</i></td>
                        <td>${olist.orderStatus }</td>
                        <td class="text-center">
                            <div class="btn-group">
                                <a href="javascript:void(0)" class="btn btn-xs btn-info" data-toggle="tooltip"
                                    data-placement="top" title="" data-original-title="info"><i
                                        class="fa fa-info-circle"></i></a>
                              	<c:if test="${olist.orderStatus eq 'レンタル審査'}">  
                                <a href="approveOrder?orderid=${olist.id }" class="btn btn-xs btn-success"><i
                                        class="fa fa-check"></i></a>
                                </c:if>
                                <a href="deleteOrder?orderid=${olist.id }" class="btn btn-xs btn-danger" data-toggle="tooltip"
                                data-placement="top" title="" data-original-title="削除" onclick="return confirm('注文番号「${olist.id }」を削除してもよろしいですか？');"><i
                                        class="fa fa-trash-o" ></i></a>
                            </div>
                        </td>
                    </tr>
                  </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="fy">
            <ul class="pagination">
                <li><a href="javascript:void(0)">上一页</a></li>
                <li><a href="javascript:void(0)">1</a></li>
                <li><a href="javascript:void(0)">2</a></li>
                <li><a href="javascript:void(0)">3</a></li>
                <li><a href="javascript:void(0)">下一页</a></li>
            </ul>
        </div>
    </div>

    <script>
        $('.dropdown-toggle').dropdown();
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })

        //1、日期范围
        laydate.render({
        elem: '#date'
        ,range: true,
        theme:"#5cb85c"
        });
        
    </script>
</body>

</html>