<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会員情報一覧</title>
    <script src="./component/js/JQuery2.1.4.js"></script>
    <link rel="stylesheet" href="./component/style/components.css">
    <script src="./component/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/themes.css">
</head>

<body>
    <div id="body">
        <ol class="breadcrumb">
            <li class="active"><a href="#">システム</a></li>
            <li>会員リスト</li>
        </ol>
         <c:if test="${isdeleted ==true}">
       		<div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	削除しました。
        </div>
       	</c:if>
       	   <c:if test="${isdeleted ==false}">
       		<div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            	レンタル利用中のユーザーは削除できませんでした。
        </div>
       	</c:if>
        <div class="barboxs">

          <!--   <button 
                class="btn btn-success pull-left " 
                data-toggle="modal" data-target="#myModal"
                title="" 
                data-placement="right"
                data-original-title="添加会员">
                <i class="fa fa-pencil-square-o"></i>
            </button>

            <button class="btn btn-danger pull-left ml10" data-toggle="tooltip" title="" data-placement="right" data-original-title="删除会员"><i class="fa fa-trash-o"></i></button>
 -->
            <div class="leftbox">
              

                <div class="liselect w300">
                <form action="searchusers" method="get">
                    <div class="input-group">
                        <input type="text" id="example-input-typeahead" name="search" class="form-control example-typeahead"　 placeholder="ユーザー名で検索">
                 
                        <span class="input-group-btn">
                            <button class="btn btn-success"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                  </form>
                </div>
            </div>
        </div>
        <div class="tablebox">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="text-center" width="50"><input type="checkbox" id="check5-all" name="check5-all"></th>
                        <th class="text-center">ID</th>
                        <th>ユーザー名</th>
  						<th>生年月日</th>
  						<th>免許番号</th>
  						<th>期限</th>
  						<th>電話番号</th>
                        <th>Email</th>
                        <th>アドレス</th>
                        <th>緊急連絡人</th>
                        <th>緊急連絡先</th>
                        <th>登録日</th>
                        <th class="text-center" width="85"><i class="fa fa-bolt"></i> 操作</th>
                    </tr>
                </thead>
                <tbody>
          
				<c:forEach items="${userList }" var="ulist">
					<tr>
                        <td class="text-center"><input type="checkbox" id="check5-td1" name="check5-td1"></td>
                        <td class="cell-small text-center">${ulist.id} </td>
                        <td>${ulist.username }</td>
                        <td>${ulist.birthday }</td>
                        <td>${ulist.drivelicense }</td>
                        <td>${ulist.expiredate }</td>
                        <td>${ulist.tel }</td>
                        <td>${ulist.email }</td>
                        <td>${ulist.address }</td>
                        <td>${ulist.emegname }</td>
                        <td>${ulist.emegtel }</td>
                        <td>${ulist.regdate }</td>
                        <td class="text-center">
                            <div class="btn-group">
                                <a href="javascript:void(0)" class="btn btn-xs btn-info"><i class="fa fa-globe"></i></a>
                                <a href="javascript:void(0)" class="btn btn-xs btn-success"><i
                                        class="fa fa-pencil"></i></a>
                                <a href="deleteuser?uid=${ulist.id }" class="btn btn-xs btn-danger" data-toggle="tooltip"
                                data-placement="top" title="" data-original-title="削除" onclick="return confirm('${ulist.username}を削除してもよろしいですか？');"><i
                                        class="fa fa-trash-o" ></i></a>
                            </div>
                        </td>
                    </tr>
				</c:forEach>
              
                </tbody>
            </table>
        </div>

        
    </div>

    
    <!-- 000 -->

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">添加会员</h4>
            </div>
            <div class="modal-body">



                <div class="form-group">
                    <label for="exampleInputEmail1">会员名称</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="请输入">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">会员密码</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="请输入">
                </div>

                <div class="form-group  ">
                    <label for="exampleInputEmail1">会员状态</label>
                    <div>
                        <label class="radio-inline" for="example-radio-inline1">
                            <input type="radio" id="example-radio-inline1" name="example-radios-inline" value="option1">
                            正常&emsp;
                        </label>
                        <label class="radio-inline" for="example-radio-inline1">
                            <input type="radio" id="example-radio-inline1" name="example-radios-inline" value="option1">
                            未激活&emsp;
                        </label>
                        <label class="radio-inline" for="example-radio-inline1">
                            <input type="radio" id="example-radio-inline1" name="example-radios-inline" value="option1">
                            禁用
                        </label>
                    </div>
                </div>
               
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                <button class="btn btn-success">创建</button>
            </div>
        </div>
        </div>
    </div>


  <!-- 000 -->
    <script>
        $('.dropdown-toggle').dropdown();
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        
    </script>
</body>

</html>