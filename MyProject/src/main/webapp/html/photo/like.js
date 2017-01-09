 $(function(){
	    	   $(document).on("click","#likeBt",function(){
	    		   var userNo=$(this).find("div").eq(0).attr("name");
	    		   var pfNo=$(this).find("div").eq(1).attr("name");
	    		   var TuserNo=$(this).find("div").eq(3).attr("name");
	    		   alert(userNo+"++++"+pfNo);
	    		   var upthis =$(this);
	    		   $.ajax({
	                   
		                   url: "/mapBoard/setLike/"+userNo+"/"+pfNo,
		                   method :"GET",
		                   dataType : "json" ,
		                   headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                   },
		                   success : function(JSONData , status) {
		                       if(JSONData.likeOk=="add"){
		                    	   socket.emit('client message', {to:TuserNo,msg:TuserNo+'님이 좋아요를 눌렀습니다.'});
		                           $("#likeCount").text(JSONData.likeCount+" likeCount");
		                           upthis.css("color","blue");
		                       }else{
		                           $("#likeCount").text(JSONData.likeCount+" likeCount");
		                           upthis.css("color","#444");
		                       }
		                   }
		                   
	    		    })
	    		    
	    		    
	    	    })
	    	    
    	  
       });
 
       
       

 
       
       