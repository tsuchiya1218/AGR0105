<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            <li>車追加</li>
        </ol>


        <div class="tabli">
            <span>車詳細情報入力</span>
        </div>

        <div class="tabbody">
            <div class="bodyli active">
                <!-- ///// -->
                <form action="addcar" method="post" enctype="multipart/form-data">
                <div class="inputbox">
                    <span class="title"><em class="s-red">*</em> ブランド</span>
                    <div class="inputright">
                        <select id="example-select" name="brandname" class="form-control input-sm">
                            <option>スーパーカー</option>
                            <option>ミニカー</option>
                            <option></option>
                            <option></option>
                            <option></option>
                        </select>
                    </div>
                </div>
                <!-- ///// -->
                <div class="inputbox">
                    <span class="title">車名称</span>
                    <div class="inputright">
                        <input type="text" name="carno" class="form-control input-sm">
                    </div>
                </div>
                <!-- ///// -->
                <div class="inputbox">
                    <span class="title">色</span>
                    <div class="inputright">
                        <input type="text" name="color" class="form-control input-sm">
                    </div>
                </div>
                 <!-- ///// -->
                 <div class="inputbox">
                    <span class="title">価格</span>
                    <div class="inputright">
                        <input type="number" name="price" class="form-control input-sm">
                    </div>
                </div>

                <!-- ///// -->
                <div class="inputbox">
                    <span class="title">車写真</span>
                    <div class="inputright">
                        <input type="text"  class="form-control input-sm">
                        <label class="btn btn-success btn-sm" for="uploadimg"><i class="fa fa-file-photo-o"></i></label>
                        <input type="file" id="uploadimg" name="image" style="display: none;">
                      
                    </div>
                </div>

                 <!-- ///// -->
                 <div class="inputbox">
                    <span class="title">詳細情報</span>
                    <div class="inputright">
                        <input type="text" name="info" class="form-control input-sm">
                    </div>
                </div>
    	
            </div>
            
        </div>
        <div class="tbfooter">
            <button class="btn btn-success"><i class="fa fa-floppy-o"></i>追加</button>
        </div>
        </form>
    </div>

 
</body>

</html>