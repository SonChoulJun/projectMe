<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head> 
<title>구글지도</title> 


<script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyAtigIrLnYLdIioQQT2bn9jZCiXk52JAuw"></script>

 <script> 
  function initialize() { 
  var myLatlng = new google.maps.LatLng(37.51619821, 127.1041016); // y, x좌표값
  var mapOptions = { 
        zoom: 15, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  var marker = new google.maps.Marker({ 
            position: myLatlng, 
            map: map, 
            title: "회사이름" 
  }); 
  var infowindow = new google.maps.InfoWindow( 
          { 
            content: "<h1>회사이름</h1>", 
            maxWidth: 300 
          } 
  ); 

  google.maps.event.addListener(marker, 'click', function() { 
  infowindow.open(map, marker); 
  }); 
  } 
 </script> 

</head> 

<body onload="initialize()"> 

지도를 출력할 영역에 아래 소스 삽입!
<div id="map_canvas" style="width:600px; height:400px;"></div> 

</body> 
</html> 