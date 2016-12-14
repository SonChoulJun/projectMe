<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
      html, body { height: 100%; margin: 0; padding: 0; }
      #map { height: 50%;
                width: 50%;  }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script type="text/javascript">

    //지도를불러와.
    function initMap() {
    	
          var map = new google.maps.Map(document.getElementById('map'), {
            zoom:7,
            center: {lat:37.5545168, lng: 126.9706483},
            mapTypeId: google.maps.MapTypeId.ROADMAP
          });
          
          var flightPlanCoordinates = [
                                       {lat: 37.5340278, lng: 126.90199010000003},
                                       {lat: 37.5061273, lng: 127.08429449999994},
                                       {lat: 37.5400456, lng: 126.99210170000003},
                                       {lat: 37.55998, lng: 126.98582959999999}
                                     ];
          
          var colors = [
                          "#FF0000", 
                          "#00FF00", 
                          "#0000FF", 
                          "#FFFFFF", 
                          "#000000", 
                          "#FFFF00", 
                          "#00FFFF", 
                          "#FF00FF"
                      ];
          
         /*  var image = {
                    url: '/html/images/cheol.PNG',
                    // This marker is 20 pixels wide by 32 pixels high. 
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(30  , 30)
                    
            } */
          
         /*  var lineSymbol = {
                    path: google.maps.SymbolPath.CIRCLE,
                    scale: 8,
                    strokeColor: '#393'
                  }; */
         
          for(var i=0;i<flightPlanCoordinates.length;i++){
              var marker = new google.maps.Marker({
                    position: flightPlanCoordinates[i] ,
                    map: map,
                    icon: image={
                    		url: '/html/images/cheol.PNG',
                            // This marker is 20 pixels wide by 32 pixels high. 
                            size: new google.maps.Size(71, 71),
                            origin: new google.maps.Point(0, 0),
                            anchor: new google.maps.Point(17, 34),
                            scaledSize: new google.maps.Size(30  , 30)
                    },
                    title: 'Hello World!'
                  });
          } 
          
        for(var j=0;j<flightPlanCoordinates.length-1;j++){  
          var flightPath = new google.maps.Polyline({
            path: [flightPlanCoordinates[j],flightPlanCoordinates[j+1]],
            geodesic: true,
            strokeColor: colors[j],
            strokeOpacity: 1.0,
            strokeWeight: 2
          });
          flightPath.setMap(map);
        }

          
        }

    </script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAtigIrLnYLdIioQQT2bn9jZCiXk52JAuw&signed_in=true&callback=initMap">
    </script>
  </body>
</html>