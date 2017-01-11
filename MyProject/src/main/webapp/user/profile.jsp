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
  
  <!-- top5  -->
  <link rel="stylesheet" href="/html/assets/test/css/style.css">
  
  <!-- likeAnimate -->
  <link rel="stylesheet" href="/html/assets/likeAnimate/style.css">
  

  <!-- profile photo -->

  <link rel="stylesheet" href="/html/assets/css/style.css">  
  
  <link rel="stylesheet" href="/html/folder-input/folder-input.css">
 
   <!--profile follow modal -->
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
  <link rel="stylesheet" href="/html/assets/followmodal/style.css"> 
  
  
  <link rel="stylesheet" href="/html/colorBox/colorbox1.css" />
  
  

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
    
    /* .floating{
   overflow:auto;
    position: fixed;
    border-radius: 3px;
    background: #ffffff;
    border-top: 3px solid #d2d6de;
    margin-bottom: 20px;
    width: 20%;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);  */

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
              <!-- <li class="active"><a href="#myTravel" data-toggle="tab">MyTravel</a></li> -->
              <li class="active"><a href="/mapBoard/getNewsFeed?userNo=${targetUser.userNo}" data-toggle="tab">TimeLine</a></li>
              <c:if test="${targetUser.userNo==myUser.userNo}">
              <li><a href="/user/getActivity" >Activity</a></li>
             <!--  <li><a href="/user/settings.jsp" >Settings</a></li> -->
              </c:if>
            </ul>
            
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                                <!-- Post -->
                                <c:if test="${empty newsfeed}">
                                    <img src="/html/assets/img/uploadedPhoto/default.jpg" alt="no image" style="width:1150px; height: 620px;">
                                
                                </c:if>
                                
                                <c:if test="${newsfeed!=null}">
                                <c:forEach var="photoFolder" items="${newsfeed}">
                                    <div class="post" name="aaa">
                                        <div class="user-block">
                                            <img class="img-circle img-bordered-sm"
                                                src="/html/dist/img/user7-128x128.jpg" alt="user image">
                                            <span class="username"> <a href="/profile/subProfile?userId=${photoFolder.user.userId}">${photoFolder.user.userName }</a>
                                                <a href="#" class="pull-right btn-box-tool"><i
                                                    class="fa fa-times"></i></a>
                                            </span> <span class="description">${photoFolder.user.userId}
                                                - ${photoFolder.photoDate}</span>
                                        </div>
                                        <c:if test="${!photoFolder.photoTheme.isEmpty()}">
                                            <div class="row margin-bottom" onclick="pageMove(${photoFolder.pfNo})" >

                                                <%--                         <c:forEach var="photoTheme" items="${photoFolder.photoTheme}">
                          <c:if test="${!photoTheme.photoList.isEmpty()}">
                           <img class="img-responsive" src="/html/assets/img/uploadedPhoto/${photoTheme.photoList.get(0).folderName}" alt="Photo">
                          </c:if>
                         </c:forEach> --%>
                                                <c:set var="item1" value="0" scope="request"></c:set>
                                                <div class="col-sm-6">
                                                    <img class="img-responsive"
                                                        src="/html/assets/img/uploadedPhoto/${photoFolder.photoTheme.get(item1).photoList.get(0).folderName}"
                                                        alt="Photo">
                                                </div>
                                                <c:if test="${item1+1==photoFolder.photoTheme.size()}">
                                                    <c:set var="item1" value="0" scope="request"></c:set>
                                                </c:if>
                                                <c:if test="${item1+1!=photoFolder.photoTheme.size()}">
                                                    <c:set var="item1" value="${item1+1}" scope="request"></c:set>
                                                </c:if>
                                                <!-- /.col -->
                                                <div class="col-sm-6">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <img class="img-responsive"
                                                                src="/html/assets/img/uploadedPhoto/${photoFolder.photoTheme.get(item1).photoList.get(0).folderName}"
                                                                alt="Photo"> <br>
                                                            <c:if test="${item1!=photoFolder.photoTheme.size()}">
                                                                <c:set var="item1" value="${item1+1}" scope="request"></c:set>
                                                            </c:if>
                                                            <c:if test="${item1==photoFolder.photoTheme.size()}">
                                                                <c:set var="item1" value="0" scope="request"></c:set>
                                                            </c:if>


                                                            <img class="img-responsive"
                                                                src="/html/assets/img/uploadedPhoto/${photoFolder.photoTheme.get(item1).photoList.get(0).folderName}"
                                                                alt="Photo">
                                                            <c:if test="${item1!=photoFolder.photoTheme.size()}">
                                                                <c:set var="item1" value="${item1+1}" scope="request"></c:set>
                                                            </c:if>
                                                            <c:if test="${item1==photoFolder.photoTheme.size()}">
                                                                <c:set var="item1" value="0" scope="request"></c:set>
                                                            </c:if>


                                                        </div>
                                                        <!-- /.col -->
                                                        <div class="col-sm-6">
                                                            <img class="img-responsive"
                                                                src="/html/assets/img/uploadedPhoto/${photoFolder.photoTheme.get(item1).photoList.get(0).folderName}"
                                                                alt="Photo"> <br>
                                                            <c:if test="${item1!=photoFolder.photoTheme.size()}">
                                                                <c:set var="item1" value="${item1+1}" scope="request"></c:set>
                                                            </c:if>
                                                            <c:if test="${item1==photoFolder.photoTheme.size()}">
                                                                <c:set var="item1" value="0" scope="request"></c:set>
                                                            </c:if>
                                                            <img class="img-responsive"
                                                                src="/html/assets/img/uploadedPhoto/${photoFolder.photoTheme.get(item1).photoList.get(0).folderName}"
                                                                alt="Photo">
                                                        </div>
                                                        <!-- /.col -->
                                                    </div>
                                                    <!-- /.row -->
                                                </div>

                                            </div>
                                        </c:if>
                                        <p>${photoFolder.text}</p>
                                        <ul class="list-inline">
                                            <button type="button" class="btn btn-default btn-xs">
                                                <i class="fa fa-share"></i> Share
                                            </button>
                                            <c:if test="${photoFolder.likeCode==0}">
                                                <button id="likeBt" type="button"
                                                    class="btn btn-default btn-xs" style="color: #444">
                                                    <div name="${myUser.userNo}"></div>
                                                    <div name="${photoFolder.pfNo}"></div>
                                                    <div name="${photoFolder.likeCode}"></div>
                                                    <i class="fa fa-thumbs-o-up"></i> Like
                                                </button>

                                            </c:if>
                                            <c:if test="${photoFolder.likeCode!=0}">
                                                <button id="likeBt" type="button"
                                                    class="btn btn-default btn-xs" style="color: blue">
                                                    <div name="${myUser.userNo}"></div>
                                                    <div name="${photoFolder.pfNo}"></div>
                                                    <div name="${photoFolder.likeCode}"></div>
                                                    <i class="fa fa-thumbs-o-up"></i> Like
                                                </button>

                                            </c:if>

                                            <span id="likeCount" class="pull-right text-muted"><a id="LikeMember"
                                               name="${photoFolder.pfNo}" href="#" data-target="#LikeMembers" data-toggle="modal" >${photoFolder.likeCount} likeCount</a></span>
                                                <!-- ====================== -->
                                                <div class="modal fade" id="LikeMembers">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                                       <!--  header title -->
                                                        <h4 class="modal-title">프로필 사진</h4>
                                                    </div>
                                                    
                                                    <!--body-->
                                                    <div  class="modal-body" >
                                                        <div class="row">
                                                            <div id="LikeUsers" class="pattern">
                                                                
                                                               <!--  <textarea name ="status" class="form-control" id="statusMessage" placeholder=${targetUser.status}></textarea> -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                   <!-- Footer -->
                                                    <div class="modal-footer">
                                                        Footer
                                                        <button type="button" class="btn btn-default"
                                                            data-dismiss="modal">닫기</button>
                                                    </div>
                                                </div>
                                            </div> 
                                         </div>
                                                
                                                <!-- ====================== -->
                                                
                                            <span class="pull-right text-muted" id="CountReset"><a href="#"
                                                id="commentCount">${photoFolder.commentCount} comment</a></span>
                                        </ul>
                                        <div id="CommentBox" class="box-footer box-comments">
                                            <c:forEach var="commentList"  items="${photoFolder.commentList}">
                                                <div class="box-comment">
                                                    <!-- User image -->
                                                    <img class="img-circle img-sm"
                                                        src="/html/dist/img/profile/${commentList.profileImg}" alt="User Image" 
                                                        onerror="this.src='/html/dist/img/defaultImage.jpg';">

                                                    <div class="comment-text">
                                                    
                                                        <span class="username"> ${commentList.userId} 
                                                        <c:if test="${commentList.userNo==myUser.userNo||photoFolder.user.userNo==myUser.userNo}">
                                                        <span
                                                            class="text-muted pull-right">
                                                            
                                                            <Button
                                                                    id="removebtn" name="${commentList.commentNo}"
                                                                    style="width: 100%; height: 100%;">
                                                                    X
                                                                    <div name="${myUser.userNo}"></div>
                                                                    <div name="${photoFolder.pfNo}"></div>
                                                                    <div name="${photoFolder.user.userNo}"></div>
                                                                </button>
                                                       </span> 
                                                                <br /> 
                                                       </c:if>
                                                                <span class="text-muted pull-right">${commentList.date}</span>


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
                                        <div id="commentInput" class="box-footer">
                                            <%--                       <form action="/mapBoard/setComment" method="post">
                        <img class="img-responsive img-circle img-sm"
                          src="/html/dist/img/user4-128x128.jpg" alt="Alt Text">
                        <!-- .img-push is used to add margin to elements next to floating images -->
                        <div class="img-push">
                          <input type="hidden" value="${myUser.userNo}" name="userNo" >
                          <input type="hidden" value="${photoFolder.pfNo}" name="folderNo" >
                          <input type="text" class="form-control input-sm"
                            placeholder="Press enter to post comment" name="text">
                        </div>
                      </form> --%>
                                            <div class="form-horizontal">
                                                <div class="form-group margin-bottom-none">
                                                    <div class="col-sm-9">
                                                        <input class="form-control input-sm"
                                                            placeholder="Response">
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <button id="sendCommentBt"
                                                            class="btn btn-danger pull-right btn-block btn-sm">
                                                            Send
                                                            <div name="${myUser.userNo}"></div>
                                                            <div name="${photoFolder.pfNo}"></div>
                                                            <div name="${photoFolder.user.userNo}"></div>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                                </c:if>
                                <!-- /.user-block -->

                            </div>
                            
              <!-- tab-pane timeLine remove -->
              
              <!-- tab-pane activity remove -->
              
              
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
<%-- <c:import url="/common/aaa.jsp"></c:import> --%>


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

<!-- <script src="/html/dist/js/index.js"></script> -->


<script type="text/javascript">

$("#getval").on('change', function(e){
	console.log("zz");
	var date=new Date();
	var files = e.target.files;
	var data = new FormData();
	$.each(files, function(key, value)
			 {
			  //key는 다른 지정이 없다면 0부터 시작 할것이고, value는 파일 관련 정보입니다.
			  data.append(key, value);
			 });	
	$.ajax({
	    url: '/profile/addprfphoto',
	    type: "post",
	    dataType: "json",
	    data: data,
	    cache: false,
	    processData: false,
	    contentType: false,
	    success: function(data, textStatus, jqXHR)
        {
	    	
 	     
	    console.log(data.originalFilename);
	    $("#profile-upload").css("background-image","url('/html/dist/img/profile/"+data.originalFilename+"')");
         if(typeof data.error === 'undefined') //에러가 없다면
         {
        	 console.log(data);
        	 location.href="/profile/mainProfile";
        	 
         }
         else//에러가 있다면
         {
          console.log('ERRORS: ' + data.error);
         }
        },
        error: function(jqXHR, textStatus, errorThrown)
        {
         console.log('ERRORS: ' + textStatus);
        }
	});
});
</script>

<script src="/html/folder-input/folder-input.js"></script>
<script src="/html/side_menu/side_search.js"></script>
<script type="text/javascript">
$(function() {
    $("#follwerBt").on("click",function() {
        //Debug..
        alert(  "팔로워" );
        
        $.ajax( 
            {
              url : "/user/addFollower?followNo=${targetUser.userNo}&userNo=${myUser.userNo}&followId=${targetUser.userId}",
               method :"POST",
              dataType : "json" ,
              headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
              },
              success : function(JSONData , status) {
            	  if(JSONData.followOk=="insert"){
            		  $("#FollowerCount").text(JSONData.followCount);
            		  $("#follwerBt").text("팔로워해제");
            	  }else{
            		  $("#FollowerCount").text(JSONData.followCount);
            		  $("#follwerBt").text("팔로워");
            	  }
              }
          });
        
          ////////////////////////////////////////////////////////////////////////////////////////////
        
    });
  }); 
</script>
<!-- <script type="text/javascript">
        $(function(){
            $("#FollowerCount").click(function(){
                $('div.modal').modal();
            })
        })
</script> -->

<!-- <script type="text/javascript">
$(function() {
    $("#FollowerCount").on("click",function() {
        //Debug..        
        $.ajax( 
            {
              url : "/user/getFollower/${targetUser.userNo}",
               method :"GET",
              headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
              },
              success : function(followerList){
            	  $('#bodyModal').html("");
            	    for(var i=0 ; i<followerList.length ;i++){
            	    	
            	    	 var row ='';
            	    	 row+='<li><a href="/profile/subProfile?userId=pomnwq@naver.com" class="inner">';
            	    	row+='<div class="li-img">';
            	    	row+=' <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" /> </div>';
            	    	row+='<div class="li-text">';
            	    	row+='<h4 class="li-head">'+followerList[i].userName+'</h4>';
            	    	row+='<p class="li-sub">2016-12-21</p></div></a></li>';
            	    	
            	    	 $('#bodyModal').append(row);
            	    	
            	    	
            	    }
            	
            
            	  $('div.modal').modal(); 
              }
          });
          ////////////////////////////////////////////////////////////////////////////////////////////
       
    });
    
  }); 
</script> -->
<c:import url="/user/layer.jsp"></c:import>
<%-- <c:import url="/user/Following.jsp"> --%>
<!-- <script type="text/javascript">
   $(function(){
	   $("#myModal").on("click",function(){
		   $.ajax({
			   url : "/user/getFollower/${targetUser.userNo}"
		   })
	   })
   })

    function show(str){
        //show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
        
        //얻어온 값을 이용하여, modal 에서 동적으로 바뀌어야 하는 값을 바꾸어 준다..  
        $("#title").html("ajax를 통해 얻어온 id에 해당하는 값");
        $("#content").html("ajax를 통해 얻어온 id에 해당하는 값");


        //modal을 띄워준다.  
        $("#myModal").modal('show');
  
      
    }
</script> -->
<script type="text/javascript">
$(function() {
    $("#updateStatus").on("click",function() {
        //Debug..        
       
        var aaa = $("#statusMessage").val();
        //alert("들어옴??"+aaa);
        var object = new Object();
        object.status = aaa;
        var json_data = JSON.stringify(object);
        $.ajax( 
            {
              url : "/user/updateStatus",
               method :"POST",
               data :json_data,
               dataType : "json" ,
              headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
              },
              success : function(data){
            	
            	  $("#statusButton").text(data.status);
                
              }
              
              
          });
          ////////////////////////////////////////////////////////////////////////////////////////////
       /*  location.href="/profile/mainProfile"; */
    });
    
  }); 
</script>


  <!--   Core JS Files modal  -->
  <script src="/html/photo/assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

  <!--  Plugin for the Wizard -->
  <script src="/html/photo/assets/js/paper-bootstrap-wizard.js" type="text/javascript"></script>

  <!--  More information about jquery.validate here: http://jqueryvalidation.org/  -->
  <script src="/html/photo/assets/js/jquery.validate.min.js" type="text/javascript"></script>
  <!--파일업로드 자바스크립트  -->
  <script src="/html/assets/js/fileinput.js" type="text/javascript"></script>
  <script src="/html/assets/themes/fa/theme.js"></script>
  <script src="/html/assets/js/locales/LANG.js"></script>
        
  <!--profile follow modal -->      
  <script src='http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js'></script>
  <script src="/html/assets/followmodal/index.js"></script> 
  
  <!-- likeAnimate -->
  <script src="/html/assets/likeAnimate/index.js"></script>
  
  <script type="text/javascript">
$("#fileUpload").fileinput({    
    language: 'LANG',
    uploadUrl: 'user/fileUpload/post',
    uploadAsync: true,
    autoStart: true,
    allowedFileExtensions : ['jpg', 'png','gif']   
});


</script> 
  
  <script type="text/javascript">
  var folderNo;
  $(function() {
	    $( "#fileInputBt" ).on("click",function() {
	        //Debug..
	        //alert(  $( this ).text().trim() );
	        
	        //////////////////////////// 추가 , 변경된 부분 ///////////////////////////////////
	        //self.location ="/user/getUser?userId="+$(this).text().trim();
	        ////////////////////////////////////////////////////////////////////////////////////////////
	        var obj = new Object(); // JSON형식으로 변환 할 오브젝트
	        obj.title = $("#fileinputTitle").val();
	        obj.text = $("#fileinputText").val();
	         var json_data = JSON.stringify(obj);
	        $.ajax( 
	            {
	              url : "/mapBoard/addFolder",
	               method :"POST",
	               data :json_data,
	              dataType : "json" ,
	              headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json"    
	              },
	              success : function(JSONData , status) {
	            	  $("#folderNo").attr("name",JSONData.folderNo);
	            	  folderNo=JSONData.folderNo;
	            	  alert("등록완료"+folderNo);
	                
	            	  
	            	  //$("#input-id").fileinput();
	            	  $("#input-id").fileinput('refresh', {
	                        language: 'LANG',
	                        uploadUrl: '/mapBoard/addphoto/'+folderNo,
	                        uploadAsync: true,
	                        multiple:true,
	                        allowedFileExtensions : ['jpg', 'png','gif']   
	                      });
	              }
	          });
	        
	          ////////////////////////////////////////////////////////////////////////////////////////////
	        
	    });
	    
	  }); 
  </script>
  <script type="text/javascript">
  $('#input-id').on('filebatchuploadcomplete', function(event, files, extra) {
      console.log('File batch upload complete');
      $("#inputNext").attr("type","button");
  });
  
  
  $("#Finish").on("click",function(){
	  var url = "/profile/mainProfile";    
	  $(location).attr('href',url);
  });
  
  $(document).on({
	  "mouseover" : function(){$(this).find(".post-thumbnail").css("width","100%").css("height","100%")},
	  "touchstart" : function(){$(this).find(".post-thumbnail").css("width","100%").css("height","100%")},
	  "touchend" : function(){$(this).find(".post-thumbnail").css("width","").css("height","")},
	  "mouseout" : function(){$(this).find(".post-thumbnail").css("width","").css("height","")},
	  "click" : function(){
		  var url = "/mapBoard/getPhotoFolder?folderNum="+$(this).find("#zzz").attr("name");
		  $(location).attr('href',url);}
		  /* alert($(this).find("zzz").attr("name")) */  
	  }, "#post");
  
  
  
  
/*   $("#post").on("click",function(){    // id로 하면 앞에거만 먹힘 
      alert("abc");
  }); */
  </script>
  
  <script src="/html/photo/removeComment.js"></script>

    <script src="/html/photo/like.js"></script>
    
<script type="text/javascript">
 $(function(){
	 
  
    $(document).on("click","#LikeMember",function(){
        	var pfNo=$(this).attr("name");
             
             $.ajax({
                 
                 url: "/mapBoard/getLikeMember/"+pfNo,
                 method :"POST",
                 dataType : "json" ,
                 headers : {
                   "Accept" : "application/json",
                   "Content-Type" : "application/json"
                 },
                 success : function(JSONData , status) {
                     alert("성공");
                     $("#LikeUsers").append('<div>'+JSONData.LikeMember+'</div>');
                     
                    
                     }
                 
           });
     });
        
 });   
    </script>
  
  <script type="text/javascript">
 $(function(){
     
     
     $(document).on("click","#sendCommentBt",function(){
         var userNo=${myUser.userNo};
         var pfNo=$(this).find("div").eq(1).attr("name");
         var text=$(this).parent().parent().find('input').eq(0).val();
         alert(userNo+"+++"+pfNo+"++++"+text);
         var post = $(this).parents(".post");
         var aaa =$(this);
         var youNo =$(this).find("div").eq(2).attr("name");

         
            var obj = new Object(); // JSON형식으로 변환 할 오브젝트
            obj.folderNo =pfNo;
            obj.text = text;
            obj.userNo = userNo;
            var json_data = JSON.stringify(obj)
       $.ajax({
             
             url: "/mapBoard/jsonSetComment",
             method :"POST",
             data :json_data,
             dataType : "json" ,
             headers : {
               "Accept" : "application/json",
               "Content-Type" : "application/json"
             },
             success : function(JSONData , status) {
                 alert("성공"+pfNo);
                 socket.emit('client message', {to:youNo,name:'${myUser.userName}',folderNo:pfNo,msg:'댓글을 입력하셨습니다.',img:'${myUser.profileImg}'});
                 post.find("div#CommentBox").append('<div class="box-comment"> <img class="img-circle img-sm" src="/html/dist/img/user3-128x128.jpg" alt="User Image"> <div class="comment-text"> <span class="username">'+ JSONData.comment.userId +'<span class="text-muted pull-right" ><Button id="removebtn" name="'+ JSONData.comment.commentNo +'" style="width: 100% ; height: 100%;">X</button></span> <br/> <span  class="text-muted pull-right">'+ JSONData.comment.date +'</span>   </span> '+ JSONData.comment.text +' </div> </div>');
             }

             
       });
        
         
    });
 });
 </script>
  
  <script type="text/javascript">

var page = 1;
 
$(window).scroll(function() {
    if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
      console.log(++page);
      $.ajax({
          
          url: "/mapBoard/getJsonNewsFeed?userNo=${myUser.userNo}&col="+page,
          method :"POST",
          dataType : "json" ,
          headers : {
            "Accept" : "application/json",
            "Content-Type" : "application/json"
          },
          success : function(JSONData , status) {
              if(JSONData.newsfeed.length==0){
                  alert("모든게시물을 확인하셨습니다.");
              } 
              for (var i in JSONData.newsfeed) {
                  console.log(JSONData.newsfeed[i].user.userName+"sssss");
                  var count=0;
                  var aaa ='<div class="post" name="aaa">'
                      +'<div class="user-block">'
                      +'<img class="img-circle img-bordered-sm" src="/html/dist/img/user7-128x128.jpg" alt="user image">'
                      +'<span class="username">'
                        +'<a href="#">'+JSONData.newsfeed[i].user.userName+'</a>'
                        +'<a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>'
                      +'</span>'
                      +'<span class="description">'+JSONData.newsfeed[i].user.userId+' - '+JSONData.newsfeed[i].photoDate+'</span>'
                    +'</div>';
                 if(JSONData.newsfeed[i].photoTheme.length!=0){
                     aaa=aaa+'<div id="photoPageMove" class="row margin-bottom" name="'+JSONData.newsfeed[i].pfNo+'">'
                     +'<div class="col-sm-6">'
                       +'<img class="img-responsive" src="/html/assets/img/uploadedPhoto/'+JSONData.newsfeed[i].photoTheme[count].photoList[0].folderName+'" alt="Photo">'
                     +'</div>';
                  count =count+1;
                  if(count==JSONData.newsfeed[i].photoTheme.length){
                    count =0;
                  }
                     aaa=aaa+'<div class="col-sm-6">'
                       +'<div class="row">'
                         +'<div class="col-sm-6">'
                           +'<img class="img-responsive" src="/html/assets/img/uploadedPhoto/'+JSONData.newsfeed[i].photoTheme[count].photoList[0].folderName+'" alt="Photo">'
                           +'<br>';
                  count =count+1;
                  if(count==JSONData.newsfeed[i].photoTheme.length){
                    count =0;
                  }                           
                  aaa=aaa+'<img class="img-responsive" src="/html/assets/img/uploadedPhoto/'+JSONData.newsfeed[i].photoTheme[count].photoList[0].folderName+'" alt="Photo">'                
                        +'</div>';
                         <!-- /.col -->
                  count =count+1;
                  if(count==JSONData.newsfeed[i].photoTheme.length){
                    count =0;
                  }  
                        aaa =aaa+'<div class="col-sm-6">'
                           +'<img class="img-responsive" src="/html/assets/img/uploadedPhoto/'+JSONData.newsfeed[i].photoTheme[count].photoList[0].folderName+'" alt="Photo">'
                           +'<br>';
                  count =count+1;
                  if(count==JSONData.newsfeed[i].photoTheme.length){
                     count =0;
                  }   
                           aaa=aaa+'<img class="img-responsive" src="/html/assets/img/uploadedPhoto/'+JSONData.newsfeed[i].photoTheme[count].photoList[0].folderName+'" alt="Photo">'
                         +'</div>'
                         <!-- /.col -->
                       +'</div>'
                     <!-- /.row -->
                    +'</div>'                  
                   +'</div>';
                    }
                   aaa=aaa+'<p>'+JSONData.newsfeed[i].text+'</p>'
                   +'<ul class="list-inline">'
                      +'<button type="button" class="btn btn-default btn-xs">'
                         +'<i class="fa fa-share"></i> Share'
                       +'</button>'
                       +'<button id="likeBt" type="button" class="btn btn-default btn-xs" style="color:#444">'
                         +'<div name="${myUser.userNo}"></div>'
                         +'<div name="'+JSONData.newsfeed[i].pfNo+'"></div>'
                         +'<div name="'+JSONData.newsfeed[i].likeCode+'"></div>'
                         +'<i class="fa fa-thumbs-o-up"></i> Like'
                       +'</button>'
                       +'<span id="likeCount" class="pull-right text-muted"><a href="#">'+JSONData.newsfeed[i].likeCount+'likeCount</a></span>'
                       +'<span class="pull-right text-muted"><a href="#" id="commentCount">'+JSONData.newsfeed[i].commentCount+'comment</a></span>'
                    +'</ul>'
                    +'<div id="CommentBox" class="box-footer box-comments">'
                    for (var z in JSONData.newsfeed[i].commentList) {
                        aaa=aaa+'<div class="box-comment">'
                      +'<img class="img-circle img-sm" src="/html/dist/img/user3-128x128.jpg" alt="User Image">'
                      +'<div class="comment-text">'
                        +'<span class="username">'+JSONData.newsfeed[i].commentList[z].userId
                          +'<span class="text-muted pull-right" >'
                           +'<Button id="removebtn" name="'+JSONData.newsfeed[i].commentList[z].commentNo+'" style="width: 100% ; height: 100%;">X'
                             +'<div name="${myUser.userNo}"></div>'
                             +'<div name="'+JSONData.newsfeed[i].pfNo+'"></div>'
                            +'</button>'
                           +'</span>'
                          +'<br/>'
                          +'<span  class="text-muted pull-right">'+JSONData.newsfeed[i].commentList[z].date+'</span>'                   
                        +'</span>'
                          +JSONData.newsfeed[i].commentList[z].text
                        +'</div>'
                        <!-- /.comment-text -->
                      +'</div>';
                    }
                    aaa=aaa+'</div>'
                    +'<div class="box-footer">'
                    +'<div class="form-horizontal">'
                      +'<div class="form-group margin-bottom-none">'
                        +'<div class="col-sm-9">'
                          +'<input class="form-control input-sm" placeholder="Response">'
                        +'</div>'
                        +'<div class="col-sm-3">'
                          +'<button id="sendCommentBt" class="btn btn-danger pull-right btn-block btn-sm">Send'
                            +'<div name="'+JSONData.newsfeed[i].userNo+'"></div>'
                            +'<div name="'+JSONData.newsfeed[i].pfNo+'"></div>'
                            +'<div name="'+JSONData.newsfeed[i].user.userNo+'"></div>'
                          +'</button>'
                        +'</div>'
                      +'</div>'
                    +'</div>'       
                   +'</div>'
                  +'</div>';
                  $("#activity").append(aaa);
                }

          }
          
    });
      
    }
});
</script>

 <script src="/html/colorBox/jquery.colorbox-min.js"></script>

    
      <script type="text/javascript">
    function pageMove(ptno){
      location.href="/mapBoard/getPhotoFolder?folderNum="+ptno;
    }
    
    $(document).on("click","#photoPageMove",function(){
    	location.href="/mapBoard/getPhotoFolder?folderNum="+$(this).attr("name");
    })
  </script>
  

  
  <script src="https://cdn.socket.io/socket.io-1.0.0.js"></script>
  
  <script src="/html/common/common.js"></script>


</body>
</html>
