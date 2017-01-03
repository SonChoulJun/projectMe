/* Work in progress - lots of functionality left to add */
angular.module('contactsApp', [])
	.directive('customCheckbox', function() {
		return {
			restrict: 'E',
			require: '?ngModel',
			template: '<label class="btn-add">' + '<input type="checkbox" class="hidden" ng-model="ngModel" name="{{name}}"/>' + '<i class="fa" ng-class="ngModel ? \'fa-plus\' : \'fa-user-plus\'"></i>' + ' {{text}}</label>',
			scope: {
				ngModel: '=',
				name: '@',
				text: '@',
			}
		}
	})
	.controller('athletesController', function($scope) {
		
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
		
		athletesList.addAthlete = function(a,b) {					
			athletesList.athletes.push({
				name: a,
				hometown: b,
				image: 'http://dallasposttrib.com/wordpress/wp-content/uploads/2015/01/Dallas-Mavericks-Logo.gif',
				position: athletesList.athletePosition
			});
			athletesList.athleteName = '';
			athletesList.athleteHometown = '';
			athletesList.athletePosition = '';
			$scope.formShow = false;
		};
		
		athletesList.clearAthlete = function() {	
			alert("들왓냐");
			athletesList.athletes = [];				
			athletesList.athleteName = '';
			athletesList.athleteHometown = '';
			athletesList.athletePosition = '';
			$scope.formShow = false;
			
		};
		
		 $("#FollowingCount").on("click",function() {
	          var targetUser= $("#targetUser").attr("name");
	          alert(targetUser);
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
	                	for(var i=0 ; i<followingList.length ;i++){
	                	athletesList.addAthlete(followingList[i].userName,'123');	                
	                	}
	                    /*  for(var i=0 ; i<followingList.length ;i++){
	                    athletesList.addAthlete(followingList[i].userName,'123');
	                    }  */
	                    $('#FollowingModal').modal();
	                    $scope.$apply();
	                   
	                   
	                }
	            });
	            
	          
	      }); 
		
	});