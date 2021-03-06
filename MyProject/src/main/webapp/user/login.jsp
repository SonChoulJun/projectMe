<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/html/node_modules/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/html/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/html/plugins/iCheck/square/blue.css">
  <link rel="stylesheet" href="/html/colorBox/colorbox.css" />
  <style>
    .login-page, .register-page {
         background: white !important;
    }   
    
    .bg-aqua, .callout.callout-info, .alert-info, .label-info, .modal-info .modal-body {
    background-color: #3b5998 !important;
    border-right:0px;
    }
    
    .btn-social>:first-child {
    border-right: 0px solid rgba(0,0,0,0.2);
}
  </style>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">


<div id="loginmodal" class="login-box">
  <div class="login-logo">
    <a href="index2.html"><b>M</b>e<b>M</b>o<b>r</b>y<br/><b>B</b>o<b>x</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
  
    <p class="login-box-msg"><a class="text-center">Sign in to start your session</a></p>

    <form  name="loginForm"  action="/user/login"  target="_parent" method="post">
      <div class="form-group has-feedback">
        <input name ="userId" type="email" class="form-control" placeholder="Email" style="
																											    margin-bottom: 30px;
																											    height: 50px;
																											">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="password" type="password" class="form-control" placeholder="Password" style="height:50px;">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          .<a href="javascript:fncLogin();">
                   <button type="submit" class="btn btn-primary btn-block btn-flat" style="height:50px;">Sign In</button>
           </a>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <!-- <p>- OR -</p> -->
      <a id="registerColorBox"  class="btn btn-block btn-social btn-facebook btn-flat" style="
    margin-top: 40px;
    height: 45px; padding-left: 60px;"><i class="fa fa-user bg-aqua" style="width: 45px; "></i> Sign in using
        Facebook</a>
      <!-- <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-user bg-aqua"></i> Sign in using
        Google+</a> -->
       
       
    </div>
    <!-- /.social-auth-links -->

    <!-- <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a> -->

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
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
<!-- Bootstrap 3.3.6 -->
<script src="/html/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/html/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>

<script src="/html/colorBox/jquery.colorbox-min.js"></script>
<!-- <script type="text/javascript">
$('#closebox').bind("click", function(){
	$.colorbox.close();
});
</script> -->

<script type="text/javascript">
           /* $("registerColorBox").on("click", function({
        	   $.colorbox({href:"/user/register2222.jsp" , iframe:true, width: "80%", height: "80%" });
           }); */
   /*  jQuery('a#registerColorBox').onClosed(); */
   /* $('#registerColorBox').colorbox.close(); */
             /* var $form = $("#registerColorBox").parent().parent().parent(); */
       /*  jQuery('#registerColorBox').colorbox({inline:true,  opacity:0.5, width : '600px', height : '570px', scrolling: false, retinaUrl:true}); */ 
 /*    jQuery('#registerColorBox').colorbox({inline:true,  opacity:0.5, width : '600px', height : '570px', scrolling: false, retinaUrl:true}); */
    $("#registerColorBox").on("click",function(){
    	location.href="/user/register.jsp";
    });
 
 </script>
</body>
</html>
