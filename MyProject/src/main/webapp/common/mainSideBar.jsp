<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- 유저정보 -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/html/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${targetUser.userId}</p>
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
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">여행목록</li>
        <li class="folder_input" id="folder_input">+</li>
        <c:forEach var="photoFolder" items="${folderList}">
       
          <li class="treeview">
            <a href="/profile/photoPage/${photoFolder.pfNo}">
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
                  <c:forEach var="photoTheme" items="${photoFolder.photoTheme}">
                    <li><a href="/mapBoard/getPhotoFolder?folderNum=${photoFolder.pfNo}"><i class="fa fa-circle-o"></i>${photoTheme.themeName}</a></li>
                  </c:forEach>
                 </ul>
              </c:if>
            </a>
           
          </li>
        </c:forEach>

        
      <!--   <li>
          <a href="/photo_upload/mainUpload.jsp">
            <i class="fa fa-th"></i> <span>대만돌기</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>어딘가</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> 1</a></li>
            <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> 2</a></li>
            <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> 3</a></li>
            <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> 4</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>부산돌기</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 1</a></li>
            <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 2</a></li>
            <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 3</a></li>
            <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 4</a></li>
            <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 5</a></li>
            <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 6</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit"></i> <span>하하하하</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/mapBoard/getPhotoFolder?folderNum=10074"><i class="fa fa-circle-o"></i> 1</a></li>
            <li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> 2</a></li>
            <li><a href="../forms/editors.html"><i class="fa fa-circle-o"></i> 3</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>후후후</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
       </li>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  
  
 <!-- input_folder popup -->
<div id="popup1" class="overlay">
  <form action="/mapBoard/addFolder" method="post">
    <div class="popup">
      <h2>PhotoBorad input</h2>
      <a class="close">&times;</a>
      <div class="box box-warning">
        <div class="box-header with-border">
          <h3 class="box-title">pomnwq@naver.com</h3>
        </div>
              <!-- /.box-header -->
       <div class="box-body">
         <form role="form">
                    <!-- text input -->
           <div class="form-group">
              <label>Title</label>
              <input name="title" type="text" class="form-control" placeholder="Enter ...">
           </div>
    
          <!-- textarea -->
          <div class="form-group">
             <label>Comment</label>
             <textarea name="text"class="form-control" rows="3" placeholder="Enter ..."></textarea>
          </div>
          <button type="submit" class="btn btn-block btn-primary btn-flat">summit</button>
                   
        </div>
      </div>
      <!--box box-warning-->
    </div>
  </form>
</div>

<script src="/html/folder-input/folder-input.js"></script>
<!-- input_folder popup end -->
  <!-- Content Wrapper. Contains page content -->