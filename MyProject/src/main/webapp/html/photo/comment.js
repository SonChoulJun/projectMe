    $(function(){
    	$(document).on("click","#removebtn",function(){
            alert( "제거해줘");
            var name_by_id = $(this).attr('name');
            var aaa =$(this);
            alert(name_by_id);
            
           $.ajax({
        	   url: "/mapBoard/removeComment?commentNo="+name_by_id,
        	   method:"GET",
        	   headers : {
                   "Accept" : "application/json",
                   "Content-Type" : "application/json"
                },
               success : function(JSONData , status) {
                    
            	    aaa.parent().parent().parent().parent().remove();
                        
                 
                 }
        	   
           })

            
    });
 });