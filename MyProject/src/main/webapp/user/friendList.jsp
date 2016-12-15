<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | User Profile</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/html/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/html/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/html/dist/css/skins/_all-skins.min.css">
  
  <link rel="stylesheet" href="/html/dist/css/skins/_all-skins.min.css">
  

  <!-- profile photo -->

  <link rel="stylesheet" href="/html/assets/css/style.css">  
  <link rel="stylesheet" href="/html/folder-input/folder-input.css">
  <link rel="stylesheet" href="/html/friendList/friend_list.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="/common/headerBar.jsp"></c:import>
  <c:import url="/common/mainSideBar.jsp"></c:import>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <section class="content">

      <div class="row">
			  <!--Pattern HTML-->
			  <div id="pattern" class="pattern">
			    <ul class="list img-list">
			      <li>
			        <a href="#" class="inner">
			          <div class="li-img">
			            <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" />
			          </div>
			          <div class="li-text">
			            <h4 class="li-head">손철준</h4>
			            <p class="li-sub">Summary of content</p>
			            <div class="bt_w">
			             <button class="btn bg-orange margin">팔로워</button>
			            </div>
			          </div>
			        </a>
			      </li>
            <li>
              <a href="#" class="inner">
                <div class="li-img">
                  <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" />
                </div>
                <div class="li-text">
                  <h4 class="li-head">Title of Content</h4>
                  <p class="li-sub">Summary of content</p>
                  <div class="bt_w">
                   <button class="btn bg-orange margin">팔로워</button>
                  </div>
                </div>
              </a>
            </li>			      
            <li>
              <a href="#" class="inner">
                <div class="li-img">
                  <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" />
                </div>
                <div class="li-text">
                  <h4 class="li-head">Title of Content</h4>
                  <p class="li-sub">Summary of content</p>
                  <div class="bt_w">
                   <button class="btn bg-orange margin">팔로워</button>
                  </div>
                </div>
              </a>
            </li>
            <li>
              <a href="#" class="inner">
                <div class="li-img">
                  <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" />
                </div>
                <div class="li-text">
                  <h4 class="li-head">Title of Content</h4>
                  <p class="li-sub">Summary of content</p>
                  <div class="bt_w">
                   <button class="btn bg-orange margin">팔로워</button>
                  </div>
                </div>
              </a>
            </li>	
            <li>
              <a href="#" class="inner">
                <div class="li-img">
                  <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" />
                </div>
                <div class="li-text">
                  <h4 class="li-head">Title of Content</h4>
                  <p class="li-sub">Summary of content</p>
                  <div class="bt_w">
                   <button class="btn bg-orange margin">팔로워</button>
                  </div>
                </div>
              </a>
            </li> 
            <li>
              <a href="#" class="inner">
                <div class="li-img">
                  <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" />
                </div>
                <div class="li-text">
                  <h4 class="li-head">Title of Content</h4>
                  <p class="li-sub">Summary of content</p>
                  <div class="bt_w">
                   <button class="btn bg-orange margin">팔로워</button>
                  </div>
                </div>
              </a>
            </li> 
            <li>
              <a href="#" class="inner">
                <div class="li-img">
                  <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" />
                </div>
                <div class="li-text">
                  <h4 class="li-head">Title of Content</h4>
                  <p class="li-sub">Summary of content</p>
                  <div class="bt_w">
                   <button class="btn bg-orange margin">팔로워</button>
                  </div>
                </div>
              </a>
            </li> 		         
			    </ul>
			  </div>
			  <!--End Pattern HTML-->
      </div>
    </section>
  </div>
  <!-- /.content-wrapper -->
  
  <c:import url="/common/mainFoot.jsp"></c:import>
</div>
<!-- ./wrapper -->


<!-- jQuery 2.2.3 -->
<script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/html/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/html/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/html/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->


<!-- profile photo -->
<script src="/html/assets/js/index.js"></script>
<script src="/html/dist/js/demo.js"></script>
<script src="/html/assets/js/fileinput.js" type="text/javascript"></script>
<script src="/html/dist/js/index.js"></script>
<script src="/html/folder-input/folder-input.js"></script>

</body>
</html>
