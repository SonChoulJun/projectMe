<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta charset="UTF-8">
  <title>Chat Widget</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="/html/chat/css/style.css">

  
</head>

<body>
    <div class="container clearfix">
    <div class="people-list" id="people-list">
      <div class="search">
        <input type="text" placeholder="search" />
        <i class="fa fa-search"></i>
      </div>
      <ul class="list">
      
      <c:forEach var="userList" items="${userList}">
        <li id="mgUser" class="clearfix">
          <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_01.jpg" alt="avatar" />
          <div class="about">
            <div id="toUserNo" name="${userList.userNo}"></div>
            <div id="toUserId" name="${userList.userId}"></div>
            <div id="toUserName" class="name">${userList.userName}</div>
            <div class="status">
            <c:if test="${userList.activity}">
              <i class="fa fa-circle online"></i> online
            </c:if>  
            <c:if test="${!userList.activity}">
               <i class="fa fa-circle offline"></i> offline
            </c:if>  
            </div>
          </div>
        </li>
      </c:forEach>
        
      </ul>
    </div>
    
    <div class="chat">
      <div class="chat-header clearfix">
        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_01_green.jpg" alt="avatar" />
        
        <div class="chat-about">
          <div id="mgMainUserNo" class="chat-with">Chat with Vincent Porter</div>
          <div id="mgMainId" class="chat-num-messages">already 1 902 messages</div>
        </div>
        <i class="fa fa-star"></i>
      </div> <!-- end chat-header -->
      
      <div class="chat-history">
        <ul> 
<!--           <li>
            <div class="message-data">
              <span class="message-data-name"><i class="fa fa-circle online"></i> Vincent</span>
              <span class="message-data-time">10:31 AM, Today</span>
            </div>
            <i class="fa fa-circle online"></i>
            <i class="fa fa-circle online" style="color: #AED2A6"></i>
            <i class="fa fa-circle online" style="color:#DAE9DA"></i>
          </li> -->
          
        </ul>
        
      </div> <!-- end chat-history -->
      
      <div class="chat-message clearfix">
        <textarea name="message-to-send" id="message-to-send" placeholder ="Type your message" rows="3"></textarea>
                
        <i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp;
        <i class="fa fa-file-image-o"></i>
        
        <button>Send</button>

      </div> <!-- end chat-message -->
      
    </div> <!-- end chat -->
    
  </div> <!-- end container -->
  <div id="userNo" name="${myUser.userNo}"></div>
  <div id="sendUserNo" name="${myUser.userNo}"></div>
  <div id="sendUserName" name=""></div>

<script id="message-template" type="text/x-handlebars-template">
  <li class="clearfix">
    <div class="message-data align-right">
      <span class="message-data-time" >{{time}}, Today</span> &nbsp; &nbsp;
      <span class="message-data-name" >${myUser.userName}</span> <i class="fa fa-circle me"></i>
    </div>
    <div class="message other-message float-right">
      {{messageOutput}}
    </div>
  </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
  <li>
    <div class="message-data">
      <span class="message-data-name"><i class="fa fa-circle online"></i> {{name}}</span>
      <span class="message-data-time">{{time}}, Today</span>
    </div>
    <div class="message my-message">
      {{response}}
    </div>
  </li>
</script>

<script src="/node_modules/socket.io-client/dist/socket.io.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script type="text/javascript">

	  var socket = io.connect('http://192.168.0.20:4000/');
	  socket.emit('new', {my:'${myUser.userNo}',to:$('#toUserNo').attr("name")});
	    $("#sendUserNo").attr("name",$('#toUserNo').attr("name"));
	    $("#sendUserName").attr("name",$('#toUserName').text());
	    $("#mgMainUserNo").text($('#toUserName').text());
	    $("#mgMainId").text($('#toUserId').attr("name"));
  </script>

<script src='http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js'></script>

    <script src="/html/chat/js/index.js"></script>
    
    <script type="text/javascript">
     $(document).on("click","#mgUser",function(){
    	 var upthis =this;
    	 $('.chat-history').find('li').remove();
       socket.emit('delete', {my:'${myUser.userNo}',to:$('#sendUserNo').attr("name")});
    	 $("#sendUserNo").attr("name",$(this).find('#toUserNo').attr("name"));
    	 $("#sendUserName").attr("name",$(this).find('#toUserName').text());
    	 $("#mgMainUserNo").text($(this).find('.name').text());
    	 $("#mgMainId").text($(this).find('#toUserId').attr("name"));
    	 socket.emit('new', {my:'${myUser.userNo}',to:$(this).find('#toUserNo').attr("name")});
         var id=$("#userNo").attr("name");
         var youId=$("#sendUserNo").attr("name");
         var a;
         var b;
         if(id>youId){
             a=youId;
             b=id;
           }else{
             a=id;
             b=youId;
           }
         var roomNo = a+','+b;
         
    	 $.ajax( 
                 {
                   url : "/user/getMsg/"+roomNo,
                    method :"POST",
                   dataType : "json" ,
                   headers : {
                     "Accept" : "application/json",
                     "Content-Type" : "application/json"
                   },
                   success : function(JSONData , status) {
                	   for (var i in JSONData.chatList) {
                		   if(JSONData.chatList[i].userNo==id){
                			   chat.send(JSONData.chatList[i]);
                		   }else{
                			   chat.response(JSONData.chatList[i]);
                		   }
                		   console.log(JSONData.chatList[i].userNo);
                		 }
                   }
               });
     });

	    	 var upThis =this;
	     socket.on('server message', function(msg){
	    	 console.log(this.chatMd);
	       });

    </script>


</body>
</html>
