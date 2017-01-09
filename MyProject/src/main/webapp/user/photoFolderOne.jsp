<%@page import="kr.co.bitcamp.service.domain.PhotoFolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | User Profile</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="/html/node_modules/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/html/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/html/dist/css/skins/_all-skins.min.css">

<style type="text/css">
.modal-dialog.modal-fullsize {
	width: 135%;
	margin: 0;
	padding: 0;
}
</style>


<!-- profile photo -->

<link rel="stylesheet" href="/html/assets/css/style.css">

<link rel="stylesheet" href="/html/folder-input/folder-input.css">

<link rel="stylesheet" href="/html/colorBox/colorbox.css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!--  facebook -->
<meta property="og:url" content="http://www.naver.com/" />
<meta property="og:type" content="website" />
<meta property="og:title" content="ShareTrip" />
<meta property="og:description" content="당신만의 특별한 추억 공유" />
<meta property="og:image" content="http://192.168.0.17:8080/html/0.png" />

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<c:import url="/common/headerBar.jsp"></c:import>

		<!-- Left side column. contains the logo and sidebar -->
		<c:import url="/common/mainSideBar.jsp"></c:import>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" id="content-wrapper">
			<section class="content">

			<div class="row" style="margin: 0 auto;">

				<div class="col-md-9" style="width: 100%; margin: 0 auto;">
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#myTravel" data-toggle="tab">MyTravel</a></li>
						</ul>
						<div class="tab-content">

							<div class="active tab-pane" id="myTravel">
								<!-- Box Comment -->
								<div class="box box-widget">
									<div class="box-header with-border">
										<div class="user-block">
											<img class="img-circle"
												src="/html/dist/img/profile/${photoFolderOne.user.profileImg }" alt="User Image" 
												onerror="this.src='/html/dist/img/defaultImage.jpg';">
											<span class="username"><a href="#">${photoFolderOne.title}
											</a></span> <span class="description">${photoFolderOne.photoDate}</span>
										</div>
										<!-- /.user-block -->
										<div class="box-tools" data-toggle="modal"
											data-target="#PhotosUpload">
											<c:if test="${myUser.userNo==photoFolderOne.user.userNo}">
											<button type="button" class="btn btn-box-tool"
												data-toggle="tooltip" title="사진추가">
												<i class="fa fa-plus"></i>
											</button>
											</c:if>
											<!--                         <button type="button" class="btn btn-box-tool"
                          data-widget="tooltip" title="사진추가">
                          <i class="fa fa-plus"></i>
                        </button> -->
											<!--                         <button type="button" class="btn btn-box-tool"
                          data-widget="remove">
                          <i class="fa fa-times"></i>
                        </button> -->
<<<<<<< HEAD
										</div>
										<!-- /.box-tools -->
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<div class="img-responsive" id="map"
											style="height: 400px; margin: 0px auto;"></div>
											<c:if test="${myUser.userNo==photoFolderOne.user.userNo}">
										<a
											href="/mapBoard/updatePhotoFolder?folderNum=${photoFolderOne.pfNo}">
											<button class="pull-right btn bg-purple btn-flat margin">수정하기</button>
										</a>
                                            </c:if>
										<p>오랜만에 서울에 있는 철준이네 집에 다녀왔다. 여전히 연기를 잘한다.</p>
										<br>

										<div class="fb-share-button"
											data-href="http://192.168.0.17:8080/mapBoard/getPhotoFolder?folderNum=10002"
											data-layout="button" data-size="small"
											data-mobile-iframe="true">
											<a class="fb-xfbml-parse-ignore" target="_blank"
												href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2F192.168.0.17%3A8080%2FmapBoard%2FgetPhotoFolder%3FfolderNum%3D10002&amp;src=sdkpreparse">공유하기</a>
										</div>

										<a id="kakao-link-btn" href="javascript:sendLink()"><img
											src="/html/images/kakao.PNG"></a>

										<button id="likeBt" type="button"
											class="btn btn-default btn-xs">
											<div name="${myUser.userNo}"></div>
											<div name="${photoFolderOne.pfNo}"></div>
											<div name="${likeOk}"></div>
											<i class="fa fa-thumbs-o-up"></i> Like
										</button>

										<span id="likeCount" class="pull-right text-muted"><a
											href="#">${likeCount} likeCount</a></span> <span
											class="pull-right text-muted"><a href="#"
											id="commentCount">${commentCount} comment</a></span>
										<!-- span id="commentCount" class="pull-right text-muted"> comment</span> -->

									</div>
									<!-- /.box-body -->
									<div class="box-footer box-comments">
										<c:forEach var="commentList" items="${commentList}">
											<div class="box-comment">
												<!-- User image -->
												<img class="img-circle img-sm"
													src="/html/dist/img/profile/${commentList.profileImg}" alt="User Image"
													onerror="this.src='/html/dist/img/defaultImage.jpg';">

												<div class="comment-text">
													<span class="username"> ${commentList.userId} 
													<c:if test="${commentList.userNo==myUser.userNo||myUser.userNo==photoFolderOne.user.userNo}">
															<span class="text-muted pull-right">
																<Button id="removebtn" name="${commentList.commentNo}"
																	style="width: 100%; height: 100%;">X
																	<div name="${myUser.userNo}"></div>
                                                                     <div name="${photoFolderOne.pfNo}"></div>
																	</Button>
															</span>
													</c:if>
													 <br /> <span class="text-muted pull-right">${commentList.date}</span>

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
									<!-- /.box-footer -->
									<div class="box-footer">
										<form action="/mapBoard/setComment" method="post">
											<img class="img-responsive img-circle img-sm"
												src="/html/dist/img/profile/${myUser.profileImg}" alt="Alt Text" onerror="this.src='/html/dist/img/defaultImage.jpg';">
											<!-- .img-push is used to add margin to elements next to floating images -->
											<div class="img-push">
												<input type="hidden" value="${myUser.userNo}" name="userNo">
												<input type="hidden" value="${photoFolderOne.pfNo}"
													name="folderNo"> <input type="text"
													class="form-control input-sm"
													placeholder="Press enter to post comment" name="text">
												<button type="submit" class="btn bg-olive margin">commit</button>
											</div>
										</form>
									</div>
									<!-- /.box-footer -->
								</div>
								<!-- /.box -->
							</div>
							<%-- <div class="post">
=======
                      </div>
                      <!-- /.box-tools -->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <div class="img-responsive" id="map"
                                                style="height: 400px; margin: 0px auto;"></div>
                                                <a href="/mapBoard/updatePhotoFolder?folderNum=${photoFolderOne.pfNo}">
                      <button class="pull-right btn bg-purple btn-flat margin" >수정하기</button></a>
                     
                      <p>오랜만에 서울에 있는 철준이네 집에 다녀왔다. 여전히 연기를 잘한다.</p>
                      <br>

                      <div class="fb-share-button" data-href="http://192.168.0.17:8080/mapBoard/getPhotoFolder?folderNum=10002" data-layout="button" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2F192.168.0.17%3A8080%2FmapBoard%2FgetPhotoFolder%3FfolderNum%3D10002&amp;src=sdkpreparse">공유하기</a></div>
                      
                            <a id="kakao-link-btn" href="javascript:sendLink()"><img src="/html/images/kakao.PNG" ></a>  
                      
                      <button id="likeBt" type="button" class="btn btn-default btn-xs">
                         <div name="${myUser.userNo}"></div>
                         <div name="${photoFolderOne.pfNo}"></div>
                         <div name="${likeOk}"></div>
                         <div name="${targetUser.userNo}"></div>
                        <i class="fa fa-thumbs-o-up"></i> Like
                      </button>
                      
                      <span id="likeCount" class="pull-right text-muted"><a href="#">${likeCount} likeCount</a></span>
                      <span class="pull-right text-muted"><a href="#" id="commentCount">${commentCount} comment</a></span>
                      <!-- span id="commentCount" class="pull-right text-muted"> comment</span> -->
                      
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer box-comments">
                      <c:forEach var="commentList" items="${commentList}">
                        <div class="box-comment">
                          <!-- User image -->
                          <img class="img-circle img-sm"
                            src="/html/dist/img/user3-128x128.jpg" alt="User Image">
  
                          <div class="comment-text">
                            <span class="username"> ${commentList.userId}
                            <span class="text-muted pull-right" >
                            <c:if test="${commentList.userNo==myUser.userNo}">
                            <Button id="removebtn" name="${commentList.commentNo}" style="width: 100% ; height: 100%;">X</button>
                            </c:if>
                            </span>
                            <br/>
                            <span  class="text-muted pull-right">${commentList.date}</span>
                            
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
                    <!-- /.box-footer -->
                    <div class="box-footer">
                      <form id='commentSub'action="/mapBoard/setComment" method="post">
                        <img class="img-responsive img-circle img-sm"
                          src="/html/dist/img/user4-128x128.jpg" alt="Alt Text">
                        <!-- .img-push is used to add margin to elements next to floating images -->
                        <div class="img-push">
                          <input type="hidden" value="${myUser.userNo}" name="userNo" >
                          <input type="hidden" value="${photoFolderOne.pfNo}" name="folderNo" >
                          <input type="text" class="form-control input-sm"
                            placeholder="Press enter to post comment" name="text">
                           <button type="submit" class="btn bg-olive margin">commit</button>
                        </div>
                      </form>
                    </div>
                    <!-- /.box-footer -->
                  </div>
                  <!-- /.box -->
                </div>
                <%-- <div class="post">
>>>>>>> 51593d3d12360061effd26499531343bc652e003
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm"
                      src="/html/dist/img/user1-128x128.jpg" alt="user image">
                    <span class="username"> <a href="#">${photoFolderOne.title}</a>
                      <a href="#" class="pull-right btn-box-tool"><i
                        class="fa fa-times"></i></a>
                    </span> <span class="description">${photoFolderOne.photoDate}</span>
                  </div>

                  <div class="row margin-bottom">
                    <div class="col-sm-6">
                      <div class="img-responsive" id="map"
                        style="height: 400px; margin: 0px auto;"></div>
                      <p>I took this photo this morning. What do you guys
                        think?</p>
                      <button type="button" class="btn btn-default btn-xs">
                        <i class="fa fa-share"></i> Share
                      </button>
                      <button type="button" class="btn btn-default btn-xs">
                        <i class="fa fa-thumbs-o-up"></i> Like
                      </button>
                      <span class="pull-right text-muted">127 likes - 3
                        comments</span>
                    </div>
                    <div class="box-footer box-comments">
                      <div class="box-comment">
                        <!-- User image -->
                        <img class="img-circle img-sm"
                          src="../dist/img/user3-128x128.jpg" alt="User Image">

                        <div class="comment-text">
                          <span class="username"> Maria Gonzales <span
                            class="text-muted pull-right">8:03 PM Today</span>
                          </span>
                          <!-- /.username -->
                          It is a long established fact that a reader will be
                          distracted by the readable content of a page when looking
                          at its layout.
                        </div>
                        <!-- /.comment-text -->
                      </div>
                      <!-- /.box-comment -->
                      <div class="box-comment">
                        <!-- User image -->
                        <img class="img-circle img-sm"
                          src="../dist/img/user4-128x128.jpg" alt="User Image">

                        <div class="comment-text">
                          <span class="username"> Luna Stark <span
                            class="text-muted pull-right">8:03 PM Today</span>
                          </span>
                          <!-- /.username -->
                          It is a long established fact that a reader will be
                          distracted by the readable content of a page when looking
                          at its layout.
                        </div>
                        <!-- /.comment-text -->
                      </div>
                      <!-- /.box-comment -->
                    </div>
                    <!-- /.box-footer -->
                    <div class="box-footer">
                      <form action="#" method="post">
                        <img class="img-responsive img-circle img-sm"
                          src="../dist/img/user4-128x128.jpg" alt="Alt Text">
                        <!-- .img-push is used to add margin to elements next to floating images -->
                        <div class="img-push">
                          <input type="text" class="form-control input-sm"
                            placeholder="Press enter to post comment">
                        </div>
                      </form>
                    </div>
                  </div>
                </div> --%>

							<br />




							<!-- /.tab-pane -->

						</div>
						<!-- /.tab-content -->
					</div>
					<!-- /.nav-tabs-custom -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> </section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<c:import url="/common/mainFoot.jsp"></c:import>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark"> <!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
					class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-birthday-cake bg-red"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

								<p>Will be 23 on April 24th</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-user bg-yellow"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Frodo Updated His
									Profile</h4>

								<p>New phone +1(800)555-1234</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-envelope-o bg-light-blue"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Nora Joined Mailing
									List</h4>

								<p>nora@example.com</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-file-code-o bg-green"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Cron Job 254
									Executed</h4>

								<p>Execution time 5 seconds</p>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Custom Template Design <span
									class="label label-danger pull-right">70%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Update Resume <span class="label label-success pull-right">95%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-success"
									style="width: 95%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Laravel Integration <span class="label label-warning pull-right">50%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-warning"
									style="width: 50%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Back End Framework <span class="label label-primary pull-right">68%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-primary"
									style="width: 68%"></div>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

			</div>
			<!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
				Content</div>
			<!-- /.tab-pane -->
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel
							usage <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Some information about this general settings option</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Allow mail
							redirect <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Other sets of options are available</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Expose author
							name in posts <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Allow the user to show his name in blog posts</p>
					</div>
					<!-- /.form-group -->

					<h3 class="control-sidebar-heading">Chat Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Show me as
							online <input type="checkbox" class="pull-right" checked>
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Turn off
							notifications <input type="checkbox" class="pull-right">
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Delete chat
							history <a href="javascript:void(0)" class="text-red pull-right"><i
								class="fa fa-trash-o"></i></a>
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



	<div id="PhotosUpload" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<!--   Creative Tim Branding   -->
		<!--  Made With Paper Kit  -->


		<!--   Big container   -->
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">

					<!--      Wizard container        -->
					<div class="wizard-container">
						<div class="card wizard-card" data-color="green" id="wizard">
							<form action="" method="">
								<!--        You can switch " data-color="green" "  with one of the next bright colors: "blue", "azure", "orange", "red"       -->

								<div class="wizard-header">
									<h3 class="wizard-title">사진 추가업로드</h3>
									<p class="category">This information will let us know more
										about your place.</p>
								</div>
								<div class="wizard-navigation">
									<div class="progress-with-circle">
										<div class="progress-bar" role="progressbar" aria-valuenow="1"
											aria-valuemin="1" aria-valuemax="4" style="width: 15%;"></div>
									</div>
									<ul>

										<li><a href="#photoUplad" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-direction-alt"></i>
												</div> photoUplad
										</a></li>
										<li><a href="#photoFinish" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-panel"></i>
												</div> Finish
										</a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div class="tab-pane" id="photoUplad">
										<div id="photoDiv" class="row">
											<div class="col-sm-12">
												<!-- Content Header (Page header) -->
												<section class="content-header">
												<h1>메인사진 추가업로드 ${photoFolder.title}</h1>
												<ol class="breadcrumb">
													<li><a href="#"><i class="fa fa-dashboard"></i>
															Home</a></li>
													<li><a href="#">Examples</a></li>
													<li class="active">User profile</li>
												</ol>
												</section>
												<!-- Main content -->

												<div class="row">
													<input id="photoInputBt" type="file" class="file"
														multiple="true">
												</div>
												<!-- /.row -->
												<!-- /.content -->

											</div>

											<div class='pull-right'>
												<input id="inputPlusNext" type="hidden"
													class='btn btn-next btn-fill btn-success btn-wd'
													name='next' value='Next' />
											</div>


										</div>
									</div>
									<div class="tab-pane" id="photoFinish">
										<h5 class="info-text">File Complete</h5>
										<div class="row">
											<div class="col-sm-12">
												<h5 class="info-text">Finish를 눌러주세요</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="wizard-footer">
									<div class="pull-right">
										<input id="photoPlusFinish" type='button'
											class='btn btn-finish btn-fill btn-success btn-wd'
											name='finish' value='Finish' />
									</div>

									<!--                                   <div class="pull-left">
                                      <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
                                  </div> -->
									<div class="clearfix"></div>
								</div>
							</form>
						</div>
					</div>
					<!-- wizard container -->
				</div>
			</div>
			<!-- row -->
		</div>
		<!--  big container -->
	</div>





	<div id="photoSubUpload" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-dialog modal-fullsize" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">×</button>
						<!-- header title -->
					</div>
					<!-- body -->
					<div class="modal-body">

						<!--   Big container   -->
						<div class="container">
							<div class="row">
								<div class="col-sm-8 col-sm-offset-2" style="margin: 0;">

									<!--      Wizard container        -->
									<div class="wizard-container" style="padding-top: 0">
										<div class="card wizard-card" data-color="green" id="wizard">
											<form action="" method="">
												<!--        You can switch " data-color="green" "  with one of the next bright colors: "blue", "azure", "orange", "red"       -->

												<div class="wizard-header">
													<h3 class="wizard-title">사진 서브 추가업로드</h3>
													<p class="category">This information will let us know
														more about your place.</p>
												</div>
												<div class="wizard-navigation">
													<div class="progress-with-circle">
														<div class="progress-bar" role="progressbar"
															aria-valuenow="1" aria-valuemin="1" aria-valuemax="4"
															style="width: 15%;"></div>
													</div>
													<ul>

														<li><a href="#photoSubUplad" data-toggle="tab">
																<div class="icon-circle">
																	<i class="ti-direction-alt"></i>
																</div> photoUplad
														</a></li>
														<li><a href="#photoSubFinish" data-toggle="tab">
																<div class="icon-circle">
																	<i class="ti-panel"></i>
																</div> Finish
														</a></li>
													</ul>
												</div>
												<div class="tab-content">
													<div class="tab-pane" id="photoSubUplad">
														<div id="photoDiv" class="row">
															<div class="col-sm-12">
																<!-- Content Header (Page header) -->
																<section class="content-header">
																<h1>서브사진 추가업로드 ${photoFolder.title}</h1>
																<ol class="breadcrumb">
																	<li><a href="#"><i class="fa fa-dashboard"></i>
																			Home</a></li>
																	<li><a href="#">Examples</a></li>
																	<li class="active">User profile</li>
																</ol>
																</section>
																<br> <br>
																<!-- Main content -->

																<div class="row">
																	<input id="photoSubInputBt" type="file" class="file"
																		multiple="true">
																</div>
																<!-- /.row -->
																<!-- /.content -->

															</div>

															<div class='pull-right'>
																<input id="inputSubNext" type="hidden"
																	class='btn btn-next btn-fill btn-success btn-wd'
																	name='next' value='Next' />
															</div>


														</div>
													</div>
													<div class="tab-pane" id="photoSubFinish">
														<h5 class="info-text">File Complete</h5>
														<div class="row">
															<div class="col-sm-12">
																<h5 class="info-text">Finish를 눌러주세요</h5>
															</div>
														</div>
													</div>
												</div>
												<div class="wizard-footer">
													<div class="pull-right">
														<input id="photoSubFinish" type='button'
															class='btn btn-finish btn-fill btn-success btn-wd'
															name='finish' value='Finish' />
													</div>

													<!--                                   <div class="pull-left">
			                                      <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
			                                  </div> -->
													<div class="clearfix"></div>
												</div>
											</form>
										</div>
									</div>
									<!-- wizard container -->
								</div>
							</div>
							<!-- row -->
						</div>
						<!--  big container -->
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<!-- Footer -->
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

	</div>


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
	<script src="/html/folder-input/folder-input.js"></script>
	<!-- 파일업로드-->
	<script src="/html/assets/js/fileinput.js" type="text/javascript"></script>
	<script src="/html/assets/themes/fa/theme.js"></script>
	<script src="/html/assets/js/locales/LANG.js"></script>
	<script type="text/javascript">
  $("#photoInputBt").fileinput('refresh', {
      language: 'LANG',
      uploadUrl: '/mapBoard/addphoto/'+${photoFolderOne.pfNo},
      uploadAsync: true,
      multiple:true,
      allowedFileExtensions : ['jpg', 'png','gif']   
    });
  </script>

	<script type="text/javascript">
  $('#photoInputBt').on('filebatchuploadcomplete', function(event, files, extra) {
      console.log('File batch upload complete');
      $("#inputPlusNext").attr("type","button");
  });
  
  
  $("#photoPlusFinish").on("click",function(){
    var url = "/mapBoard/getPhotoFolder?folderNum="+${photoFolderOne.pfNo};    
    $(location).attr('href',url);
  });
  </script>

	<script type="text/javascript">
 var tm_no;
  $("#photoSubInputBt").fileinput('refresh', {
      language: 'LANG',
      uploadUrl: '/mapBoard/addSubphoto/'+tm_no,
      uploadAsync: true,
      multiple:true,
      allowedFileExtensions : ['jpg', 'png','gif']   
    });
  </script>

	<script type="text/javascript">
  $('#photoSubInputBt').on('filebatchuploadcomplete', function(event, files, extra) {
      console.log('File batch upload complete');
      $("#inputSubNext").attr("type","button");
  });
  
  
  $("#photoSubFinish").on("click",function(){
    var url = "/mapBoard/getPhotoFolder?folderNum="+${photoFolderOne.pfNo};    
    $(location).attr('href',url);
  });
  </script>

  <script src="/node_modules/socket.io-client/dist/socket.io.js"></script>
  <script src="/html/common/common.js"></script>



	<script src="/html/photo/comment.js"></script>

	<script src="/html/photo/like.js"></script>







	<div id="fb-root"></div>
	<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

	<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('41020c22a903ed6423f936e1bd2fd29f');
    // // 카카오톡 링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createTalkLinkButton({
      container: '#kakao-link-btn',
      label: '나만의 여행으로 소통하자',
      image: {
        src: 'http://192.168.0.17:8080/html/0.png',
        width: '300',
        height: '200'
      },
      webButton: {
        text: '나만의 여행앱 ShareTrip',
        url: 'http://192.168.0.17:8080/mapBoard/getPhotoFolder?folderNum=10002' // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
      }
    });
  //]]>
</script>

<<<<<<< HEAD
<script type="text/javascript">
 $(function(){
     
     
     $(document).on("click","#sendCommentBt",function(){
         var userNo=${myUser.userNo};
         var pfNo=$(this).find("div").eq(1).attr("name");
         var text=$(this).parent().parent().find('input').eq(0).val();
         alert(userNo+"+++"+pfNo+"++++"+text);
         var post = $(this).parents(".post");
         var aaa =$(this);
         alert(post.attr("name"));
         
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
                 alert("성공");
                 post.find("div#CommentBox").append('<div class="box-comment"> <img class="img-circle img-sm" src="/html/dist/img/profile/'+JSONData.comment.profileImg+'" alt="User Image" onerror="this.src=\'/html/dist/img/defaultImage.jpg\';"> <div class="comment-text"> <span class="username">'+ JSONData.comment.userId +'<span class="text-muted pull-right" ><Button id="removebtn" name="'+ JSONData.comment.commentNo +'" style="width: 100% ; height: 100%;">X</button></span> <br/> <span  class="text-muted pull-right">'+ JSONData.comment.date +'</span>   </span> '+ JSONData.comment.text +' </div> </div>');
             }
             
       });
        
         
    });
 });
 </script>

	<!-- <script type="text/javascript">
=======

  
 <script type="text/javascript">
>>>>>>> 51593d3d12360061effd26499531343bc652e003
 $(function(){
     
     
     $(document).on("click","#sendCommentBt",function(){
         var userNo=$(this).find("div").eq(0).attr("name");
         var pfNo=$(this).find("div").eq(1).attr("name");
         alert(userNo+"+++"+pfNo);
         var post = $(this).parents(".post");
         var aaa =$(this);
         alert(post.attr("name"));
       $.ajax({
             
             url: "/mapBoard/setComment/"+userNo+"/"+pfNo,
             method :"GET",
             dataType : "json" ,
             headers : {
               "Accept" : "application/json",
               "Content-Type" : "application/json"
             },
             success : function(JSONData , status) {
            	 
             }
             
       });         
    });
 });
 </script> -->

	<!--   Core JS Files modal  -->
	<script src="/html/photo/assets/js/jquery.bootstrap.wizard.js"
		type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="/html/photo/assets/js/paper-bootstrap-wizard.js"
		type="text/javascript"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/  -->
	<script src="/html/photo/assets/js/jquery.validate.min.js"
		type="text/javascript"></script>



	<script src="/html/jqueryUi/jquery-ui.js"></script>
	<script type="text/javascript">

	// Link to open the dialog
	$( "#likeCount" ).click(function( event ) {
	  $( "#photoSubUpload" ).modal();
	  event.preventDefault();
	});
  </script>
  <script src="/html/photo/removeComment.js"></script>

	<script type="text/javascript"></script>
	<c:import url="/user/googleMap.jsp"></c:import>
	<script src="/html/colorBox/jquery.colorbox-min.js"></script>


</body>
</html>
