<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<div class="col-md-3">
    <div id ="targetUser" name="${targetUser.userNo}"></div>
	<!-- Profile Image -->
	<div class="box box-primary">
		<div class="box-body box-profile">
			<!-- <img class="profile-user-img img-responsive img-circle" src="/html/dist/img/user2-160x160.jpg" alt="User profile picture"> -->
			<c:if test="${targetUser.userNo==myUser.userNo}">
			<div id='profile-upload' style="background-image:url('/html/dist/img/profile/${targetUser.profileImg}') " >
				<div class="hvr-profile-img">
					<input type="file" name="logo" id='getval' class="upload w180"
						title="Dimensions 180 X 180" id="imag">
				</div>
				<i class="fa fa-camera"></i>
			</div>
			</c:if>
			<c:if test="${targetUser.userNo!=myUser.userNo&&targetUser.profileImg==null}">
			     <div id='profile-upload' style="background-image:url('/html/dist/img/profile/${targetUser.profileImg}') " >
                
                <i class="fa fa-camera"></i>
            </div>
			</c:if>
		   <c:if test="${targetUser.userNo!=myUser.userNo&&targetUser.profileImg!=null}">
            <div id='profile-upload' style="background-image:url('/html/dist/img/profile/${targetUser.profileImg}') " data-target="#getProfileImg" data-toggle="modal" >
            
            <div class="modal fade" id="getProfileImg">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="#getProfileImg">×</button>
                                                       <!--  header title -->
                                                        <h4 class="modal-title">프로필 사진</h4>
                                                    </div>
                                                    
                                                    <!--body-->
                                                    <div  class="modal-body" >
                                                        <div class="row">
                                                            <div id="photopull" class="pattern">
                                                                <img alt="" src="/html/dist/img/profile/${targetUser.profileImg }" style="width:80%;height:80%;">
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
    
                <i class="fa fa-camera"></i>
            </div>
            </c:if>
            <%-- <c:if test=""></c:if>  --%>


			<h3 class="profile-username text-center">
				<b>${targetUser.userName} </b>
			</h3>
			<p id="teststatus" class="text-muted text-center">
			<c:if test="${targetUser.userNo==myUser.userNo}">
			<a id="statusButton" data-target="#getStatus" data-toggle="modal" placeholder="====">
			<c:if test="${empty targetUser.status}" >
                    현재상태명을 입력해주세요.
            </c:if>
            <c:if test="${!empty targetUser.status}">
			=====${targetUser.status}=====</h5>
			</c:if>
			</a>
			</c:if>
			<c:if test="${targetUser.userNo!=myUser.userNo}">
			<h5>${targetUser.status}</h5>
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
						<div class="modal-dialog" style="width: 400px;">
							<div class="modal-content">
								<div class="modal-header" style="display: block; padding: 10px; text-align: center; color: #FFF; background: #1da1f2;">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
									<!-- header title -->
									<h4 class="modal-title">나를 Follower한 사람들</h4>
								</div>
								
								<!-- 팔로우 복사 시작 -->
								<!-- <div id="app-container" ng-app="contactsApp" ng-controller="followerController as followerList" ng-class="{ 'modal' : formShow }" style="
    margin-bottom: 0px;
">
    
    
        <div style="clear:both"></div>
        <div class="panel">
                <form class="form-search">
                        <i class="material-icons search-icon">search</i>
                        <input class="form-input" placeholder="Search for friends ny name..." ng-model="follower.name"/>
                        <i class="material-icons refresh-icon" ng-click="clear()">refresh</i>
                </form>
        </div>
        <ul class="contact-list">
                <li ng-repeat="follower in followerList.followers | filter: follower.name" data-ng-click="clickListener2(follower.userId)">
                        <img ng-src="{{ follower.image }}">
                        <div class="contact-info">
                                <h3 class="heading--name">{{ follower.name }}</h3>
                                <div class="contact-item"><i class="fa fa-map-marker"></i> {{ follower.hometown }}</div>
                                <div class="contact-item"><i class="fa fa-briefcase"></i> {{ follower.position }}</div>                       
                        </div>                    
                </li>
       
        <button type="button" name="팔로우더보기" ng-click="moreList2()" style="background-color: #1da1f2;width: 100%;">팔로우더보기</button>
              
        </ul>
        </div> -->

      
      

								<!-- 팔로우 복사 끝 -->
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
						                                
						                                <div id="app-container" ng-app="contactsApp" ng-controller="athletesController as athletesList" ng-class="{ 'modal' : formShow }" style="
    margin-bottom: 0px;
">
    
    
        <div style="clear:both"></div>
        <div class="panel">
                <form class="form-search">
                        <i class="material-icons search-icon">search</i>
                        <input class="form-input" placeholder="Search for friends ny name..." ng-model="athlete.name"/>
                        <i class="material-icons refresh-icon" ng-click="clear()">refresh</i>
                </form>
        </div>
        <ul class="contact-list">
                <li ng-repeat="athlete in athletesList.athletes | filter: athlete.name" data-ng-click="clickListener(athlete.userId)">
                        <img ng-src="{{ athlete.image }}">
                        <div class="contact-info">
                                <h3 class="heading--name">{{ athlete.name }}</h3>
                                <div class="contact-item"><i class="fa fa-map-marker"></i> {{ athlete.hometown }}</div>
                                <div class="contact-item"><i class="fa fa-briefcase"></i> {{ athlete.position }}</div>                       
                        </div>                    
                </li>
       
        <button type="button" name="팔로우더보기" ng-click="moreList()" style="background-color: #1da1f2;width: 100%;">팔로우더보기</button>
              
        </ul>
        

        <!-- <form name="addAthlete" ng-submit="athletesList.addAthlete()" ng-if="formShow" class="form-add">
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
        </form> -->
      
      
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
                <div id='post' class='main-post'>
                <div id='zzz' name="${BestfolderList[0].pfNo}"></div>
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
                                <div class="heart">
                                </div>
                                <span class="like-count">${BestfolderList[0].likeCount}</span>                   
                                  </div>
                        </div>
                      <div class="post-action" style=" padding-bottom: 20px;">                        
                      <div class='post-meta'>
                        <p>
                          By | ${BestfolderList[0].user.userId} | ${BestfolderList[0].photoDate} |                          
                        </p>                       
                      </div>
                      <div class='excerpt'>${BestfolderList[0].text}</div>
                    </div>
                  </article>
                </div>
                <ul id='posts-list' class='posts-list' style="margin:0;padding:0">
                  
                  <li id='post'>
                  <div id='zzz' name="${BestfolderList[1].pfNo}"></div>
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
                                <div class="heart">
                                </div>
                                <span class="like-count">${BestfolderList[1].likeCount}</span>                   
                                  </div>
                        </div>
                        <div class="post-action" style="padding-bottom: 10px;">
                        <div class='post-meta'>
                          <p>
                          By | ${BestfolderList[1].user.userId} | ${BestfolderList[1].photoDate} | 
                          </p>                           
                        </div>
                        <div class='excerpt'>${BestfolderList[1].text}</div>
                      </div>
                    </article>
                  </li>
                  
                   <li id='post'>
                   <div id='zzz' name="${BestfolderList[2].pfNo}"></div>
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
                        <div class="post-action" style="padding-bottom: 10px;">
                        <div class='post-meta'>
                          <p>
                          By | ${BestfolderList[2].user.userId} | ${BestfolderList[2].photoDate} | 
                          </p>                           
                        </div>
                        <div class='excerpt'>${BestfolderList[2].text}</div>
                      </div>
                    </article>
                  </li>
                  
                   <li id='post'>
                   <div id='zzz' name="${BestfolderList[3].pfNo}"></div>
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
                        <div class="post-action" style="padding-bottom: 10px;">
                        <div class='post-meta'>
                          <p>
                          By | ${BestfolderList[3].user.userId} | ${BestfolderList[3].photoDate} | 
                          </p>                           
                        </div>
                        <div class='excerpt'>${BestfolderList[3].text}</div>
                      </div>
                    </article>
                  </li>
                  
                   <li id='post'>
                   <div id='zzz' name="${BestfolderList[4].pfNo}"></div>
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
                        <div class="post-action" style="padding-bottom: 10px;">
                        <div class='post-meta'>
                          <p>
                           By | ${BestfolderList[4].user.userId} | ${BestfolderList[4].photoDate} | 
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
           
            




