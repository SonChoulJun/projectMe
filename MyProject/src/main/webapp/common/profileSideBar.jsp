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
            <div class="box-header with-border">
              <h3 class="box-title">About Me</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
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
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        