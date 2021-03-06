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
  <link rel="stylesheet" href="/html/folder-input/folder-input.css">
  
            <link rel="stylesheet" href="/html/assets/css/style.css">
            <!-- top 5 -->  
<link rel="stylesheet" href="/html/assets/test/css/style.css">
  <!--  -->
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style type="text/css">

    .profilephoto{
        background-size: cover;

    }

    .profilephoto img{
        
        width:100%;
        height:100%;
        float: left;
    }

</style>
  
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
            
              <!-- <li><a href="/user/myTravel" >MyTravel</a></li> -->
              <li><a href="/mapBoard/getNewsFeed?userNo=${targetUser.userNo}" >TimeLine</a></li>
              <c:if test="${targetUser.userNo==user.userNo}">
              <li class="active"><a href="user/getActivity"  data-toggle="tab"; >Activity</a></li>
             <!--  <li><a href="/user/settings.jsp" >Settings</a></li> -->
              </c:if>
            </ul>
            <div class="tab-content">
             
              
              
              <div class="active tab-pane" id="activity">
                <!-- The timeline -->
                <ul class="timeline timeline-inverse">
                  <!-- timeline time label -->
                 <%--  <li class="time-label">
                        <span class="bg-red">
                          ${activity[0].activityDate} 
                        </span>
                  </li> --%>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <%-- <li>
                    <i class="fa fa-envelope bg-blue"></i>

                    <div class="timeline-item" >
                      <span class="time"><i class="fa fa-clock-o"></i> ${activity[2].activityTime}</span>

                      <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>
                        <c:forEach var="i" items="${activity }">
                            <div class="timeline-body" >
	                            ${i.activityText} 
	                      </div>
                        </c:forEach>
                      
                      <div class="timeline-footer">
                        <a class="btn btn-primary btn-xs">Read more</a>
                        <a class="btn btn-danger btn-xs">Delete</a>
                      </div>
                    </div>
    
                  </li> --%>
                  <!-- END timeline item -->
                  <!-- timeline item -->
                  <c:forEach var="i" items="${activity }" varStatus="vs">
                  <li>
                    <i class="fa fa-user bg-aqua"></i>

                    <div class="timeline-item">
                    <c:if test="${vs.last==true}">
                    <span class="time"><i class="fa fa-clock-o"></i> ${user.joinDate}</span>
                    </c:if>
                    <c:if test="${!vs.last==true}">
                      <span class="time"><i class="fa fa-clock-o"></i>${i.activityDate} &nbsp ${i.activityTime}</span>
                    </c:if>
                      <h3 class="timeline-header no-border"><a href="#"><b>M</b>e<b>m</b>o<b>r</b>y</a>  ${i.activityText} 
                      <%-- <c:if test="${i.activityText==activity[0].activityText}">
                      </c:if> --%>
                      <c:if test="${!vs.last==true}">
                            <a id="removeActivity" name="${i.activityNo}" class="btn btn-danger btn-xs">Delete</a>
                      </c:if>
                      </h3>
                    </div>
                  </li>
                  </c:forEach>
                  <!-- END timeline item -->
                  <!-- timeline item -->
                  <%-- <li>
                    <i class="fa fa-comments bg-yellow"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> ${activity[0].activityTime}</span>

                      <h3 class="timeline-header"><a href="#">${user.userName}</a> 님을 Following 하셨습니다.</h3>

                      <div class="timeline-body">
                        ${activity[1].activityText }
                      </div>
                      <div class="timeline-footer">
                        <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                      </div>
                    </div>
                  </li> --%>
                  <!-- END timeline item -->
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-green">
                          3 Jan. 2014
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-camera bg-purple"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                      <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                      <div class="timeline-body">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                      </div>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <li>
                    <i class="fa fa-clock-o bg-gray"></i>
                  </li>
                </ul>
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
<script src="/html/side_menu/side_search.js"></script>

<c:import url="/user/layer.jsp"></c:import>
<script type="text/javascript">

 $(function(){
        $(document).on("click","#removeActivity",function(){
            alert( "제거해줘");
            var name_by_id = $(this).attr('name');
            var aaa =$(this);
            alert(name_by_id);
            
           $.ajax({
               url: "/user/removeActivity?activityNo="+name_by_id,
               method:"GET",
               headers : {
                   "Accept" : "application/json",
                   "Content-Type" : "application/json"
                },
               success : function(JSONData , status) {
                    
                    aaa.parent().parent().parent().remove();
                 }
               
           })          
    });
 });
 </script>
 
    <script src="/html/colorBox/jquery.colorbox-min.js"></script>
  
  <script src="https://cdn.socket.io/socket.io-1.0.0.js"></script>
  
  <script src="/html/common/common.js"></script>
 
</body>
</html>
