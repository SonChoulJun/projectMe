<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <!-- CSS Files -->
    <link href="/html/photo/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/html/photo/assets/css/paper-bootstrap-wizard.css" rel="stylesheet" />

  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/html/photo/assets/css/demo.css" rel="stylesheet" />

  <!-- Fonts and Icons -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
  <link href="/html/photo/assets/css/themify-icons.css" rel="stylesheet">
    
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- 유저정보 -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/html/dist/img/profile/${targetUser.profileImg}" class="img-circle" onerror="this.src='/html/dist/img/defaultImage.jpg';" >
        </div>
        <div class="pull-left info">
         <p><a href="/profile/subProfile?userId=${targetUser.userId}">${targetUser.userId}</a></p>
       <c:if test="${targetUser.activity}">
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
          </c:if>
          <c:if test="${!targetUser.activity}">
          <a href="#"><i class="fa fa-circle text-success"></i> Offline</a>
          </c:if> 
        </div>
      </div>
      <!-- 검색 -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" id="q" class="form-control" placeholder="Search..." onkeyup='{filter();return false}' onkeypress='javascript:if(event.keyCode==13){ filter(); return false;}'>

              <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" id="folder-menu">
        <li class="header" id="t_menu">여행목록</li>
        <c:if test="${targetUser.userNo==myUser.userNo}">
          <li class="folder_input" id="folder_input" data-toggle="modal" data-target="#modalType">+</li>
        </c:if>
        <c:forEach var="photoFolder" items="${folderList}">
       
          <li class="treeview" name="${photoFolder.title}">
          <c:if test="${targetUser.userNo==myUser.userNo}">
            <a href="/profile/photoPage/${photoFolder.pfNo}">
          </c:if>
          <c:if test="${targetUser.userNo!=myUser.userNo}">
            <a>
          </c:if>
              <i class="fa fa-files-o"></i>
              <span>${photoFolder.title}</span>

              <c:if test="${photoFolder.photoTheme.isEmpty()}">
                <span class="pull-right-container">
                  <small class="label pull-right bg-green">new</small>
                </span>
              </c:if>

              
               <c:if test="${!photoFolder.photoTheme.isEmpty()}">
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                 </span>
              </c:if>
              
              <c:if test="${!photoFolder.photoTheme.isEmpty()}">
                 <ul class="treeview-menu">
                  <c:forEach var="photoTheme" items="${photoFolder.photoTheme}" varStatus="status">
                    <li><a href="/mapBoard/getPhotoFolder?folderNum=${photoFolder.pfNo}"><i class="fa fa-circle-o"></i>${status.count}</a></li>
                  </c:forEach>
                 </ul>
              </c:if>
            </a>
           
          </li>
        </c:forEach>
  </aside>
  
  
  
 <div id ="modalType" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
      <!--   Creative Tim Branding   -->

    <!--  Made With Paper Kit  -->
    <a href="http://demos.creative-tim.com/paper-kit?ref=paper-bootstrap-wizard" class="made-with-pk">
      <div class="brand">PK</div>
      <div class="made-with">Made with <strong>Paper Kit</strong></div>
    </a>

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
                              <h3 class="wizard-title">List your place</h3>
                              <p class="category">This information will let us know more about your place.</p>
                          </div>
                <div class="wizard-navigation">
                  <div class="progress-with-circle">
                      <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="4" style="width: 15%;"></div>
                  </div>
                  <ul>
                                  <li>
                      <a href="#location" data-toggle="tab">
                        <div class="icon-circle">
                          <i class="ti-map"></i>
                        </div>
                        Location
                      </a>
                    </li>
                                  <li>
                      <a href="#type" data-toggle="tab">
                        <div class="icon-circle">
                          <i class="ti-direction-alt"></i>
                        </div>
                        Type
                      </a>
                    </li>
                                  <li>
                      <a href="#facilities" data-toggle="tab">
                        <div class="icon-circle">
                          <i class="ti-panel"></i>
                        </div>
                        Facilities
                      </a>
                    </li>
                              </ul>
                </div>
                            <div class="tab-content">
                                <div class="tab-pane" id="location">
                                  <div class="row">
                                      <div class="col-sm-12">
                                          <h5 class="info-text"> Let's start with the basic details</h5>
                                    </div>
                                      <div class="col-sm-12">
                                          <div class="form-group">
                                              <label>Title</label>
                                              <input id ="fileinputTitle" type="text" class="form-control" style="width:100%" id="exampleInputEmail1" placeholder="Where is your place located?">
                                          </div>
                                      </div>
                                     
                                     

                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>Place description</label>
                                                <textarea id ="fileinputText" class="form-control" placeholder="" rows="9"></textarea>
                                            </div>
                                        </div>
                                        
                                       <div class="pull-right">
                                            <button type="button" id="fileInputBt" class='btn btn-next btn-fill btn-warning btn-wd'>등록</button>
                                        </div>
                                        <div id="folderNo"></div>
                                  </div>
                                </div>
                                <div class="tab-pane" id="type">
                                    <div id ="photoDiv" class="row">
                                      <div class="col-sm-12">
																		    <!-- Content Header (Page header) -->
																		    <section class="content-header">
																		      <h1>
																		        MainPhotoUpload   ${photoFolder.title}
																		      </h1>
																		      <ol class="breadcrumb">
																		        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
																		        <li><a href="#">Examples</a></li>        
																		        <li class="active">User profile</li>
																		      </ol>
																		    </section>
																		    <!-- Main content -->

																		      <div class="row">
																		           <input id="input-id" type="file" class="file" multiple="true" >
																		      </div>
																		      <!-- /.row -->
																		    <!-- /.content -->
																		    
																		    </div>
																		    
																		    <div class='pull-right'>
																		      <input id="inputNext" type="hidden" class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' />
																		    </div>
																		    

																		  </div>
                                </div>
                                <div class="tab-pane" id="facilities">
                                    <h5 class="info-text">File Complete </h5>
                                    <div class="row">
                                        <div class="col-sm-12">
                                          <h5 class="info-text"> Finish를 눌러주세요</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer">
                                <div class="pull-right">
                                      <input id="Finish" type='button' class='btn btn-finish btn-fill btn-success btn-wd' name='finish' value='Finish' />
                  </div>

<!--                                   <div class="pull-left">
                                      <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
                                  </div> -->
                                  <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
          </div> <!-- row -->
      </div> <!--  big container -->
  </div>





<!-- input_folder popup end -->
  <!-- Content Wrapper. Contains page content -->