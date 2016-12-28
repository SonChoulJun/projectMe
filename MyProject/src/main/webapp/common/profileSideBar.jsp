<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <!-- <img class="profile-user-img img-responsive img-circle" src="/html/dist/img/user2-160x160.jpg" alt="User profile picture"> -->
              <div id='profile-upload'>
                <div class="hvr-profile-img">
                <input type="file" name="logo" id='getval'  class="upload w180" title="Dimensions 180 X 180" id="imag"></div>
                  <i class="fa fa-camera"></i>
                </div>
            


              <h3 class="profile-username text-center"><b>${targetUser.userName}</b></h3>

              <p class="text-muted text-center">상태메시지넣자-</p>



              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Followers</b> <a id="FollowerCount" class="pull-right">${getFollwerCount}</a>
                </li>
                <li class="list-group-item">
                  <b>Following</b> <a id="FollowingCount" class="pull-right">${getFollwingCount}</a>
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
            <!-- /.box-header -->
            <!-- <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> Education</strong>

              <p class="text-muted">
                B.S. in Computer Science from the University of Tennessee at Knoxville
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

              <p class="text-muted">Malibu, California</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

              <p>
                <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span>
              </p>

              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
            </div>
            /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        