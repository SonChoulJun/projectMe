<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

    .profilephoto{
        background-size: cover;

    }

    .profilephoto img{
        
        width:100%;
        height:100%;
        float: left;
    }

</style>
<link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<title>Insert title here</title>
</head>
<body>
        <div class="profilephoto" style="position: absolute ; width:20%; height: 35%; margin-top:17%; margin-left: 17%; background-image:url('images/profileimage.JPG') ;  background-color:rgba(192, 200, 88, 0.6);  " >
              <img src="images/pic07.jpg" ; alt=""/>
                </div>
        <div class="rectang" style="    padding-left: 40%; padding-top: 20%;  background-color: rgba(205, 211, 88, 0.6); " >
            <div class="tab-pane" id="settings">
                
                <form class="form-horizontal">
                
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label" style="width:10%;">Name</label>
                    <div class="col-sm-10" style="width: 50%">
                      <input type="email" class="form-control" id="inputName" placeholder="Name">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label" style="width:10%;">Email(id)</label>
                    <div class="col-sm-10" style="width: 50%">
                      <input type="email" class="form-control" id="inputEmail" placeholder="Email(id)">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label" style="width:10%;">Password</label>
                    <div class="col-sm-10" style="width: 50%">
                      <input type="text" class="form-control" id="inputName" placeholder="Password">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label" style="width:10%;">Phone</label>
                    <div class="col-sm-10" style="width: 50%">
                      <textarea class="form-control" id="inputExperience" placeholder="Phone"></textarea>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label" style="width:10%;">Join Date</label>
                    <div class="col-sm-10" style="width: 50%">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Join Date">
                    </div>
                  </div>
                  
                  <div class="form-group" style="width:30%;">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                        </label>
                      </div>
                    </div>
                  </div>
                  
                  <div class="form-group" >
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">Submit</button>
                      <button type="submit" class="btn btn-danger"> 수 정</button>
                    </div>
                  </div>
                  
                </form>
              </div>
              </div>

</body>
</html>