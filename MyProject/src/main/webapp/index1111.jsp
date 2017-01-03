<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    
    <title>Stylish Portfolio - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/html/index/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/html/index/css/stylish-portfolio.css" rel="stylesheet">
    <!--Slider CSS(ìì ) -->   
    <link rel="stylesheet" href="/html/index/css/slider.css">
    <!-- Custom Fonts -->
    <link href="/html/index/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    <!-- 아래는 login창 -->
    <link rel="stylesheet" href="/html/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/html/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/html/plugins/iCheck/square/blue.css">
  

</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top" onclick=$("#menu-close").click();>Start Bootstrap</a>
            </li>
            <li>
                <a href="#top" onclick=$("#menu-close").click();>Home</a>
            </li>
            <li>
                <a href="#about" onclick=$("#menu-close").click();>About</a>
            </li>
            <li>
                <a href="#services" onclick=$("#menu-close").click();>Services</a>
            </li>
            <li>
                <a href="#portfolio" onclick=$("#menu-close").click();>Portfolio</a>
            </li>
            <li>
                <a href="#contact" onclick=$("#menu-close").click();>Contact</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
            <h1>Social Trip</h1>
            <!-- Slider -->
                            <section class="cd-intro">
                                <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s" >
                                <span class="cd-words-wrapper">
                                    <b class="is-visible">Trip</b>
                                    <b>LoadMap</b>
                                    <b>Planner</b>
                                    <b>Social</b>
                                    <b>Our Memory</b>
                                </span>
                                </h1>
                                </section>
            <br>
            
            <c:import url="/user/login1111.jsp"></c:import>
            <c:import url="/user/register1111.jsp"></c:import>
            <a href="#about" class="btn btn-dark btn-lg">Find Out More</a>
            <!-- <a href="/user/login.jsp" class="btn btn-dark btn-lg">login</a> -->
            <a id="loginButton" class="btn btn-dark btn-lg"  data-target="#loginmodal" data-toggle="modal" >login</a>
        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2> 많은 사람들이 <br>당신의 아름다운 여행을 기다리고있습니다!</h2>
                    <p class="lead"> A lot of people are waitfing for your beautiful trip</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Our Services</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-cloud fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>'Memory'</strong>
                                </h4>
                                <p>하나뿐인 여행, 커플, 축제, 행사<br>우리들의 추억을 기록합니다</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-shield fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>'Planner'</strong>
                                </h4>
                                <p>다른사람들의 여행을 통해 <br>나만의 여행플래너를 만드세요</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-compass fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>'Navigation'</strong>
                                </h4>
                                <p>여행을 갈 때 당신의 목적지로 안내합니다</p>
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-flask fa-stack-1x text-primary"></i>
                            </span>
                                <h4>
                                    <strong>'Sharing'</strong>
                                </h4>
                                <p>자신의 여행을 공유하고 <br>사람들과 이야기하세요</p>
                                <a href="#" class="btn btn-light">Lear
                                <a href="#" class="btn btn-light">Learn More</a>
                            </div>
                        </div>      
                    </div>                        
                                          
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2>Our Work</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/html/index/img/portfolio-1.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/html/index/img/portfolio-2.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/html/index/img/portfolio-3.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive" src="/html/index/img/portfolio-4.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                    <a href="#" class="btn btn-dark">View More Items</a>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>The buttons below are impossible to resist.</h3>
                    <a href="#" class="btn btn-lg btn-light">Click Me!</a>
                    <a href="#" class="btn btn-lg btn-dark">Look at Me!</a>
                </div>
            </div>
        </div>
    </aside>

    <!-- Map -->
    <section id="contact" class="map">
        <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="/mappc.jsp"></iframe>
        <br />1
        <small>
            <a href="http://192.168.0.17:8080/mappc.html"></a>
        </small>
        </iframe>
    </section>
    
    <section id="contact" class="mapPhone" >
        <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="/mapmobile.jsp"></iframe>
        <br />
        <small>
            <a href="/mapmobile.html"></a>
        </small>
        </iframe>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Start Bootstrap</strong>
                    </h4>
                    <p>3481 Melrose Place
                        <br>Beverly Hills, CA 90210</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i> <a href="mailto:name@example.com">name@example.com</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
        <a id="to-top" href="#top" class="btn btn-dark btn-lg"><i class="fa fa-chevron-up fa-fw fa-1x"></i></a>
    </footer>
    
    

    <!-- jQuery -->
    <script src="/html/index/js/jquery.js"></script>
    
    <!-- jQuery 2.2.3  login창 위한-->
<script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- iCheck login창 위한-->
<script src="/html/plugins/iCheck/icheck.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="/html/index/js/bootstrap.min.js"></script>
    
    <!-- Slider JavaScript -->
    <script src="/html/index/js/slider.js"></script>
    
    <!-- iCheck 회원가입위한.-->
<script src="/html/login/check.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    //#to-top button appears after scrolling
    var fixed = false;
    $(document).scroll(function() {
        if ($(this).scrollTop() > 250) {
            if (!fixed) {
                fixed = true;
                // $('#to-top').css({position:'fixed', display:'block'});
                $('#to-top').show("slow", function() {
                    $('#to-top').css({
                        position: 'fixed',
                        display: 'block'
                    });
                });
            }
        } else {
            if (fixed) {
                fixed = false;
                $('#to-top').hide("slow", function() {
                    $('#to-top').css({
                        display: 'none'
                    });
                });
            }
        }
    });
    // Disable Google Maps scrolling
    // See http://stackoverflow.com/a/25904582/1607849
    // Disable scroll zooming and bind back the click event
    var onMapMouseleaveHandler = function(event) {
        var that = $(this);
        that.on('click', onMapClickHandler);
        that.off('mouseleave', onMapMouseleaveHandler);
        that.find('iframe').css("pointer-events", "none");
    }
    var onMapClickHandler = function(event) {
            var that = $(this);
            // Disable the click handler until the user leaves the map area
            that.off('click', onMapClickHandler);
            // Enable scrolling zoom
            that.find('iframe').css("pointer-events", "auto");
            // Handle the mouse leave event
            that.on('mouseleave', onMapMouseleaveHandler);
        }
        // Enable map zooming with mouse scroll when the user clicks the map
    $('.map').on('click', onMapClickHandler);
    </script>
    
   <!-- 아래로 login창 위한.=== -->
    
    <script type="text/javascript">
<!--
    function fncLogin() {
        var id=document.loginForm.userId.value;
        var pw=document.loginForm.password.value;
        if(id == null || id.length <1) {
            alert('Email 을 입력하지 않으셨습니다.');
            document.loginForm.userId.focus();
            return;
        }
        
        if(pw == null || pw.length <1) {
            alert('패스워드를 입력하지 않으셨습니다.');
            document.loginForm.password.focus();
            return;
        }
        document.loginForm.submit();
    }
-->
</script>

<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>


 <script type="text/javascript">
  var folderNo;
  $(function() {
	  
	  var aaa= registerButton;
        $( "#registerButton" ).on("click",function() {
            //alert(  $( this ).text().trim() );
            
            //////////////////////////// 추가 , 변경된 부분 ///////////////////////////////////
            //self.location ="/user/getUser?userId="+$(this).text().trim();
            ////////////////////////////////////////////////////////////////////////////////////////////
            var obj = new Object(); // JSON형식으로 변환 할 오브젝트
            obj.title = $("#fileinputTitle").val();
            obj.text = $("#fileinputText").val();
             var json_data = JSON.stringify(obj);
            $.ajax( 
                {
                  url : "/mapBoard/addFolder",
                   method :"POST",
                   data :json_data,
                  dataType : "json" ,
                  headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json"
                  },
                  success : function(JSONData , status) {
                      $("#folderNo").attr("name",JSONData.folderNo);
                      folderNo=JSONData.folderNo;
                      alert("등록완료"+folderNo);
                    
                      
                      //$("#input-id").fileinput();
                      $("#input-id").fileinput('refresh', {
                            language: 'LANG',
                            uploadUrl: '/mapBoard/addphoto/'+folderNo,
                            uploadAsync: true,
                            multiple:true,
                            allowedFileExtensions : ['jpg', 'png','gif']   
                          });
                  }
              });
                   
        });  
      }); 
  </script>
  



</body>

</html>
