<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | User Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="/html/node_modules/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/html/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/html/dist/css/skins/_all-skins.min.css">

<link rel="stylesheet" href="/html/dist/css/skins/_all-skins.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">


<link rel="stylesheet" href="/html/assets/css/searchList.css">
<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>


<!-- profile photo -->

<link rel="stylesheet" href="/html/assets/css/style.css">
<link rel="stylesheet" href="/html/folder-input/folder-input.css">
<link rel="stylesheet" href="/html/friendList/friend_list.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="/common/headerBar.jsp"></c:import>
		<c:import url="/common/mainSideBar.jsp"></c:import>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1001px;">

			<section class="content">
			<div>
				<p>회원검색</p>
			</div>
			<div class="row">
				<!--Pattern HTML-->
				<div id="pattern" class="pattern">
					<ul class="list img-list">
						<c:if test="${!listUser.isEmpty()}">
							<c:forEach var="user" items="${listUser}">
								<li style="background-color: #fff; border: 1px solid #ddd; margin-right:40px; margin-bottom:20px; width: 30% ;"><a
									href="/profile/subProfile?userId=${user.userId}" class="inner">
										<div class="li-img" style="padding:5px;">
											<img style="height:100px;" src="/html/dist/img/profile/${user.profileImg}"
												onerror="this.src='/html/dist/img/defaultImage.jpg';" />
												
										</div>
										<div class="li-text">
											<h4 class="li-head">${user.userName}</h4>
											<p class="li-sub" style="padding-left:10px;">${user.joinDate}</p>
										</div>
									<!-- <button id="followingButtonn" class="btn bg-orange margin" style="border:0px">팔로워</button> -->
								</a>
								</li>
							</c:forEach>
						</c:if>
						<c:if test="${listUser.isEmpty()}">
							<p>검색결과없음</p>
						</c:if>
					</ul>
				</div>
			</div>

			</section>

			<section class="content">
			<div>
				<p>게시물 검색</p>
			</div>
			<div class="row">
				<!--Pattern HTML-->
				<div class="container">
					<div class="well well-sm">
						<strong>Display</strong>
						<div class="btn-group">
							<a href="#" id="list" class="btn btn-default btn-sm"><span
								class="glyphicon glyphicon-th-list"> </span>List</a> <a href="#"
								id="grid" class="btn btn-default btn-sm"><span
								class="glyphicon glyphicon-th"></span>Grid</a>
						</div>
					</div>
					<div id="products" class="row list-group">
					
					<c:if test="${!boardList.isEmpty()}">
					   <c:forEach var="photoFolder" items="${boardList}">
							<div class="item  col-xs-4 col-lg-4">
								<div class="thumbnail">
									<img class="group list-group-image" style="width: auto; height: 250px;
                                        max-width: 350px;"
										src="/html/assets/img/uploadedPhoto/${photoFolder.photoTheme[0].photoList[0].folderName}" alt="" />
									<div class="caption">
									<div style="width:70%; height:35%; ">
										<h4 class="group inner list-group-item-heading">${photoFolder.title}</h4>
									</div>
										<p class="group inner list-group-item-text" style="display: -webkit-box;
										      display: -ms-flexbox;
										      display: box;
										      margin-top:1px;
										      max-height:20px;
										      max-width:320px;
										      overflow:hidden;
										      vertical-align:top;
										      word-break:break-all;
										      -webkit-box-orient:vertical;
										      -webkit-line-clamp:3;
										       text-overflow: ellipsis; ">${photoFolder.text}</p>
										<div class="row">
											<div class="col-xs-12 col-md-6">
												<p class="lead" ><a href="/profile/subProfile?userId=${photoFolder.user.userId}" style="color:blue;">${photoFolder.user.userName}</p></a>
											</div>
											<div class="col-xs-12 col-md-6">
												<a class="btn btn-success"
													 href="/mapboard/getPhotoFolder?folderNum=${photoFolder.pfNo}">보러가기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
					   </c:forEach>
                    </c:if>
                    <c:if test="${photoFolder.isEmpty()}">
                     <p>검색결과없음</p>
                            
                    </c:if>
						<!-- <div class="item  col-xs-4 col-lg-4">
							<div class="thumbnail">
								<img class="group list-group-image"
									src="http://placehold.it/400x250/000/fff" alt="" />
								<div class="caption">
									<h4 class="group inner list-group-item-heading">Product
										title</h4>
									<p class="group inner list-group-item-text">Product
										description... Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat.</p>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p class="lead">$21.000</p>
										</div>
										<div class="col-xs-12 col-md-6">
											<a class="btn btn-success"
												href="http://www.jquery2dotnet.com">Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item  col-xs-4 col-lg-4">
							<div class="thumbnail">
								<img class="group list-group-image"
									src="http://placehold.it/400x250/000/fff" alt="" />
								<div class="caption">
									<h4 class="group inner list-group-item-heading">Product
										title</h4>
									<p class="group inner list-group-item-text">Product
										description... Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat.</p>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p class="lead">$21.000</p>
										</div>
										<div class="col-xs-12 col-md-6">
											<a class="btn btn-success"
												href="http://www.jquery2dotnet.com">Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item  col-xs-4 col-lg-4">
							<div class="thumbnail">
								<img class="group list-group-image"
									src="http://placehold.it/400x250/000/fff" alt="" />
								<div class="caption">
									<h4 class="group inner list-group-item-heading">Product
										title</h4>
									<p class="group inner list-group-item-text">Product
										description... Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat.</p>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p class="lead">$21.000</p>
										</div>
										<div class="col-xs-12 col-md-6">
											<a class="btn btn-success"
												href="http://www.jquery2dotnet.com">Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item  col-xs-4 col-lg-4">
							<div class="thumbnail">
								<img class="group list-group-image"
									src="http://placehold.it/400x250/000/fff" alt="" />
								<div class="caption">
									<h4 class="group inner list-group-item-heading">Product
										title</h4>
									<p class="group inner list-group-item-text">Product
										description... Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat.</p>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p class="lead">$21.000</p>
										</div>
										<div class="col-xs-12 col-md-6">
											<a class="btn btn-success"
												href="http://www.jquery2dotnet.com">Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item  col-xs-4 col-lg-4">
							<div class="thumbnail">
								<img class="group list-group-image"
									src="http://placehold.it/400x250/000/fff" alt="" />
								<div class="caption">
									<h4 class="group inner list-group-item-heading">Product
										title</h4>
									<p class="group inner list-group-item-text">Product
										description... Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat.</p>
									<div class="row">
										<div class="col-xs-12 col-md-6">
											<p class="lead">$21.000</p>
										</div>
										<div class="col-xs-12 col-md-6">
											<a class="btn btn-success"
												href="http://www.jquery2dotnet.com">Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div> -->
					</div>
				</div>
				<!--End Pattern HTML-->
			</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<c:import url="/common/mainFoot.jsp"></c:import>
	</div>
	<!-- ./wrapper -->


	<!-- jQuery 2.2.3 -->
	<script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="/html/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="/html/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/html/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->


	<!-- profile photo -->
	<script src="/html/assets/js/index.js"></script>
	<script src="/html/dist/js/demo.js"></script>
	<script src="/html/assets/js/fileinput.js" type="text/javascript"></script>
	<script src="/html/dist/js/index.js"></script>
	<script src="/html/folder-input/folder-input.js"></script>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
	<script src="/html/assets/js/searchindex.js"></script>
	
	<!-- <script type="text/javascript">
$(function() {
    $("#followingButtonn").on("click",function() {
        //Debug..
        alert(  "팔로워" );
  
        $.ajax( 
            {
              url : "/user/addFollower?followNo=${user.userNo}&userNo=${myUser.userNo}&followId=${user.userId}",
               method :"POST",
              dataType : "json" ,
              headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
              },
              success : function(JSONData , status) {
                  if(JSONData.followOk=="insert"){
                      
                      $("#followingButtonn").css("background-color","green");
                  }else{
                      
                	  $("#followingButtonn").css("background-color","green");
                  }
              }
          });
        
          ////////////////////////////////////////////////////////////////////////////////////////////
        
    });
  }); 
</script> -->

</body>
</html>
