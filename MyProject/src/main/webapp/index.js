var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var socket_ids = []

app.get('/', function(req, res){
  res.sendFile(__dirname + '/html/abcd.html');
});

io.on('connection', function(socket){
  socket.on('new', function(id){
   console.log(id);
   socket_ids[id] = socket.id;

  });
  socket.on('client message', function(msg){
   console.log('message: ' + msg.to);
   socket_id = socket_ids[msg.to];

	io.sockets.in(socket_id).emit('server message',socket_id);
  });
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});