<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>나만의 여행</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
  <link rel="stylesheet" href="assets/css/main2.css" /> 
  <link rel="stylesheet" href="assets/css/trip.css" />
    <style type="text/css">
    
    
        	.bignemo {
					margin:30px;
					border-radius:4px;
					border:1px solid rgba(160, 160, 160, 0.3);
					display:inline-block;
					width:30%;
					height:100px;
					float:center;
				}
    			.bignemo .nemonemo {
						border-radius:4px;
						border:3px solid rgba(160, 160, 160, 0.3);
						width:100px;
						height:100px;
						text-decoration:none;
						text-align:center;
						 float:left;
						}		
				.bignemo .nemonemo img{
						width:100%;
						height:100%;
						 float:left;
				}
				.bignemo .subnemo {
						border-radius:4px;					
						width:30%;
						height:30%;
						text-decoration:none;
						text-align:left;
						margin-top: 30px;
					    float:left;
					    font-weight: bold;
				}
				.bignemo #follow{
					float:left;
					border:1px solid rgba(160, 160, 160, 0.3);
				}
				.post .page{
					margin-left:50%;
					float:left;
					border:4px solid rgba(160, 160, 160, 0.3);
				}
						
						
	</style>
    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
  </head>
  <style>


  </style>
  <body class="single">

    <!-- Wrapper -->
      <div id="wrapper">

        <!-- Header -->
          <header id="header">
            <h1><a href="#">나만의 여행지도</a></h1>
            <nav class="links">
              <ul>
                <li><a href="main2.jsp">Home</a></li>
                <li><a href="#">Mypage</a></li>
                <li><a href="#">SetUp</a></li>
              </ul>
            </nav>
            <nav class="main">
              <ul>
                <li class="search">
                  <a class="fa-search" href="#search">Search</a>
                  <form id="search" method="get" action="#">
                    <input type="text" name="query" placeholder="Search" />
                  </form>
                </li>
                <li class="menu">
                  <a class="fa-bars" href="#menu">Menu</a>
                </li>
              </ul>
            </nav>
          </header>

        <!-- Menu -->
          <section id="menu">

            <!-- Search -->
              <section>
                <form class="search" method="get" action="#">
                  <input type="text" name="query" placeholder="Search" />
                </form>
              </section>

            <!-- Links -->
              <section>
                <ul class="links">
                  <li>
                    <a href="#">
                      <h3>Lorem ipsum</h3>
                      <p>Feugiat tempus veroeros dolor</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <h3>Dolor sit amet</h3>
                      <p>Sed vitae justo condimentum</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <h3>Feugiat veroeros</h3>
                      <p>Phasellus sed ultricies mi congue</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <h3>Etiam sed consequat</h3>
                      <p>Porta lectus amet ultricies</p>
                    </a>
                  </li>
                </ul>
              </section>

            <!-- Actions -->
              <section>
                <ul class="actions vertical">
                  <li><a href="#" class="button big fit">Log In</a></li>
                </ul>
              </section>

          </section>
          <div id="main">

            <!-- Post -->
              <article class="post">
                <header>
                  <div class="title">
                    <h2><a href="#">나의 첫번째 유럽여행</a></h2>
                    <p>너무 너무 재밌어요!!! 완전 강추!!! 영국부터 독일까지 15일 대일정~</p>
                  </div>
                  <div class="meta">
                    <time class="published" datetime="2015-11-01">November 1, 2015</time>
                    <a href="#" class="author"><span class="name">손철준</span><img src="images/avatar.jpg" alt="" /></a>
                  </div>
                </header>
                <a href="photo.jsp" onClick="window.open(this.href, '', 'width=900, height=600'); return false;" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                <p>유럽 대장정여행 너무나 행복해요. 혼자 알기 아까운 맛집부터 주요 관광지까지 다 공유해봐요!!!!! 모두 즐거운 여행되세요~~~~</p>
                <p>유럽 대장정여행 너무나 행복해요. 혼자 알기 아까운 맛집부터 주요 관광지까지 다 공유해봐요!!!!! 모두 즐거운 여행되세요~~~~</p>
                <p>유럽 대장정여행 너무나 행복해요. 혼자 알기 아까운 맛집부터 주요 관광지까지 다 공유해봐요!!!!! 모두 즐거운 여행되세요~~~~</p>
                <footer>
                  <ul class="stats">
                    <li><a href="#">General</a></li>
                    <li><a href="#" class="icon fa-heart">28</a></li>
                    <li><a href="#" class="icon fa-comment">128</a></li>
                  </ul>
                </footer>
              </article>

          </div>

		  <div id="main">
		  	<article class="post">
		  		<nav class="links">
		  		 <table border="" style="width: 100%;">
				 <tbody>
					 <tr style="width: 100%;">
						 <td style="width: 30%; border-right: solid 1px rgba(160, 160, 160, 0.3);
						 			line-height: 1; 
									margin-left: 1em;
									padding-left: 1em;
									text-align: center;">
						 	  		<h2>정보</h2>
		            	 </td>
						 <td style="width: 30%; border-right: solid 1px rgba(160, 160, 160, 0.3);
						 			line-height: 1; 
									margin-left: 1em;
									padding-left: 1em;
									text-align: center; ">
						 		<h2>친구</h2>
                		</td>
						 
						 <td style="width: 30%;
								 text-align: center;">
						 	<h2>여행기</h2>
						</td>
					 </tr>
				 </tbody>
			   </table>
          	   </nav>
		  	</article>
		  </div>
        <!-- Main -->
          <div id="main">

            <!-- Post -->
              <article class="post">
                <header>
                  <div class="title">
                  	<img src="images/information.PNG"  width="35" height="35" alt="" />
                    <h2><a href="#">정보</a></h2>             
                  </div>
                  
                  <div class="meta">
                    <time class="published" datetime="2015-11-01">November 1, 2015</time>
                    <a href="#" class="author"><span class="name">손철준</span><img src="images/avatar.jpg" alt="" /></a>
                  </div>
                </header>
               
               <table border="" style="width: 100%;">
				 <tbody>
					 <tr style="width: 100%;">
						 <td style="width: 20%;border-right: solid 1px rgba(160, 160, 160, 0.3);
						 			line-height: 1; 
									margin-left: 1em;
									padding-left: 1em;">
						 	<ul>
		                			<li ><a href="main2.jsp">개요</a></li><br/><br/>
		                			<li><a href="#">연락처 및 기본정보</a></li><br/><br/>
		                			<li><a href="#">중요 이벤트</a></li>
		            	  	</ul>
		            	 </td>
						 <td style="width: 40%; ">
						 		<h4>xx고등학교 졸업</h4><hr>
                				<h4>xx시 거주</h4><hr/>
                				<h4>xx에서 근무</h4>
                		</td>
						 
						 <td style="width: 40%;">
						 	<h4>연락처: 010-1111-1111</h4>
						 	<h4>생년월일: 1992년 08월 28일</h4>
						</td>
					 </tr>
				 </tbody>
			   </table>

                
               
              </article>

          </div>
          <div id="main">
          	<article class="post" float="bottom"; style="padding-bottom:56px";>
          		<header>
          			<div class="title">
                  	<img src="images/friend.PNG"  width="60" height="60" alt="" />
                    <h2><a href="#">친구</a></h2>         
                  </div>
                  
                  <div class="meta">
                    <time class="published" datetime="2016-11-15">November 1, 2015</time>
                    <a href="#" class="author"><span class="name">손철준</span><img src="images/avatar.jpg" alt="" /></a>
                  </div>
          		</header>
          		<table>
          		<td>
					<div style="float:left; width:90%; border:1px;">
						
						  <div class ="bignemo">
							  <div class="nemonemo"><img src="images/cheol.PNG"   alt="" /></div>
							  <div class="subnemo">손철준 <br>127팔로워</div>
							  <button id="follow" >follow</button>						  
						  </div>
						  <div class ="bignemo">
							  <div class="nemonemo"><img src="images/friend.PNG"   alt="" /></div>
							  <div class="subnemo">김현섭 <br>128팔로워</div>
							  <button id="follow" >follow</button>
						  </div>
						  <div class ="bignemo">
							  <div class="nemonemo"><img src="images/friend.PNG"   alt="" /></div>
							  <div class="subnemo">김량한 <br>129팔로워</div>
							  <button id="follow" >follow</button>
						  </div>
				   </div>
				</td>
				
			
			   </table>
			   <div class="page">
			   	◀	 1 2 3 4 5   ▶
			   </div>
          	</article>
          </div>
          
          <div id="main">
          	<article class="post" float="bottom"; style="padding-bottom:56px";>
          		<header>
          			<div class="title">
                  	<img src="images/trip.PNG"  width="60" height="60" alt="" />
                    <h2><a href="#">여행기</a></h2>
                    <nav class="links" style="border-bottom: 0;
									font-family: "Raleway", Helvetica, sans-serif;
									font-size: 0.7em;
										font-weight: 400;
											letter-spacing: 0.25em;
										text-transform: uppercase;">
			              <ul>
			                <li><a href="main2.jsp">모든 여행</a></li>
			                <li><a href="#">여행 그룹</a></li>
			              </ul>
		            </nav>
                     	         
                  </div>
                  
                  <div class="meta">
                    <time class="published" datetime="2016-11-15">November 1, 2015</time>
                    <a href="#" class="author"><span class="name">손철준</span><img src="images/avatar.jpg" alt="" /></a>
                  </div>
          		</header>
          		
          		<table>
	          		<td>
						<div style="float:left; width:90%; border:1px; padding-left:70px;">
							  <hr>
							  <div class ="tripnemo">
							  		<div class="photonemo">
							  			<img src="images/ssss.PNG"  alt="" />
							  		</div>			  
							  </div>
							  <div class ="tripnemo">
								    <div class="photonemo">
								    	<img src="images/trip1.PNG"  alt="" />
							  	    </div>
							  </div>
							  <div class ="tripnemo">
								    <div class="photonemo">
									    <img src="images/trip2.PNG"  alt="" />
							  		</div>
							  </div>
							  <hr>
							  <div class ="tripnemo">
								  	<div class="photonemo">
								  		<img src="images/trip1.PNG"  alt="" />
							  		</div>			  
							  </div>
							  <div class ="tripnemo">
								    <div class="photonemo">
								   		 <img src="images/ssss.PNG"  alt="" />
							  		</div>
							  </div>
							  <div class ="tripnemo">
								    <div class="photonemo">
								    	<img src="images/trip2.PNG"  alt="" />
							  		</div>
							  </div>
							  <hr> 
					   </div>
					</td>
				
			
			   </table>
			   
          	</article>
          </div>

        <!-- Footer -->
          <section id="footer">
            <ul class="icons">
              <li><a href="#" class="fa-twitter"><span class="label">Twitter</span></a></li>
              <li><a href="#" class="fa-facebook"><span class="label">Facebook</span></a></li>
              <li><a href="#" class="fa-instagram"><span class="label">Instagram</span></a></li>
              <li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
              <li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
            </ul>
            <p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
          </section>

      

    <!-- Scripts -->
      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/skel.min.js"></script>
      <script src="assets/js/util.js"></script>
      <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
      <script src="assets/js/main.js"></script>

  </body>
</html>