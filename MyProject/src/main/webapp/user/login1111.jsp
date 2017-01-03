<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- <div id="loginmodal" class="login-box"> -->
<div id="loginmodal"  class="modal fade">
<div class="login-box"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="login-logo" style="background-color:#fff; margin-bottom:0;">
    <a href="index2.html"><b>Login</b></a>
    <button type="button" class="close" data-dismiss="modal">×</button> 
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form  name="loginForm"  action="/user/login" method="post">
      <div class="form-group has-feedback">
        <input name ="userId" type="email" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="password" type="password" class="form-control" placeholder="Password">
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
                   <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
           </a>
        </div>
        <!-- /.col -->
      </div>
    </form>
    
    
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a id="registerButton" class="btn btn-block btn-social btn-facebook btn-flat"  data-target="#registermodal" data-toggle="modal"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>

  </div>
  <!-- /.login-box-body -->
</div>
</div>
<!-- /.login-box -->

