<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="registermodal" class="modal fade">
<div class="register-box" >
  <div class="register-logo" style="background-color:#fff; margin-bottom:0;">
    <a href="index2.html"><b>Legister</b></a>
    <button type="button" class="close" data-dismiss="modal">×</button>
  </div>

  <div class="register-box-body" >
    <p class="login-box-msg">Register a new membership</p>

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
          <input type="button" name ="Register"  class="btn btn-primary btn-block btn-flat"  value="Register" data-dismiss="modal">
        </div>
        
        <!-- /.col -->
      </div>
    </form>


    <a href="login.html" class="text-center">I already have a membership</a>
  </div>
  <!-- /.form-box -->
</div>
</div>


