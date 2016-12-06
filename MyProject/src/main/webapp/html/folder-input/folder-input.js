
 function pageLoad(){
	 $(".overlay").css("display","block");
 }
 
 $(function() {
	 $("#folder_input").on("click",function(){
		  pageLoad();
	 });
	 
	 $(".close").on("click",function(){
		 $(".overlay").css("display","none");
		});
  }); 
