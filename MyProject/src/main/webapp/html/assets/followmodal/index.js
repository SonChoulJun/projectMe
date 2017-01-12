/* Work in progress - lots of functionality left to add */
angular.module('contactsApp', [])

.controller('athletesController', function($scope, $location) {
		
		var athletesList = this,
			formShow = false;
		$scope.close = function() {
			$scope.formShow = false;
		};
		$scope.clear = function() {
			$scope.athlete.name = '';
		};
		$scope.edit = function() {
			$scope.formShow = true;
		};
		// list athletes
		athletesList.athletes = [];
		
		// add athletes
		athletesList.addAthlete = function() {			
			athletesList.athletes.push({
				name: athletesList.athleteName,
				hometown: athletesList.athleteHometown,
				image: 'http://dallasposttrib.com/wordpress/wp-content/uploads/2015/01/Dallas-Mavericks-Logo.gif',
				position: athletesList.athletePosition
			});
			athletesList.athleteName = '';
			athletesList.athleteHometown = '';
			athletesList.athletePosition = '';
			$scope.formShow = false;
		};
		
		athletesList.addAthlete = function(a,b,c,d) {					
			athletesList.athletes.push({
				name: a,
				hometown: b,
				userId:d,
				image: '/html/dist/img/profile/'+c+'.JPG',
				position: athletesList.athletePosition
			});
			athletesList.athleteName = '';
			athletesList.athleteHometown = '';
			athletesList.athletePosition = '';
			$scope.formShow = false;
		};
		
		athletesList.clearAthlete = function() {	
			//alert("들왓냐");			
			athletesList.athletes = [];				
			athletesList.athleteName = '';
			athletesList.athleteHometown = '';
			athletesList.athletePosition = '';
			$scope.formShow = false;
			
		};
		
		   //[버튼 클릭 리스너]
        $scope.clickListener = function (userId) {     
        	/*$location.url('/user/'+userId);	    */
        	/*$location.url('/profile/subProfile?userId=zxc@1.com');*/
        	var url ='/profile/subProfile?userId='+userId;
        	$(location).attr('href',url);
        	
        };
        var i;  
       
        
        $scope.moreList = function () {     
        	/*$location.url('/user/'+userId);	    */
        	/*$location.url('/profile/subProfile?userId=zxc@1.com');*/
        	     
            var targetUser= $("#targetUser").attr("name");
	          //alert(targetUser);
	          //Debug..        
	          $.ajax( 
	              {
	                url : "/user/getFollowing/"+targetUser,
	                 method :"GET",
	                 dataType: "json",
	                headers : {
	                  "Accept" : "application/json",
	                  "Content-Type" : "application/json"
	                },
	                success : function(followingList){	                	
	                	athletesList.clearAthlete();	                	
	                	//alert("i"+i);
	                	//alert(i+2>followingList.length);
	                	if(i+4>followingList.length){
	                		a=followingList.length;
	                	}else{a=i+4;}
	                	
	                	                	
	                	for(var j=0; j<a ;j++){
	                		//alert("a:"+a);
	                		//alert(j);
	                     	athletesList.addAthlete(followingList[j].userName,'123',followingList[j].userNo,followingList[j].userId);
	                     	}
	                	i=j;
	                    //$('#FollowingModal').modal();
	                    $scope.$apply();             
	                   
	                   
	                }
	            });
        	
	      }	                
        
        
		 $("#FollowingCount").on("click",function() {
	          var targetUser= $("#targetUser").attr("name");
	          //alert(targetUser);
	          //Debug..        
	          $.ajax( 
	              {
	                url : "/user/getFollowing/"+targetUser,
	                 method :"GET",
	                 dataType: "json",
	                headers : {
	                  "Accept" : "application/json",
	                  "Content-Type" : "application/json"
	                },
	                success : function(followingList){
	                	athletesList.clearAthlete();
	                	if(followingList.length<4){
	                		for(i=0 ; i<followingList.length ;i++){
	    	                	athletesList.addAthlete(followingList[i].userName,'123',followingList[i].userNo,followingList[i].userId);
	    	                	}
	    	                    /*  for(var i=0 ; i<followingList.length ;i++){
	    	                    athletesList.addAthlete(followingList[i].userName,'123');
	    	                    }  */
	    	                    $('#FollowingModal').modal();
	    	                    $scope.$apply();	
	                	}else{
	                	for(i=0 ; i<4 ;i++){
	                	athletesList.addAthlete(followingList[i].userName,'123',followingList[i].userNo,followingList[i].userId);
	                	}
	                    /*  for(var i=0 ; i<followingList.length ;i++){
	                    athletesList.addAthlete(followingList[i].userName,'123');
	                    }  */
	                    $('#FollowingModal').modal();
	                    $scope.$apply();
	                	}
	                   
	                }
	            });
	            
	          
	      });	
})

/*.controller('followerController', function($scope, $location) {
		
		var followerList = this,
			formShow = false;
		$scope.close = function() {
			$scope.formShow = false;
		};
		$scope.clear = function() {
			$scope.follower.name = '';
		};
		$scope.edit = function() {
			$scope.formShow = true;
		};
		// list athletes
		followerList.followers = [];		
		
		followerList.addfollower = function(a,b,c,d) {					
			alert("들어오나요요");
			followerList.followers.push({
				name: a,
				hometown: b,
				userId:d,
				image: '/html/dist/img/profile/'+c+'.JPG',
				position: followerList.followerPosition
			});
			followerList.followerName = '';
			followerList.followerHometown = '';
			followerList.followerPosition = '';
			$scope.formShow = false;
		};
		
		followerList.clearfollower = function() {	
			//alert("들왓냐");			
			followerList.followers = [];				
			followerList.followerName = '';
			followerList.followerHometown = '';
			followerList.followerPosition = '';
			$scope.formShow = false;
			
		};
		
		   //[버튼 클릭 리스너]
        $scope.clickListener2 = function (userId) {     
        	$location.url('/user/'+userId);	    
        	$location.url('/profile/subProfile?userId=zxc@1.com');
        	var url ='/profile/subProfile?userId='+userId;
        	$(location).attr('href',url);
        	
        };
        var i;  
       
        
        $scope.moreList2 = function () {     
        	$location.url('/user/'+userId);	    
        	$location.url('/profile/subProfile?userId=zxc@1.com');
        	     
            var targetUser= $("#targetUser").attr("name");
	          //alert(targetUser);
	          //Debug..        
	          $.ajax( 
	              {
	                url : "/user/getFollower/"+targetUser,
	                 method :"GET",
	                 dataType: "json",
	                headers : {
	                  "Accept" : "application/json",
	                  "Content-Type" : "application/json"
	                },
	                success : function(followerList){	                	
	                	followerList.clearfollower();	                	
	                	//alert("i"+i);
	                	//alert(i+2>followingList.length);
	                	if(i+4>followerList.length){
	                		a=followerList.length;
	                	}else{a=i+4;}
	                	
	                	                	
	                	for(var j=0; j<a ;j++){
	                		//alert("a:"+a);
	                		//alert(j);
	                		followerList.addfollower(followerList[j].userName,'123',followerList[j].userNo,followerList[j].userId);
	                     	}
	                	i=j;
	                    //$('#FollowingModal').modal();
	                    $scope.$apply();             
	                   
	                   
	                }
	            });
        	
	      }	                
        
        
		 $("#followerCount").on("click",function() {
			 alert("들오셧");
	          var targetUser= $("#targetUser").attr("name");
	          //alert(targetUser);
	          //Debug..        
	          $.ajax( 
	              {
	                url : "/user/getFollower/"+targetUser,
	                 method :"GET",
	                 dataType: "json",
	                headers : {
	                  "Accept" : "application/json",
	                  "Content-Type" : "application/json"
	                },
	                success : function(followerList){
	                	alert("들오셧");
	                	followerList.clearfollower();
	                	for(i=0 ; i<4 ;i++){
	                		followerList.addfollower(followerList[i].userName,'123',followerList[i].userNo,followerList[i].userId);
	                	}	                      
	                    $('#followerModal').modal();
	                    $scope.$apply();
	                   
	                   
	                }
	            });
	            
	          
	      });		
	});  
*/
