
  var socket = io.connect('http://localhost:3000/');
  var userNo = $("#myUserNo").attr("name");
  socket.emit('new', userNo);
  

  socket.on('server message', function(msg){
	    if(($("#mgAlramcount").text()=='')){
	      $('#mgAlram').append('<span id="mgAlramcount" class="label label-success">1</span>');
	    }else{    
	      var aaa =Number($("#mgAlramcount").text());
	      aaa = aaa+1;
	      $("#mgAlramcount").text(aaa);
	    }
	  });