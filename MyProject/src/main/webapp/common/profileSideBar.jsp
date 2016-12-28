<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-3">

	<!-- Profile Image -->
	<div class="box box-primary">
		<div class="box-body box-profile">
			<!-- <img class="profile-user-img img-responsive img-circle" src="/html/dist/img/user2-160x160.jpg" alt="User profile picture"> -->
			<div id='profile-upload'>
				<div class="hvr-profile-img">
					<input type="file" name="logo" id='getval' class="upload w180"
						title="Dimensions 180 X 180" id="imag">
				</div>
				<i class="fa fa-camera"></i>
			</div>



			<h3 class="profile-username text-center">
				<b>${targetUser.userName} </b>
			</h3>
			<p id="teststatus" class="text-muted text-center">
			<c:if test="${targetUser.userNo==myUser.userNo}">
			<a id="statusButton" data-target="#getStatus" data-toggle="modal">
			=====${targetUser.status}=====</h5>
			</a>
			</c:if>
			<c:if test="${targetUser.userNo!=myUser.userNo}">
			<h5>=====${targetUser.status}=====</h5>
			</c:if>
			</p>

								<div class="modal fade" id="getStatus">
					                        <div class="modal-dialog">
					                            <div class="modal-content">
					                                <div class="modal-header">
					                                    <button type="button" class="close" data-dismiss="modal">×</button>
					                                   <!--  header title -->
					                                    <h4 class="modal-title">상태메세지</h4>
					                                </div>
					                                <!--body-->
					                                <div  class="modal-body" >
						                                <div class="row">
							                                <div id="statusmodal" class="pattern">
							                                <input name ="status" type="status" class="form-control" id="statusMessage" placeholder=${targetUser.status}>
								                               <!--  <textarea name ="status" class="form-control" id="statusMessage" placeholder=${targetUser.status}></textarea> -->
							                                </div>
						                                </div>
					                                </div>
					                               <!-- Footer -->
					                                <div class="modal-footer">
					                                    Footer
					                                    
					                                    <button class="btn btn-default" id="updateStatus" data-dismiss="modal">수정</button>
					                                    <button type="button" class="btn btn-default"
					                                        data-dismiss="modal">닫기</button>
					                                </div>
					                            </div>
					                        </div> 
					                     </div>
			



			<ul class="list-group list-group-unbordered">
				<li class="list-group-item"><b>Followers</b> <%-- <button type="button" class="btn btn-info btn-lg" onclick="show('aaa')">${getFollwerCount}</button> --%>
					<a id="FollowerCount" class="pull-right">${getFollwerCount}</a>
					<div id="FollowerModal" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
									<!-- header title -->
									<h4 class="modal-title">나를 Follower한 사람들</h4>
								</div>
								<!-- body -->
								<div  class="modal-body" >
									<div class="row">
										<div class="pattern">
											<ul id="bodyModal" class="list img-list" style="padding:0;">
			                               
			                                </ul>
										</div>
									</div>
								</div>
								<!-- Footer -->
								<div class="modal-footer">
									<!-- Footer -->
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div></li>
				<li class="list-group-item"><b>Following</b> 
				<a id="FollowingCount" class="pull-right">${getFollwingCount}</a>
											<div id="FollowingModal" class="modal fade">
						                        <div class="modal-dialog">
						                            <div class="modal-content">
						                                <div class="modal-header">
						                                    <!-- 닫기(x) 버튼 -->
						                                    <button type="button" class="close" data-dismiss="modal">×</button>
						                                    <!-- header title -->
						                                    <h4 class="modal-title">내가 Following한 사람들</h4>
						                                </div>
						                                <!-- body -->
						                                <div  class="modal-body" >
						                                    <div class="row">
						                                        <div class="pattern">
						                                            <ul id="Followingbody" class="list img-list" style="padding:0;">
						                                           
						                                            </ul>
						                                        </div>
						                                    </div>
						                                </div>
						                                <!-- Footer -->
						                                <div class="modal-footer">
						                                    <!-- Footer -->
						                                    <button type="button" class="btn btn-default"
						                                        data-dismiss="modal">닫기</button>
						                                </div>
						                            </div>
						                        </div>
					</li>
			</ul>
			<c:if test="${targetUser.userNo!=myUser.userNo}">
				<c:if test="${followerOk}">
					<a id="follwerBt" class="btn btn-primary btn-block"><b>팔로우</b></a>
				</c:if>
				<c:if test="${!followerOk}">
					<a id="follwerBt" class="btn btn-primary btn-block"><b>팔로우해제</b></a>
				</c:if>
			</c:if>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->

	<!-- About Me Box -->
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">About Me</h3>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<strong><i class="fa fa-book margin-r-5"></i> Education</strong>

			<p class="text-muted">B.S. in Computer Science from the
				University of Tennessee at Knoxville</p>

			<hr>

			<strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

			<p class="text-muted">Malibu, California</p>

			<hr>

			<strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

			<p>
				<span class="label label-danger">UI Design</span> <span
					class="label label-success">Coding</span> <span
					class="label label-info">Javascript</span> <span
					class="label label-warning">PHP</span> <span
					class="label label-primary">Node.js</span>
			</p>

			<hr>

			<strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam
				fermentum enim neque.</p>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>
<!-- /.col -->

<!-- <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="title"></h4>
        </div>
        <div class="modal-body">
          <p id="content"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>  
</div> -->

<!-- <script type="text/javascript">
$(function() {
    $("#FollowerCount").on("click",function() {
        //Debug..        
        $.ajax( 
            {
              url : "/user/getFollower/${targetUser.userNo},
               method :"GET",
              headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
              },
              success : function() {
                  $('div.modal').modal({remote : 'layer.jsp'});
              }
          });
          ////////////////////////////////////////////////////////////////////////////////////////////
        
    });
    
  }); 
</script> -->




