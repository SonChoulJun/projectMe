
  var socket = io.connect('http://192.168.0.20:3000/');
  var userNo = $("#myUserNo").attr("name");
  socket.emit('new', userNo);
  

  socket.on('server message', function(msg){
	  alert("알람도착");
	    if(($("#mgAlramcount").text()=='')){
	      $('#mgAlram').append('<span id="mgAlramcount" class="label label-success">1</span>');
	    }else{    
	      var aaa =Number($("#mgAlramcount").text());
	      aaa = aaa+1;
	      $("#mgAlramcount").text(aaa);
	    }
	      
	      var bbb ='<li>';
          bbb+='<a href="/mapBoard/getPhotoFolder?folderNum='+msg.folderNo+'">';
        	  bbb+='    <div class="pull-left">';
        	  bbb+=' <img src="/html/dist/img/profile/'+msg.img+'" class="user-image" onerror="this.src=\'/html/dist/img/defaultImage.jpg\';" >';
        	  bbb+='</div>';
        bbb+='<h4>';
        	bbb+=msg.name;
        		bbb+='    <small><i class="fa fa-clock-o"></i>2016/01/21</small>';
        			bbb+=' </h4>';
        				bbb+='    <p>'+msg.msg+'</p>';
        					bbb+='    </a>';
        						bbb+='    </li>';
	      $("#alramMenu").prepend(bbb);
	    
	  });
  
  
  $("#mgAlram").on("click",function(){
      $.ajax({
            
            url: "/user/updateACount",
            method :"POST",
            dataType : "json" ,
            headers : {
              "Accept" : "application/json",
              "Content-Type" : "application/json"
            },
            success : function(JSONData , status) {
                $("#mgAlramcount").remove();
            }
            
      }); 
    });
  
  
  
  $("#msgBt").on("click",function(){
      $.colorbox({
        
        href :"/user/moveChat",
        width : '900px', 
        height : '1000px',
        iframe:true,
        scrolling: false 
      });
    });
  