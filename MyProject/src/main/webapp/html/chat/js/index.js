
  
  var chat = {
    messageToSend: '',
    messageResponses: [
      'Why did the web developer leave the restaurant? Because of the table layout.',
      'How do you comfort a JavaScript bug? You console it.',
      'An SQL query enters a bar, approaches two tables and asks: "May I join you?"',
      'What is the most used language in programming? Profanity.',
      'What is the object-oriented way to become wealthy? Inheritance.',
      'An SEO expert walks into a bar, bars, pub, tavern, public house, Irish pub, drinks, beer, alcohol'
    ],
    init: function() {
      this.cacheDOM();
      this.bindEvents();
      this.render();
    },
    cacheDOM: function() {
      this.$chatHistory = $('.chat-history');
      this.$button = $('button');
      this.$textarea = $('#message-to-send');
      this.$chatHistoryList =  this.$chatHistory.find('ul');
      this.$userId =$('#userNo');
    },
    bindEvents: function() {
      this.$button.on('click', this.addMessage.bind(this));
      this.$textarea.on('keyup', this.addMessageEnter.bind(this));
    },
    send:function(msg){
        var template = Handlebars.compile( $("#message-template").html());
        var id=$("#userNo").attr("name");
        var youId=$("#sendUserNo").attr("name");
        var context = { 
          messageOutput:msg.msg,
          time: msg.date
        };
        
        this.$chatHistoryList.append(template(context));
        this.scrollToBottom();
    },
    render: function() {
      this.scrollToBottom();
      if (this.messageToSend.trim() !== '') {
          var template = Handlebars.compile( $("#message-template").html());
          var id=$("#userNo").attr("name");
          var youId=$("#sendUserNo").attr("name");
          socket.emit('client message', {my:id,to:youId,msg:this.messageToSend});
          var context = { 
            messageOutput: this.messageToSend,
            time: this.getCurrentTime()
          };
          
          this.$chatHistoryList.append(template(context));
          this.scrollToBottom();
          this.$textarea.val('');
        
        
        var obj = new Object(); // JSON형식으로 변환 할 오브젝트
        var a;
        var b;
        if(id>youId){
        	a=youId;
        	b=id;
        }else{
        	a=id;
        	b=youId;
        }
        obj.roomNo =a+','+b;
        obj.userNo =id;
        obj.userNo2 =youId;
        obj.msg=this.messageToSend;
         var json_data = JSON.stringify(obj)
         $.ajax( 
             {
               url : "/user/insertMsg",
                method :"POST",
                data :json_data,
               dataType : "json" ,
               headers : {
                 "Accept" : "application/json",
                 "Content-Type" : "application/json"
               },
               success : function(JSONData , status) {
   
                 
               }
           });

        
      }
      
    },
    response: function(msg) {
        var templateResponse = Handlebars.compile( $("#message-response-template").html());
        var contextResponse = {
        		name : $("#sendUserName").attr("name"),
                response: msg.msg,
                time: this.getCurrentTime()
              };
              

            	this.$chatHistoryList.append(templateResponse(contextResponse));
            	this.scrollToBottom();
    },
    response2: function(msg) {
        var templateResponse = Handlebars.compile( $("#message-response-template").html());
        var contextResponse = {
        		name : $("#sendUserName").attr("name"),
                response: msg,
                time: msg.date
              };
              

            	this.$chatHistoryList.append(templateResponse(contextResponse));
            	this.scrollToBottom();
    },
    
    
    
    
    addMessage: function() {
      this.messageToSend = this.$textarea.val();
      this.render();         
    },
    addMessageEnter: function(event) {
        // enter was pressed
        if (event.keyCode === 13) {
          this.addMessage();
        }
    },
    scrollToBottom: function() {
       this.$chatHistory.scrollTop(this.$chatHistory[0].scrollHeight);
    },
    getCurrentTime: function() {
      return new Date().toLocaleTimeString().
              replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
    },
    getRandomItem: function(arr) {
      return arr[Math.floor(Math.random()*arr.length)];
    }
    
  };
  
  chat.init();
  
  var searchFilter = {
    options: { valueNames: ['name'] },
    init: function() {
      var userList = new List('people-list', this.options);
      var noItems = $('<li id="no-items-found">No items found</li>');
      
      userList.on('updated', function(list) {
        if (list.matchingItems.length === 0) {
          $(list.list).append(noItems);
        } else {
          noItems.detach();
        }
      });
    }
  };
  
  searchFilter.init();
  socket.on('server message', function(msg){
	  chat.response2(msg);
    });
