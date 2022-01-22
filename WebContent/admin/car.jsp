<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>車リスト一覧</title>
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
            <li>車リスト</li>
        </ol>
        <div class="barboxs">
            <button class="btn btn-warning pull-left " data-toggle="tooltip" title="" data-placement="right" data-original-title="下架图片"><i class="fa fa-level-down"></i></button>
            <button class="btn btn-danger pull-left ml10" data-toggle="tooltip" title="" data-placement="right" data-original-title="删除文档"><i class="fa fa-trash-o"></i></button>

            <div class="leftbox">
                <div class="liselect">
                    <select id="val_skill" name="val_skill" class="form-control ">
                        <option value="">发布状态</option>
                        <option value="正常">正常</option>
                        <option value="审核">审核</option>
                    </select>
                </div>
                <form action="searchcars" method="get">
                <div class="ml10">
                    <div class="input-group date input-datepicker mtb0">
                        <input type="text" id="date" placeholder="请选择时间段"
                            name="date" class="form-control cursorpointer" readonly>
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    </div>
                </div>

                <div class="liselect w300 ml10">
                    <div class="input-group">
                        <input type="text" id="example-input-typeahead" class="form-control example-typeahead" placeholder="请输入关键词">
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
                        <th class="text-center">ID</th>
                        <th>車番号</th>
                        <th>ブランド</th>
                        <th>色</th>
                        <th>追加日時</th>
                        <th>レンタル状態</th>
                        <th>車写真</th>
                        <th>料金/日</th>
                        <th class="cell-small text-center"><i class="fa fa-bolt"></i> 操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${carList }" var="clist">
                    <tr>
                        <td class="text-center"><input type="checkbox" id="check5-td1" name="check5-td1">
                        </td>
                        <td class="cell-small text-center">${clist.id }</td>
                        <td>${clist.carno} </td>
                        <td>${clist.brandname} </td>
                        <td>${clist.color} </td>
                        <td>${clist.addtime }</td>
                        <td>${clist.status }</i></td>
                        <td><img alt="dds" src="../${clist.image }"></td>
                        <td>${clist.price }</td>
                        <td class="text-center">
                            <div class="btn-group">
                                <a href="javascript:void(0)" class="btn btn-xs btn-info" data-toggle="tooltip"
                                    data-placement="top" title="" data-original-title="info"><i
                                        class="fa fa-info-circle"></i></a>
                                <a href="javascript:void(0)" class="btn btn-xs btn-success"><i
                                        class="fa fa-pencil"></i></a>
                                <a href="deleteCar?carid=${clist.id } " class="btn btn-xs btn-danger" data-toggle="tooltip"
                                data-placement="top" title="" data-original-title="削除" onclick="return confirm('${clist.carno}を削除してもよろしいですか？');"><i
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