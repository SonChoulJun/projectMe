<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<div class="col-md-3">
    <div id ="targetUser" name="${targetUser.userNo}"></div>
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
								<!-- <div  class="modal-body" >
									<div class="row">
										<div class="pattern">
											<ul id="bodyModal" class="list img-list" style="padding:0;">
			                                     
			                                </ul>
										</div>
									</div>
								</div> -->
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
						                        <div class="modal-dialog" style="width: 400px;">
						                            <div class="modal-content">
						                                <div class="modal-header" style="display: block; padding: 10px; text-align: center; color: #FFF; background: #1da1f2;">
						                                    <!-- 닫기(x) 버튼 -->
						                                    <button type="button" class="close" data-dismiss="modal">×</button>
						                                    <!-- header title -->
						                                    <h4 class="modal-title">내가 Following한 사람들</h4>
						                                </div>
						                                <!-- body -->
						                               <!--  <div  class="modal-body" >
						                                    <div class="row">
						                                        <div class="pattern">
						                                            <ul id="Followingbody" class="list img-list" style="padding:0;">
						                                           
						                                            </ul>
						                                        </div>
						                                    </div>
						                                </div> -->
						                                
						                                <div id="app-container" ng-app="contactsApp" ng-controller="athletesController as athletesList" ng-class="{ 'modal' : formShow }">
    
    
        <div style="clear:both"></div>
        <div class="panel">
                <form class="form-search">
                        <i class="material-icons search-icon">search</i>
                        <input class="form-input" placeholder="Search for friends ny name..." ng-model="athlete.name"/>
                        <i class="material-icons refresh-icon" ng-click="clear()">refresh</i>
                </form>
        </div>
        <ul class="contact-list">
                <li ng-repeat="athlete in athletesList.athletes | filter: athlete.name">
                        <img ng-src="{{ athlete.image }}">
                        <div class="contact-info">
                                <h3 class="heading--name">{{ athlete.name }}</h3>
                                <div class="contact-item"><i class="fa fa-map-marker"></i> {{ athlete.hometown }}</div>
                                <div class="contact-item"><i class="fa fa-briefcase"></i> {{ athlete.position }}</div>
                        </div>
                    <i class="fa fa-pencil fa-2x text-pink" ng-click="edit()"></i>
                </li>
        </ul>

        <form name="addAthlete" ng-submit="athletesList.addAthlete()" ng-if="formShow" class="form-add">
                <div ng-click="close()"><i class="fa fa-times close-modal"></i></div>
                <img src="http://dallasposttrib.com/wordpress/wp-content/uploads/2015/01/Dallas-Mavericks-Logo.gif" class="center" />
                <label>Athlete Name:</label>
                <input type="text" ng-model="athletesList.athleteName" size="30" placeholder="add new athlete here" required/>
                <br/>
                <label>Athletes Hometown:</label>
                <input type="text" ng-model="athletesList.athleteHometown" size="30" placeholder="add athlete hometown" required/>
                <label>Athletes Position:</label>
                <input type="text" ng-model="athletesList.athletePosition" size="30" placeholder="add athlete hometown" required/>
                <button ng-disabled="addAthlete.$invalid && addAthlete.$pristine" class="btn-primary" type="submit">Add New Athlete</button>
        </form>
      
      <custom-checkbox ng-model="formShow" text="Add a new Athlete" name="input-formShow"></custom-checkbox>
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
             <div class='et_pb_column et_pb_column_1_3'>
              <div class='module post-module'>
                <div class='module-head'>
                  <h1>All</h1>
                  <div class='module-filter'>
                    <b>Top 5</b>
                  </div>
                </div>
                <div id='post' class='main-post'>
                  <article>
                    <div class='header'>
                      <a href='#'>
                        <img src='/html/0.png'>
                        <span class='et_overlay'></span>
                      </a>
                    </div>
                    <div class='post-content' style="width: 300px;">
                      <div style="float:left; margin-right:10px;">
                      <h2 style="margin-top: 15px;">${BestfolderList[0].title}</h2>
                      </div> 
                      <div class="like" style="float:right;width: 104px;margin-top: 10px;margin-bottom: 0px; margin-right:20px;">
                                <span class="like-text">Like</span>
                                <div class="heart ">
                                </div>
                                <span class="like-count">${BestfolderList[0].likeCount}</span>                   
                                  </div>
                        </div>
                      <div class="post-action">                        
                      <div class='post-meta'>
                        <p>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a>                          
                        </p>
                      </div>
                      <div class='excerpt'>${BestfolderList[0].text}</div>
                    </div>
                  </article>
                </div>
                <ul id='posts-list' class='posts-list' style="margin:0;padding:0">
                  
                  <li id='post'>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='/html/1.png'>
                      </a>
                     <div class='post-content' style="width: 300px;">
                       <div style="float:left; margin-right:10px;">
                        <h3 style="margin-top: 15px;">
                          ${BestfolderList[1].title}
                        </h3>
                        </div>
                        <div class="like" style="float:right;width: 104px;margin-top: 10px;margin-bottom: 0px; margin-right:20px;">
                                <span class="like-text">Like</span>
                                <div class="heart ">
                                </div>
                                <span class="like-count">${BestfolderList[1].likeCount}</span>                   
                                  </div>
                        </div>
                        <div class="post-action">
                        <div class='post-meta'>
                          <p>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a>
                          </p>                           
                        </div>
                        <div class='excerpt'>${BestfolderList[1].text}</div>
                      </div>
                    </article>
                  </li>
                  
                   <li id='post'>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='/html/2.png'>
                      </a>
                     <div class='post-content' style="width: 300px;">
                       <div style="float:left; margin-right:10px;">
                        <h3 style="margin-top: 15px;">
                          ${BestfolderList[2].title}
                        </h3>
                        </div>
                        <div class="like" style="float:right;width: 104px;margin-top: 10px;margin-bottom: 0px; margin-right:20px;">
                                <span class="like-text">Like</span>
                                <div class="heart ">
                                </div>
                                <span class="like-count">${BestfolderList[2].likeCount}</span>                   
                                  </div>
                        </div>
                        <div class="post-action">
                        <div class='post-meta'>
                          <p>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a>
                          </p>                           
                        </div>
                        <div class='excerpt'>${BestfolderList[2].text}</div>
                      </div>
                    </article>
                  </li>
                  
                   <li id='post'>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='/html/3.png'>
                      </a>
                     <div class='post-content' style="width: 300px;">
                       <div style="float:left; margin-right:10px;">
                        <h3 style="margin-top: 15px;">
                          ${BestfolderList[3].title}
                        </h3>
                        </div>
                        <div class="like" style="float:right;width: 104px;margin-top: 10px;margin-bottom: 0px; margin-right:20px;">
                                <span class="like-text">Like</span>
                                <div class="heart ">
                                </div>
                                <span class="like-count">${BestfolderList[3].likeCount}</span>                   
                                  </div>
                        </div>
                        <div class="post-action">
                        <div class='post-meta'>
                          <p>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a>
                          </p>                           
                        </div>
                        <div class='excerpt'>${BestfolderList[3].text}</div>
                      </div>
                    </article>
                  </li>
                  
                   <li id='post'>
                    <article>
                      <a class='post-thumbnail'>
                        <img src='/html/4.png'>
                      </a>
                     <div class='post-content' style="width: 300px;">
                       <div style="float:left; margin-right:10px;">
                        <h3 style="margin-top: 15px;">
                          ${BestfolderList[4].title}
                        </h3>
                        </div>
                        <div class="like" style="float:right;width: 104px;margin-top: 10px;margin-bottom: 0px; margin-right:20px;">
                                <span class="like-text">Like</span>
                                <div class="heart ">
                                </div>
                                <span class="like-count">${BestfolderList[4].likeCount}</span>                   
                                  </div>
                        </div>
                        <div class="post-action">
                        <div class='post-meta'>
                          <p>
                          By | <a href='#'>Andy Tran</a> | Jun 8, 2015 | <a href='#'>Uncategorized</a>
                          </p>                           
                        </div>
                        <div class='excerpt'>${BestfolderList[4].text}</div>
                      </div>
                    </article>
                  </li> 
                </ul>
              </div>
            </div>
            </div>
            </div>
           
            




