<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
 
</head> 
<body>
  <div id="map" style="width: 1000; height: 1000px;"></div>

  <script type="text/javascript">
  var map;
  var locations;
  var templocation= {lat: null, lng: null};
  var tempIndex;
  var flightPath;
  function initMap() { 
	            locations= [
                   {lat: 37.799027, lng: 128.912813},   // 강원도 해수욕제
                   {lat: 37.7966576, lng: 127.6381803}, // 번지점프
                   {lat: 37.4586074, lng: 128.063184},  // 횡성갈비
                   {lat: 37.510944, lng: 127.0959589},  // 롯데월드                   
                 ];  
                 map = new google.maps.Map(document.getElementById('map'), {
                   zoom: 9, 
                   center: new google.maps.LatLng(37.111825, 127.973474),
                   mapTypeId: google.maps.MapTypeId.ROADMAP
                 });
                
                 flightPathMaker();
                 markerMaker();
                 //flightPath.setMap(map); 
                      
                 var infowindow = new google.maps.InfoWindow();

                                
                 
  }//initMap end
 
  
  function flightPathMaker(){       // 선그리기
      
      var lineSymbol = {
              path: google.maps.SymbolPath.CIRCLE
        };
      flightPath = new google.maps.Polyline({
          path: locations,
          geodesic: true,//거리는 기본적으로 미터 단위로 계산 or 픽셀단위
          strokeColor: '#2E2EFE',
          strokeOpacity: 0.8, //불투명도 1.0(불투명)~0.0(투명)
          strokeWeight: 3, // 두께
          scale: 2,
          icons: [{
              icon: lineSymbol,
              offset: '100%'
            }],
            map: map
        
    });// flight end   
   
    animateCircle(flightPath);
  }
  
  function removeLine() {
      flightPath.setMap(null);
     // flightPathMaker();
     
  }
  
  function markerMaker(){       //기존 사진마커 그리기
      var marker, i;
      /*  var image = {
               url: i+'.png',
               //size: new google.maps.Size(100, 100),
               origin: new google.maps.Point(0, 0),
               anchor: new google.maps.Point(0, 32),
               scaledSize: new google.maps.Size(50, 50)
       } */
            
       for (i = 0; i < locations.length; i++) {  
         marker = new google.maps.Marker({
           position: locations[i],
           map: map,
           animation: google.maps.Animation.DROP,
           icon: image= {
                   url: '/html/'+i+'.png',
                   //size: new google.maps.Size(100, 100),
                   origin: new google.maps.Point(0, 0),
                   anchor: new google.maps.Point(0, 32),
                   scaledSize: new google.maps.Size(50, 50),
                   
           },
           draggable: true
         });// marker end
         
         google.maps.event.addListener(marker, 'dragstart', function(event) {
             //window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
             removeLine();
             templocation = {lat: this.getPosition().lat(), lng: this.getPosition().lng()};
             for(var i in locations) {
                 //alert(locations[i].lat);
                 //alert(templocation.lat);
                 //alert(locations[i].lat==templocation.lat);
                         
                   if(locations[i].lat==templocation.lat && locations[i].lng==templocation.lng)
                   {
                       tempIndex=i;                       
                       alert(i);
                       alert(locations[i].lat);
                       break;
                   }
               }
             
             
              
           });
         
         google.maps.event.addListener(marker, 'dragend', function(event) {
             //window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
              //alert(this.getPosition());
              //alert(locations.length);           
              locations[tempIndex] = {lat: this.getPosition().lat(), lng: this.getPosition().lng()};
              //alert(locations.length);
              //alert(locations);
              //alert(locations[tempIndex].lat);             
              //markerMaker();
              flightPathMaker();
             
              
           });
         

         google.maps.event.addListener(marker, 'click', (function(marker, i) {
           return function() {
             //infowindow.setContent(locations[i][1]);
             //infowindow.open(map, marker);
             //marker.map.setZoom(13); 
             window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
             alert(this.getPosition()); 
           }
           
         })(marker, i));
       } 
      
       google.maps.event.addListener(map, 'click', function(event) { 
              removeLine();
              placeMarker(event.latLng);              
              flightPathMaker();
              
            });
      
       
  } 
  
  function placeMarker(location) {  //기존 마커읽어오기가 아니라 새로운 마커 추가
	      newmarker = new google.maps.Marker({
          position: location, 
          map: map,
          animation: google.maps.Animation.DROP,
          icon: image= {
                  url: '/html/4.png',
                  //size: new google.maps.Size(100, 100),
                  origin: new google.maps.Point(0, 0),
                  anchor: new google.maps.Point(0, 32),
                  scaledSize: new google.maps.Size(50, 50),
                  
          },
          draggable: true
          
      });
      //alert(locations.length);
      //alert(locations[locations.length].lat);
      locations[locations.length] = {lat: newmarker.getPosition().lat(), lng: newmarker.getPosition().lng()};
      map.setCenter(location);
            
      
      google.maps.event.addListener(newmarker, 'click', function(event) {
          //window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
         
          alert(this.getPosition());
          window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
          
        });
      
      google.maps.event.addListener(newmarker, 'dragstart', function(event) {
          //window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
          removeLine();
          templocation = {lat: this.getPosition().lat(), lng: this.getPosition().lng()};
          for(var i in locations) {
              //alert(locations[i].lat);
              //alert(templocation.lat);
              //alert(locations[i].lat==templocation.lat);
                      
                if(locations[i].lat==templocation.lat && locations[i].lng==templocation.lng)
                {
                    tempIndex=i;
                    //alert(i);
                    break;
                }
            }
          
          
           
        });
      
      google.maps.event.addListener(newmarker, 'dragend', function(event) {
          //window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
           //alert(this.getPosition());
           //alert(locations.length);           
           locations[tempIndex] = {lat: this.getPosition().lat(), lng: this.getPosition().lng()};
           //alert(locations.length);
           //alert(locations);
           flightPathMaker();
          
           
        });
     // locations = [{new google.maps.LatLng(location)}];
     //alert(location);
     
      
    }
  
  function animateCircle(line) {
        var count = 0;
        window.setInterval(function() {
          count = (count + 1) % 200;

          var icons = line.get('icons');
          icons[0].offset = (count / 2) + '%';
          line.set('icons', icons);
      }, 20);
    }
  
  function averageLat(array) {
	  var sum = 0.0;

	  for (var i = 0; i < array.length; i++)
	    sum += array[i].lat;

	  return sum / array.length;
	}
  
  function averageLng(array) {
      var sum = 0.0;

      for (var i = 0; i < array.length; i++)
        sum += array[i].lng;

      return sum / array.length;
    }
   </script>
   <script src="http://maps.google.com/maps/api/js?key=AIzaSyAtigIrLnYLdIioQQT2bn9jZCiXk52JAuw&signed_in=true&callback=initMap" 
          type="text/javascript"></script>
</body>
</html>