<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
               <div class="avatar img-responsive img-circle">
                
                      <svg version="1.1" id="camera" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 25 15" enable-background="new 0 0 25 15" xml:space="preserve">
                            <path id="cameraFrame" fill="none" stroke="white" stroke-miterlimit="10" d="M23.1,14.1H1.9c-0.6,0-1-0.4-1-1V1.9c0-0.6,0.4-1,1-1h21.2
                              c0.6,0,1,0.4,1,1v11.3C24.1,13.7,23.7,14.1,23.1,14.1z"></path>
                            <path id="circle" fill="none" stroke="#ffffff" stroke-width="1.4" stroke-miterlimit="12" d="M17.7,7.5c0-2.8-2.3-5.2-5.2-5.2S7.3,4.7,7.3,7.5s2.3,5.2,5.2,5.2
                              S17.7,10.3,17.7,7.5z"></path>
                         <g id="plus">
                            <path fill="none" id="plusLine" class="line" stroke="#ffffff" stroke-linecap="round" stroke-miterlimit="10" d="M20.9,2.3v4.4"></path>
                            <path fill="none" class="line" stroke="#ffffff" stroke-linecap="round" stroke-miterlimit="10" d="M18.7,4.6h4.4"></path>
                        </g>
                     </svg>
                     <!-- <div id="openModal img-responsive img-circle">
                       <span style="color:Yellow">Drop</span>
                     </div> -->
                      <input id="fileUpload" type="file">
                </div>
              <!-- <img class="profile-user-img img-responsive img-circle" src="/html/dist/img/user2-160x160.jpg" alt="User profile picture"> -->


              <h3 class="profile-username text-center"><b>${targetUser.userName}</b></h3>

              <p class="text-muted text-center">상태메시지넣자-</p>



              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Followers</b> <a class="pull-right">${getFollwerCount}</a>
                </li>
                <li class="list-group-item">
                  <b>Following</b> <a class="pull-right">${getFollwingCount}</a>
                </li>
              </ul>
              <c:if test="${targetUser.userId!=user.userId}">
                <a href="#" class="btn btn-primary btn-block"><b>FOLLWER</b></a>
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