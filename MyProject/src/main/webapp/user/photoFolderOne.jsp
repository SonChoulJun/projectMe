<%@page import="kr.co.bitcamp.service.domain.PhotoFolder"%>
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
  

  <!-- profile photo -->

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
    <section class="content">

      <div class="row">

        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#myTravel" data-toggle="tab">MyTravel</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="myTravel">
                 <div class="post">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="/html/dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          <a href="#">${photoFolderOne.title}</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">${photoFolderOne.photoDate}</span>
                  </div>
                  
                  <div class="row margin-bottom">
                    <div class="col-sm-6" >
                      <div class="img-responsive" id="map" style="height: 400px; margin:0px auto;"></div>
                    </div>
                  </div>
                </div>
              </div>
              
          
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


<!-- profile photo -->
<script src="/html/assets/js/index.js"></script>


<script src="/html/dist/js/demo.js"></script>
<script src="/html/assets/js/fileinput.js" type="text/javascript"></script>
<script src="/html/dist/js/index.js"></script>
<script src="/html/folder-input/folder-input.js"></script>

<%
  PhotoFolder folder = (PhotoFolder)request.getAttribute("photoFolderOne"); 
  System.out.print(folder.getPhotoTheme().get(1).getPhotoList().get(0).getFolderName());
%>
<script type="text/javascript">
  function initMap() {
  var locations = [
                   
                   <%for(int i=0;i<folder.getPhotoTheme().size();i++){%>
                    {lat: <%=folder.getPhotoTheme().get(i).getPhotoList().get(0).getGpsB()%>, lng: <%=folder.getPhotoTheme().get(i).getPhotoList().get(0).getGpsH()%>},
                   <%}%>
                 ];
  


                 var map = new google.maps.Map(document.getElementById('map'), {
                   zoom: 10,
                   center: new google.maps.LatLng(<%=folder.getPhotoTheme().get(0).getPhotoList().get(0).getGpsB()%>, <%=folder.getPhotoTheme().get(0).getPhotoList().get(0).getGpsH()%>),
                   mapTypeId: google.maps.MapTypeId.ROADMAP
                 });
                
                  var lineSymbol = {
                        path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
                    };
                  var flightPath = new google.maps.Polyline({
                      path: locations,
                      geodesic: true,//거리는 기본적으로 미터 단위로 계산 or 픽셀단위
                      strokeColor: '#FF0000',
                      strokeOpacity: 1.0, //불투명도 1.0(불투명)~0.0(투명)
                      strokeWeight: 2, // 두께
                      icons: [{
                          icon: lineSymbol,
                          offset: '100%'
                        }],
                        map: map
                    });
                  animateCircle(flightPath);
                 //flightPath.setMap(map); 
                    
                 var infowindow = new google.maps.InfoWindow();

                 var marker, i;
                /*  var image = {
                     url: i+'.png',
                     //size: new google.maps.Size(100, 100),
                     origin: new google.maps.Point(0, 0),
                     anchor: new google.maps.Point(0, 32),
                     scaledSize: new google.maps.Size(50, 50)
                 } */
                    
                 for (i = 0; i < locations.length; i++) {
                	 <%
                	  int i =-1;
                	  i++;
                	 %>
                   marker = new google.maps.Marker({
                     position: locations[i],
                     map: map,
                     icon: image= {
                             url: '/html/assets/img/uploadedPhoto/<%=folder.getPhotoTheme().get(i).getPhotoList().get(0).getFolderName()%>',
                             //size: new google.maps.Size(100, 100),
                             origin: new google.maps.Point(0, 0),
                             anchor: new google.maps.Point(0, 32),
                             scaledSize: new google.maps.Size(50, 50)
                     }
                   });
                   
                   
                   

                   google.maps.event.addListener(marker, 'click', (function(marker, i) {
                     return function() {
                       //infowindow.setContent(locations[i][1]);
                       //infowindow.open(map, marker);
                       //marker.map.setZoom(13); 
                       window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
                      
                     }
                     
                   })(marker, i));
                 }
                 
  }
  
  function animateCircle(line) {
      var count = 0;
      window.setInterval(function() {
        count = (count + 1) % 200;

        var icons = line.get('icons');
        icons[0].offset = (count / 2) + '%';
        line.set('icons', icons);
    }, 20);
  }
  </script>
   <script src="http://maps.google.com/maps/api/js?key=AIzaSyAtigIrLnYLdIioQQT2bn9jZCiXk52JAuw&signed_in=true&callback=initMap" 
          type="text/javascript"></script>




</body>
</html>