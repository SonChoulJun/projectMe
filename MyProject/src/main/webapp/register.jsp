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
  <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="index2.html"><b>Admin</b>LTE</a>
  </div>

  <div class="register-box-body">
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
          <input type="button" name ="Register"  class="btn btn-primary btn-block btn-flat" value="Register">
        </div>
        
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
        Google+</a>
    </div>

    <a href="login.html" class="text-center">I already have a membership</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>

var logok=0;
var idck=0;
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
  
  
  function loginCheak(){
    var userName=$("input[name='userName']").val();
    var userId=$("input[name='userId']").val();
    var password=$("input[name='password']").val();
    var RetypePassword=$("input[name='RetypePassword']").val();
    var phone=$("input[name='phone']").val();
    
    if(userName == null || userName.length <1){
    	  $('form div p').remove();
        $($("div")[3]).append('<p>이름은 반드시 입력하셔야 합니다.</p>').css('color', 'red');
        $("input[name='userName']").focus();
        return;
      }
    
    if(userId == null || userId.length <1){
    	$('form div p').remove();
    	$('form div p2').remove();
    	$($("div")[4]).append('<p>아이디를 입력하셔야 합니다.</p>').css('color', 'red');
      $("input[name='userId']").focus();
      return;
     }
    
    if(password == null || password.length <1){
        $('form div p').remove();
        $('form div p1').remove();
        $($("div")[6]).append('<p>패스워드를 입력하셔야 합니다.</p>').css('color', 'red');
        $("input[name='password']").focus();
        return;
       }
    
    
    if(RetypePassword == null || RetypePassword.length <1){
        $('form div p').remove();
        $('form div p1').remove();
        $($("div")[6]).append('<p>패스워드 확인를 입력하셔야 합니다.</p>').css('color', 'red');
        $("input[name='RetypePassword']").focus();
        return;
    }
    
    
     if(phone == null || phone.length <1){
       $('form div p').remove();
        $($("div")[7]).append('<p>핸드폰번호를 입력해주세요</p>').css('color', 'red');
        $("input[name='phone']").focus();
        return;
      }
        
      if(logok==0){
       return;
      }
      if(idck==0){
      	return;
      }
        
       
        Member_Input.submit();

  }
  
  $(function() {
       $( "input[name='Register']" ).on("click" , function() {
    	   loginCheak();
      });
       
       $("input[name='password']").keyup(function() {
    	   passchk();
    	  });
       
       $("input[name='RetypePassword']").keyup(function() {
           passchk();
          });
    }); 
  
  
  function passchk(){ 
	  
	    var password=$("input[name='password']").val();
	    var RetypePassword=$("input[name='RetypePassword']").val();
	     $('form div p').remove();
	       $('form div p1').remove();
	   if(password != RetypePassword) {
       $($("div")[6]).append('<p1>패스워드가 다릅니다.</p1>').css('color', 'red');
       logok=0;
	   } else if(Member_Input.password.value.length<7) {
		   $($("div")[6]).append('<p1>7자리 이상입력해주세요</p1>').css('color', 'red');
		   logok=0;
	   }else {
		   $($("div")[6]).append('<p1>비밀번호가 같습니다</p1>').css('color', 'green');
		   logok=1;
	   }
	   return;
	  }
  
  $(function() {
	  $( "input[name='userId']" ).keyup(function() {
	      //Debug..
	      //alert(  $( this ).text().trim() );
	      
	      //////////////////////////// 추가 , 변경된 부분 ///////////////////////////////////
	      //self.location ="/user/getUser?userId="+$(this).text().trim();
	      ////////////////////////////////////////////////////////////////////////////////////////////
	      var obj = new Object(); // JSON형식으로 변환 할 오브젝트
	      obj.userId = $("input[name='userId']").val();
	       var json_data = JSON.stringify(obj)
	      $.ajax( 
	          {
	            url : "/user/jsonLogin",
	             method :"POST",
	             data :json_data,
	            dataType : "json" ,
	            headers : {
	              "Accept" : "application/json",
	              "Content-Type" : "application/json"
	            },
	            success : function(JSONData , status) {
	
	              //Debug...
	              //alert(status);
	              //Debug...
	              //alert("JSONData : \n"+JSONData);
	              var displayValue;


	              //Debug...                  
	              //alert(displayValue);
	              $('form div p').remove();
	              $('form div h3').remove();
	              $('form div p2').remove();
	              if(JSONData.userOk =="true"){
	            	  $($("div")[4]).append("<p2>아이디 사용가능</p2>").css('color', 'green');
	            	  idck=1;
	              }else{
	            	  $($("div")[4]).append("<p2>아이디 중복</p2>").css('color', 'red');
	            	  idck=0;
	              }
	              
	            }
	        });
	      
	        ////////////////////////////////////////////////////////////////////////////////////////////
	      
	  });
  }); 
  
  
 
</script>
</body>
</html>
