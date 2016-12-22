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
  
  <link rel="stylesheet" href="/html/assets/css/style.css">  
  
  <link rel="stylesheet" href="/html/folder-input/folder-input.css">

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
  <!-- Left side column. contains the logo and sidebar -->
  <c:import url="/common/mainSideBar.jsp"></c:import>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <c:import url="/common/profileBar.jsp"></c:import>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <c:import url="/common/profileSideBar.jsp"></c:import>
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li><a href="http://127.0.0.1:8080/user/myTravel " >MyTravel</a></li>
              <li class="active"><a href="#timeline" >TimeLine</a></li>
              <li><a href="http://127.0.0.1:8080/user/getActivity " >Activity</a></li>
              <li><a href="http://127.0.0.1:8080/user/settings.jsp" >Settings</a></li>
            </ul>
            
            <div class="tab-content">
              
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                <c:forEach var="photoFolder" items="${newsfeed}">
                 <div class="post">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="/html/dist/img/user7-128x128.jpg" alt="user image">
                        <span class="username">
                          <a href="#">${photoFolder.user.userName }</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">${photoFolder.user.userId} - ${photoFolder.photoDate}</span>
                  </div>
                  <c:if test="${!photoFolder.photoTheme.isEmpty()}">
	                  <div class="row margin-bottom">
	                    <div class="col-sm-6">
	                     <c:forEach var="photoTheme" items="${photoFolder.photoTheme}">
	                      <c:if test="${!photoTheme.photoList.isEmpty()}">
	                       <img class="img-responsive" src="/html/assets/img/uploadedPhoto/${photoTheme.photoList.get(0).folderName}" alt="Photo">
	                      </c:if>
	                     </c:forEach>
	                    </div>
	                    <!-- /.col -->
	                    <div class="col-sm-6">
	                      
	                    </div>
	                    <!-- /.col -->
	                  </div>
                  </c:if>
                  <p>
                    ${photoFolder.text}
                  </p>
                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                    <li class="pull-right">
                      <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                        (5)</a></li>
                  </ul>
                   <div class="box-footer box-comments">
                      <c:forEach var="commentList" items="${photoFolder.commentList}">
                        <div class="box-comment">
                          <!-- User image -->
                          <img class="img-circle img-sm"
                            src="/html/dist/img/user3-128x128.jpg" alt="User Image">
  
                          <div class="comment-text">
                            <span class="username"> ${commentList.userId}<span  
                              class="text-muted pull-right">${commentList.date}</span>
                            </span>
                            <!-- /.username -->
                            ${commentList.text}
                          </div>
                          <!-- /.comment-text -->
                        </div>
                      </c:forEach>
                      <!-- /.box-comment -->

                      <!-- /.box-comment -->
                    </div>
                    <div class="box-footer">
                      <form action="/mapBoard/setComment" method="post">
                        <img class="img-responsive img-circle img-sm"
                          src="/html/dist/img/user4-128x128.jpg" alt="Alt Text">
                        <!-- .img-push is used to add margin to elements next to floating images -->
                        <div class="img-push">
                          <input type="hidden" value="${myUser.userNo}" name="userNo" >
                          <input type="hidden" value="${photoFolder.pfNo}" name="folderNo" >
                          <input type="text" class="form-control input-sm"
                            placeholder="Press enter to post comment" name="text">
                        </div>
                      </form>
                    </div>
                 </div>
                </c:forEach>
                  <!-- /.user-block -->
                  
                  
                  



                <!-- /.post -->

                <!-- Post -->
                <div class="post clearfix">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="/html/dist/img/user7-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Sarah Ross</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">Sent you a message - 3 days ago</span>
                  </div>
                  <!-- /.user-block -->
                  <div class="row margin-bottom">
                    <div class="col-sm-6">
                      <img class="img-responsive" src="/html/dist/img/photo1.png" alt="Photo">
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                      <div class="row">
                        <div class="col-sm-6">
                          <img class="img-responsive" src="/html/dist/img/photo2.png" alt="Photo">
                          <br>
                          <img class="img-responsive" src="/html/dist/img/photo3.jpg" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <img class="img-responsive" src="/html/dist/img/photo4.jpg" alt="Photo">
                          <br>
                          <img class="img-responsive" src="/html/dist/img/photo1.png" alt="Photo">
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->
                    </div>
                    <!-- /.col -->
                  </div>
                  
                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm" data-js="twitter-share"><i class="fa fa-share margin-r-5"></i>Share on Twitter</a></li>
                    <li><a href="#" class="link-black text-sm" data-js="facebook-share"><i class="fa fa-share margin-r-5"></i> Share On Facebook</a></li>
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                    <li class="pull-right">
                      <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                        (5)</a></li>
                  </ul>

                  <form class="form-horizontal">
                    <div class="form-group margin-bottom-none">
                      <div class="col-sm-9">
                        <input class="form-control input-sm" placeholder="Response">
                      </div>
                      <div class="col-sm-3">
                        <button type="submit" class="btn btn-danger pull-right btn-block btn-sm">Send</button>
                      </div>
                    </div>
                  </form>
                </div>
                <!-- /.post -->

                <!-- Post -->
                <div class="post">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="/html/dist/img/user6-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">Posted 5 photos - 5 days ago</span>
                  </div>
                  <!-- /.user-block -->
                  <div class="row margin-bottom">
                    <div class="col-sm-6">
                      <img class="img-responsive" src="/html/dist/img/photo1.png" alt="Photo">
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                      <div class="row">
                        <div class="col-sm-6">
                          <img class="img-responsive" src="/html/dist/img/photo2.png" alt="Photo">
                          <br>
                          <img class="img-responsive" src="/html/dist/img/photo3.jpg" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <img class="img-responsive" src="/html/dist/img/photo4.jpg" alt="Photo">
                          <br>
                          <img class="img-responsive" src="/html/dist/img/photo1.png" alt="Photo">
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->
                    </div>
                    <!-- /.col -->
                  </div>
                  <!-- /.row -->

                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                    <li class="pull-right">
                      <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                        (5)</a></li>
                  </ul>

                                    <form class="form-horizontal">
                    <div class="form-group margin-bottom-none">
                      <div class="col-sm-9">
                      </div>
                      <div class="col-sm-3">
                        <button type="submit" class="btn btn-danger pull-right btn-block btn-sm">Send</button>
                      </div>
                    </div>
                  </form>
                </div>
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              
              <!-- /.tab-pane -->
              
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<c:import url="/common/mainFoot.jsp"></c:import>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<!-- input_folder popup -->
<div id="popup1" class="overlay">
	<form action="/mapBoard/addFolder" method="post">
	  <div class="popup">
	    <h2>PhotoBorad input</h2>
	    <a class="close">&times;</a>
	    <div class="box box-warning">
	      <div class="box-header with-border">
	        <h3 class="box-title">pomnwq@naver.com</h3>
	      </div>
	            <!-- /.box-header -->
	     <div class="box-body">
	       <form role="form">
	                  <!-- text input -->
	         <div class="form-group">
	            <label>Title</label>
	            <input name="title" type="text" class="form-control" placeholder="Enter ...">
	         </div>
	  
	        <!-- textarea -->
	        <div class="form-group">
	           <label>Comment</label>
	           <textarea name="text"class="form-control" rows="3" placeholder="Enter ..."></textarea>
	        </div>
	        <button type="submit" class="btn btn-block btn-primary btn-flat">summit</button>
	                 
	      </div>
	    </div>
	    <!--box box-warning-->
	  </div>
	</form>
</div>
<!-- input_folder popup end -->

<!-- jQuery 2.2.3 -->
<script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/html/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/html/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/html/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/html/dist/js/demo.js"></script>

<script type="text/javascript">
var twitterShare = document.querySelector('[data-js="twitter-share"]');

twitterShare.onclick = function(e) {
  e.preventDefault();
  var twitterWindow = window.open('https://twitter.com/share?url=' + document.URL, 'twitter-popup', 'height=350,width=600');
  if(twitterWindow.focus) { twitterWindow.focus(); }
    return false;
  }

var facebookShare = document.querySelector('[data-js="facebook-share"]');

facebookShare.onclick = function(e) {
  e.preventDefault();
  var facebookWindow = window.open('https://www.facebook.com/sharer/sharer.php?u=' + document.URL, 'facebook-popup', 'height=350,width=600');
  if(facebookWindow.focus) { facebookWindow.focus(); }
    return false;
}
</script>
 <script src="/html/assets/js/fileinput.js" type="text/javascript"></script>
<script src="/html/dist/js/index.js"></script>
<script type="text/javascript">
$("#fileUpload").fileinput({    
    language: 'LANG',
    uploadUrl: 'user/fileUpload/post',
    uploadAsync: true,
    autoStart: true,
    allowedFileExtensions : ['jpg', 'png','gif']   
});


</script>

<script src="/html/folder-input/folder-input.js"></script>




</body>
</html>
