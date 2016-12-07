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