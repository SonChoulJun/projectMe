<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | General Form Elements</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">

  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
   <link rel="stylesheet" href="folder_input.css">
    
    <style type="text/css">
    
		    .button {
		  font-size: 1em;
		  padding: 10px;
		  color: #fff;
		  border: 2px solid #06D85F;
		  border-radius: 20px/50px;
		  text-decoration: none;
		  cursor: pointer;
		  transition: all 0.3s ease-out;
		}
		.button:hover {
		  background: #06D85F;
		}
		
		.popup h2 {
		  margin-top: 0;
		  color: #333;
		  font-family: Tahoma, Arial, sans-serif;
		}
		.popup .close {
		  position: absolute;
		  top: 20px;
		  right: 30px;
		  transition: all 0.2s;
		  font-size: 30px;
		  font-weight: bold;
		  text-decoration: none;
		  color: #333;
		}
		.popup .close:hover {
		  color: #06D85F;
		}
		.popup .content {
		  max-height: 30%;
		  overflow: auto;
		}
		
		/*Let's make it appear when the page loads*/
		.overlay:target:before {
		    display: none;
		}
		.overlay:before {
		  content:"";
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  display: block;
		  background: rgba(0, 0, 0, 0.6);
		  position: fixed;
		  z-index: 9;
		}
		
		
		.overlay{
		  display: none;
		}
		
		
		.overlay .popup {
		  background: #fff;
		  border-radius: 5px;
		  width: 30%;
		  position: fixed;
		  top: 0;
		  left: 35%;
		  padding: 25px;
		  margin: 70px auto;
		  z-index: 10;
		  -webkit-transition: all 0.6s ease-in-out;
		  -moz-transition: all 0.6s ease-in-out;
		  transition: all 0.6s ease-in-out;
		}
		.overlay:target .popup {
		    top: -100%;
		    left: -100%;
		}
		
		@media screen and (max-width: 768px){
		
		  .overlay .popup{
		    width: 70%;
		    left: 15%;
		  }
		}
    </style>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<a id="abc">123123123</a>
<div id="popup1" class="overlay">
  <div class="popup">
    <h2>PhotoBorad input</h2>
    <a class="close">&times;</a>
    <div class="box box-warning">
      <div class="box-header with-border">
        <h3 class="box-title">pomnwq@naver.com</h3>
      </div>
            <!-- /.box-header -->
	   <div class="box-body">
	     <form role="form">
	                <!-- text input -->
	       <div class="form-group">
	          <label>Title</label>
	          <input type="text" class="form-control" placeholder="Enter ...">
	       </div>
	
	      <!-- textarea -->
	      <div class="form-group">
	         <label>Comment</label>
	         <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
	      </div>
	      <button type="button" class="btn btn-block btn-primary btn-flat">summit</button>
	               
	    </div>
    </div>
    <!--box box-warning-->
  </div>
</div>



  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>


<script type="text/javascript">
function pageLoad(){
	   $(".overlay").css("display","block");
	 }
	 
	 $(function() {
	   $("#abc").on("click",function(){
	      pageLoad();
	   });
	   
	   $(".close").on("click",function(){
	     $(".overlay").css("display","none");
	    });
	  }); 
</script>
</body>
</html>
