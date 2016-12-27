<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
$(function() {
    $("#FollowerCount").on("click",function() {
        //Debug..        
        $.ajax( 
            {
              url : "/user/getFollower/${targetUser.userNo}",
               method :"GET",
              headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
              },
              success : function(followerList){
                  $('#bodyModal').html("");
                    for(var i=0 ; i<followerList.length ;i++){
                        
                         var row ='';
                         row+='<li style="border-bottom-style:solid;border-bottom-width:1px; padding-top:10px; border-bottom-color:rgb(221, 221, 221); ">';
                         row+='<a class="inner" href="/profile/subProfile?userId='+followerList[i].userId +'">';
                         row+='<div class="li-img" style="width:20%;margin:0;">';
                        row+=' <img src="/html/assets/img/uploadedPhoto/son.jpg" alt="Image Alt Text" /> </div>';
                        row+='<div class="li-text">';
                        row+='<h4 class="li-head">'+followerList[i].userName+'</h4>';
                        row+='<p class="li-sub">2016-12-21</p></div></a></li>';
                        
                         $('#bodyModal').append(row);
                         
                    }
                  $('#FollowerModal').modal();
                  
              }
          });
          ////////////////////////////////////////////////////////////////////////////////////////////
       
    });
    
  }); 
</script>