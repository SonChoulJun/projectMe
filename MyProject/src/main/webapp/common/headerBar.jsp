 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <header class="main-header">
    <!-- Logo -->
    <a href="/profile/mainProfile" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>M</b>B</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Memory</b>Box</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>


        

      <div class="navbar-custom-menu">
         <form action="/profile/search" method="post">
          <input type="text" name="searchText" class="form-control" placeholder="Search..."   name="text">
        </form>
      </div>
<!--        -->
      <div id="myUserNo" name="${myUser.userNo}"></div>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a id="mgAlram" href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <c:if test="true">
                <span id="mgAlramcount" class="label label-success">${myUser.alramCount}</span>
              </c:if>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul id ="alramMenu" class="menu">
                <c:forEach    var="alramList"     items="${alramList}">
                  <li><!-- start message -->
<%--                   <c:if test="${alramList.polderNo}==0">
                  <a href="#">
                  </c:if>
                  <c:if test="${alramList.polderNo}!=0">
                    <a href="/mapBoard/getPhotoFolder?folderNum=${alramList.polderNo}">
                  </c:if> --%>
                  <a href="/mapBoard/getPhotoFolder?folderNum=${alramList.polderNo}">
                      <div class="pull-left">
                        <img src="/html/dist/img/profile/${alramList.user.profileImg}" class="user-image" onerror="this.src='/html/dist/img/defaultImage.jpg';" >
                      </div>
                      <h4>
                        ${alramList.user.userName}
                        <small><i class="fa fa-clock-o"></i> ${alramList.alarmDate}</small>
                      </h4>
                      <p>${alramList.text}</p>
                    </a>
                  </li>
                  </c:forEach>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li id="msgBt" class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
          </li>

          <!-- Tasks: style can be found in dropdown.less -->

          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/html/dist/img/profile/${myUser.profileImg}" class="user-image" onerror="this.src='/html/dist/img/defaultImage.jpg';" >
              <span class="hidden-xs">${myUser.userId}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="/html/dist/img/profile/${myUser.profileImg}" class="img-circle" onerror="this.src='/html/dist/img/defaultImage.jpg';" >
                <p>
                           ${myUser.userName}
                  <small> ${myUser.joinDate}</small>
                </p>
                
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">                
                  <a href="/user/get?userId=${myUser.getUserId()}" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="/user/logout/${myUser.userNo}" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->