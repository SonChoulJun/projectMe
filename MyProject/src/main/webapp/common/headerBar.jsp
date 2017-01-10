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


        
<%--       <div id="myUserNo" name="${myUser.userNO}"></div> --%>
      <div class="navbar-custom-menu">
         <form action="/profile/search" method="post">
          <input type="text" name="searchText" class="form-control" placeholder="Search..."   name="text">
        </form>
      </div>
<!--        -->

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a id="mgAlram" href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>

              <c:if test="${myUser.alramCount!=0}">
                <span id="mgAlramcount" class="label label-success">${myUser.alramCount}</span>
              </c:if>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You messages</li>
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
              <!-- <span class="label label-warning">10</span> -->
            </a>
          </li>


          <!-- Tasks: style can be found in dropdown.less -->
<!--           <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                inner menu: contains the actual data
                <ul class="menu">
                  <li>Task item
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  end task item
                  <li>Task item
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  end task item
                  <li>Task item
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  end task item
                  <li>Task item
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  end task item
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li> -->
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