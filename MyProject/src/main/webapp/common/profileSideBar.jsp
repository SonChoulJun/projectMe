<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			=====${targetUser.status}=====
			</a>
			</c:if>
			<c:if test="${targetUser.userNo!=myUser.userNo}">
			=====${targetUser.status}=====
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
             <div class='et_pb_column et_pb_column_1_3'>
              <div class='module post-module'>
                <div class='module-head'>
                  <h1>All</h1>
                  <div class='module-filter'>
                    <b>Top 5</b>
                  </div>
                </div>
                <div class='main-post'>
                  <article>
                    <div class='header'>
                      <a href='#'>
                        <img src='http://placehold.it/500x250/519bf5/ffffff'>
                        <span class='et_overlay'></span>
                      </a>
                    </div>
                    <div class='post-content'>
                      <h2>This is a post title.</h2>
                      <div class='post-meta'>
                        <p>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a> 
                          <span class='rating-stars'>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                          </span>
                        </p>
                      </div>
                      <div class='excerpt'>Cupcake ipsum dolor. Sit amet marzipan croissant. Chocolate bar I love gummi bears biscuit. I love oat cake donut dessert apple pie carrot cake chocolate bar bear claw biscuit.</div>
                    </div>
                  </article>
                </div>
                <ul class='posts-list' style="margin:0;padding:0">
                  <li>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='http://placehold.it/50/519bf5/ffffff'>
                      </a>
                      <div class='post-content'>
                        <h3>
                          This is a post title.
                        </h3>
                        <div class='post-meta'>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a> 
                          <span class='rating-stars'>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                          </span>
                        </div>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='http://placehold.it/50/519bf5/ffffff'>
                      </a>
                      <div class='post-content'>
                        <h3>
                          This is a post title.
                        </h3>
                        <div class='post-meta'>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a> 
                          <span class='rating-stars'>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                          </span>
                        </div>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='http://placehold.it/50/519bf5/ffffff'>
                      </a>
                      <div class='post-content'>
                        <h3>
                          This is a post title.
                        </h3>
                        <div class='post-meta'>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a> 
                          <span class='rating-stars'>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                          </span>
                        </div>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='http://placehold.it/50/519bf5/ffffff'>
                      </a>
                      <div class='post-content'>
                        <h3>
                          This is a post title.
                        </h3>
                        <div class='post-meta'>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a> 
                          <span class='rating-stars'>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                          </span>
                        </div>
                      </div>
                    </article>
                  </li>
                  <li>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='http://placehold.it/50/519bf5/ffffff'>
                      </a>
                      <div class='post-content'>
                        <h3>
                          This is a post title.
                        </h3>
                        <div class='post-meta'>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a> 
                          <span class='rating-stars'>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                            <div class='rating-star'></div>
                          </span>
                        </div>
                      </div>
                    </article>
                  </li>
                </ul>
              </div>
            </div>
            </div>
            </div>
            




