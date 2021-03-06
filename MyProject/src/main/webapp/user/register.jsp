<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Registration Page</title>
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
     <style>
    .login-page, .register-page {
         background: white !important;
    }   
  </style>
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="index2.html"><b>M</b>e<b>M</b>o<b>r</b>y<br/><b>B</b>o<b>x</b></a>
  </div>

  <div class="register-box-body">
  <p class="login-box-msg"><a class="text-center">Register a new membership</a></p>
    

    <form name ="Member_Input" action="/user/add" method="post">
      <div class="form-group has-feedback">
        <input name ="userName" type="text" class="form-control" placeholder="userName">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name ="userId" type="email" class="form-control" placeholder="Email(id)">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name ="password" type="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name ="RetypePassword" type="password" class="form-control"  placeholder="Retype password">

        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name ="phone" type="text" class="form-control" placeholder="phoneNumber">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> I agree to the <a href="#">terms</a>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <input type="button" name ="Register"  class="btn btn-primary btn-block btn-flat" value="Register">
        </div>
        
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="/user/login.jsp" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-user bg-aqua"></i> Login</a>
      <!-- <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
        Google+</a> -->
    </div>

    <!-- <a href="login.html" class="text-center">I already have a membership</a> -->
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/html/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/html/plugins/iCheck/icheck.min.js"></script>
<script src="/html/login/check.js"></script>


</body>
</html>
