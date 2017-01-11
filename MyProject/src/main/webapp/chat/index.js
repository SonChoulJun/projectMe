var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var socket_ids = []

app.get('/', function(req, res){
  res.sendFile(__dirname + '/abcd.html');
});

io.on('connection', function(socket){
  socket.on('new', function(id){
   console.log(id.my+','+id.to);
   if(socket_ids[id]!=''){
	   console.log(socket.id+"생성");
	   socket_ids[id.my+','+id.to] = socket.id;
   }

  });
  
  
  socket.on('delete', function(id){
	   console.log(id.my+','+id.to);
	   delete socket_ids[id.my+','+id.to]
	   console.log(socket_ids[id.my+','+id.to]);
 });
  socket.on('client message', function(msg){
   console.log(msg.my+','+msg.to);
   socket_id = socket_ids[msg.to+','+msg.my];
   console.log(socket_id);
	io.sockets.in(socket_id).emit('server message',msg.msg);
  });
  
  socket.on('pushMessage', function(msg){
	   console.log('pushMessage: ' + msg.to);
	   socket_id = socket_ids[msg.to]; 
		io.sockets.in(socket_id).emit('server message',msg.msg);
	  });
});

http.listen(4000, function(){
  console.log('listening on *:4000');
});