<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoGoCar AdminSystem</title>
    <link rel="stylesheet" href="./component/style/components.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="css/main.css">

    <link rel="stylesheet" href="css/themes.css">
    <script src="./component/js/JQuery2.1.4.js"></script>
    <script src="./component/plugins/layer/layer.js"></script>
</head>


<body>
   <div id="system">
        <header>
            <div class="left">
                <a href="">
                    <i class="gi gi-leaf"></i> GoGo Car· <small>Admin</small>
                </a>
            </div>
            <div class="right">
            	<c:if test="${sessionScope.admin==null }">
            		<!--  <a href="login.html" title="ログイン">
                   		<i class="fa fa-user"></i>
                	</a> --> 
                	<%response.sendRedirect("login.jsp"); %>
            	</c:if>
               <c:if test="${sessionScope.admin!=null }">
					  <a href="logout" title="ログアウト">
                    <i class="fa fa-power-off"></i>
               		 </a>
				</c:if>

            </div>
        </header>
        <section class="body">
            <div class="left">
                <div class="navbar">
                    <dl>
                        <dt><a href="controlpanel.jsp" target="rightiframe"><i class="fa fa-fw fa-tachometer"></i><span>管理画面</span></a></dt>
                    </dl>



                    <dl>
                        <dt><i class="fa fa-car"></i> <span>車両管理</span></dt>
                        <dd>
                            <div class='li'>
                                <a href="showcars" target="rightiframe"><i class="fa fa-fw fa-angle-right"></i><span>車両リスト</span></a>
                            </div>
                           <!--  <div class='li'>
                                <a href="car_create.jsp" target="rightiframe"><i class="fa fa-fw fa-angle-right"></i><span>車リスト追加</span></a>
                            </div> -->
                        </dd>
                    </dl>



                    <dl>
                        <dt><i class="fa fa-fw fa-users"></i> <span>会員管理</span></dt>
                        <dd>
                            <div class='li'>
                                <a href="showusers" target="rightiframe"><i class="fa fa-fw fa-angle-right"></i><span>会員リスト</span></a>
                            </div>
                        </dd>
                    </dl>
                    
                     <dl>
                        <dt><i class="fa fa-file-text"></i> <span>注文管理</span></dt>
                        <dd>
                            <div class='li'>
                                <a href="showorders" target="rightiframe"><i class="fa fa-fw fa-angle-right"></i><span>注文一覧</span></a>
                            </div>
                        </dd>
                    </dl>
                    
                    <dl>
                        <dt><i class="fa fa-file-text"></i> <span>売上分析</span></dt>
                        <dd>
                            <div class='li'>
                                <a href="statistics.jsp" target="rightiframe"><i class="fa fa-fw fa-angle-right"></i><span>売上グラフ</span></a>
                            </div>
                        </dd>
                    </dl>

				

                </div>
             
            </div>
            <div class="right">
                <iframe src="controlpanel.jsp" frameborder="0" id="rightiframe" name="rightiframe"></iframe>
            </div>
        </section>
        <div class="rightmask"></div>
   </div>

   <script>
       $('.navbar dl dt').click(function () {
            if (!$(this).siblings('dd').hasClass('active')) {
                $('.navbar dl dd').removeClass('active');
                $(this).siblings('dd').removeClass('active');
                $(this).siblings('dd').addClass('active');
            } else {
                $('.navbar dl dd').removeClass('active');
                $(this).siblings('dd').removeClass('active');
            }

            if (!$(this).hasClass('activeTop')) {
                $('.navbar dl dt').removeClass('activeTop');
                $(this).removeClass('activeTop');
                $(this).addClass('activeTop');
            } else {
                $('.navbar dl dt').removeClass('activeTop');
                $(this).removeClass('activeTop');
            }
        })

        $('.navbar .li a').click(function(){
            $('.navbar .li a').removeClass('activelinks');
            $(this).addClass('activelinks');
        })

        $('.body .left').hover(function(){
            $('.rightmask').addClass('show');
        },function(){
            $('.rightmask').removeClass('show');
        })
   </script>
   
  
</body>

</html>