<%@page import="kr.co.bitcamp.service.domain.PhotoFolder"%>
<%
  PhotoFolder folder = (PhotoFolder)request.getAttribute("photoFolderOne");
%>
<%int z =-1;   
 double latDefault=37.56347;
 double lngDefault=126.990347; %>
<script type="text/javascript">
var folderName = new Array();
var themeNo = new Array();
var themeSize=new Array();
<%System.out.print("등어오닝??");
for(int i=0;i<folder.getPhotoTheme().size();i++){%> 

 folderName[<%=i%>]="<%=folder.getPhotoTheme().get(i).getPhotoList().get(0).getFolderName()%>";
 themeNo[<%=i%>]="<%=folder.getPhotoTheme().get(i).getThemeNo()%>";
 themeSize[<%=i%>]="<%=folder.getPhotoTheme().get(i).getPhotoList().size()%>";
 <%}%>

  
  $(function(){ //í¨ì
      
      var loc = new Locations();
      var insthis = this;
      loc.initMap(); 
      loc.markerMaker();     
      loc.flightPathMaker();  
      
  });

  var map;
   
  function Locations() {  
      var locations = [
                       <%for(int i=0;i<folder.getPhotoTheme().size();i++){
                           if(folder.getPhotoTheme().get(i).getPhotoList().get(0).getGpsB()!=null){
                          %>
                             {lat: <%=folder.getPhotoTheme().get(i).getPhotoList().get(0).getGpsB()%>, lng: <%=folder.getPhotoTheme().get(i).getPhotoList().get(0).getGpsH()%>},
                          <%}else{%>
                           
                             {lat: <%=latDefault%>, lng:<%=lngDefault%>},
                           <% 
                             lngDefault+=0.01; 
                           }
                          }
                          %>
                   ];     
      var tempIndex;
      var flightPath;
      var markers = [];
     
      this.initMap = function () { 
          map = new google.maps.Map(document.getElementById('map'), {
            zoom: 8, 
            <%
            if(folder.getPhotoTheme().get(0).getPhotoList().get(0).getGpsB()==null){
           %>
            center: new google.maps.LatLng(37.56347,126.990347),
           <%}else{%>
            center: new google.maps.LatLng(<%=folder.getPhotoTheme().get(0).getPhotoList().get(0).getGpsB()%>, <%=folder.getPhotoTheme().get(0).getPhotoList().get(0).getGpsH()%>),
           <%}%>
            mapTypeId: google.maps.MapTypeId.ROADMAP
          });
                          
          //var infowindow = new google.maps.InfoWindow();          
    }//initMap end
      
      this.setLocations = function(i,lat,lng) { locations[i] = ({ lat: lat, lng: lng });  };
      this.getLocations = function(i) { return locations[i]; };
      this.addLocations = function(lat,lng) { locations.push({ lat: lat, lng: lng });  };
      this.getLength = function() { return locations.length; };
      this.markerRemove = function(){    
              for (i = 0; i < markers.length; i++) {  
                  markers[i].setMap(null);
                  google.maps.event.clearListeners(marker, "dragstart");
                  google.maps.event.clearListeners(marker, "dragend");
                  }
              google.maps.event.clearListeners(map, "click");
              
      }
      this.markerMaker = function(){
          var objthis = this;       
                            
  
           for (i = 0; i <= locations.length; i++) {                   
                   var data = locations[i];               
                   marker = new google.maps.Marker({
                   position: locations[i],
                   map: map,
                   animation: google.maps.Animation.DROP,
                   icon: image= {
                       url: '/html/assets/img/uploadedPhoto/'+folderName[i],                    
                           //borderRadius: 50,
                           //size: new google.maps.Size(100, 100),
                           origin: new google.maps.Point(0, 0),
                           anchor: new google.maps.Point(0, 32),
                           scaledSize: new google.maps.Size(50, 50),
                   
                   },
                 });// marker insert end
                 markers.push(marker);   
                                 
             (function (marker, data , i) {
                    google.maps.event.addListener(marker, "dragstart", function (e) {
                        //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                        /* infoWindow.setContent("<div style = 'width:200px;min-height:40px'>" + "abc" + "</div>");
                        infoWindow.open(map, marker); */                                            
                        marker.setAnimation(google.maps.Animation.BOUNCE);
                        objthis.removeLine();  
                    });
                })(marker, data, i); 
             (function (marker, data, i) {
                 google.maps.event.addListener(marker, "dragend", function (e) {
                     //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                     /* infoWindow.setContent("<div style = 'width:200px;min-height:40px'>" + "abc" + "</div>");
                     infoWindow.open(map, marker); */
                     console.log(data);
                     console.log(i);
                     console.log(locations[i]);
                     //console.log(objthis.locations[i]);
                     //console.log(this.getPosition().lat());
                     objthis.setLocations(i,this.getPosition().lat(),this.getPosition().lng());
                     console.log(locations[i]);
                     objthis.markerRemove();
                     objthis.markerMaker();
                     objthis.flightPathMaker()
                     
                 });
             })(marker, data,  i);
             
             (function (marker, data, i) {
                 google.maps.event.addListener(marker, "click", function (e) {

                    if(themeSize[i]<=2){
                        $("#photoSubInputBt").fileinput('refresh', {
                            language: 'LANG',
                            uploadUrl: '/mapBoard/addSubphoto/'+themeNo[i],
                            uploadAsync: true,
                            multiple:true,
                            allowedFileExtensions : ['jpg', 'png','gif']   
                          });
                    	  $( "#photoSubUpload" ).modal();
                    	  event.preventDefault();
                    }else{
                    	$.colorbox({href:"/mapBoard/getSubPhoto/"+themeNo[i],iframe:true, width:"80%", height:"80%"});
                        // modal 에 넘겨줬던 값을 다시 부모창에 받아 들임     
                        //document.getElementById("test1").value = objectName.message; 
                    	/* $.colorbox({href:"/photo/photoAlbum.jsp"}); */
                    	  /* window.open("/photo/photoAlbum.jsp", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); */
                    }
                     
                 });
             })(marker, data,  i);
           }//for end
             (function (map) {
                 google.maps.event.addListener(map, "click", function (e) {
                     //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                     /* infoWindow.setContent("<div style = 'width:200px;min-height:40px'>" + "abc" + "</div>");
                     infoWindow.open(map, marker); */           
                  /* window.open("http://www.naver.com", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );    */
                 });
             })(map);            
      
    }//markerMaker end
      this.flightPathMaker = function(){
        var objthis2 = this;   
        /* var lineSymbol = {
                path: "M-20,0a20,20 0 1,0 40,0a20,20 0 1,0 -40,0",
                fillColor: 'yellow',
                fillOpacity: 0.8,
                scale: 1,
                strokeColor: 'gold',
                strokeWeight: 2
              }; */
         var rotation = 180;
           var lineSymbol = {
                path: "M -53.582954,-415.35856 C -67.309015,-415.84417 -79.137232,-411.40275 -86.431515,-395.45159 L -112.76807,-329.50717 C -131.95714,-324.21675 -140.31066,-310.27864 -140.75323,-298.84302 L -140.75323,-212.49705 L -115.44706,-212.49705 L -115.44706,-183.44029 C -116.67339,-155.74786 -71.290042,-154.67757 -70.275134,-183.7288 L -69.739335,-212.24976 L 94.421043,-212.24976 L 94.956841,-183.7288 C 95.971739,-154.67759 141.39631,-155.74786 140.16998,-183.44029 L 140.16998,-212.49705 L 165.43493,-212.49705 L 165.43493,-298.84302 C 164.99236,-310.27864 156.63886,-324.21677 137.44977,-329.50717 L 111.11322,-395.45159 C 103.81894,-411.40272 91.990714,-415.84414 78.264661,-415.35856 L -53.582954,-415.35856 z M -50.57424,-392.48409 C -49.426163,-392.49037 -48.215854,-392.45144 -46.988512,-392.40166 L 72.082372,-392.03072 C 82.980293,-392.28497 87.602258,-392.03039 92.236634,-381.7269 L 111.19565,-330.61998 L -86.30787,-330.86727 L -67.554927,-380.61409 C -64.630656,-390.57231 -58.610776,-392.44013 -50.57424,-392.48409 z M -92.036791,-305.02531 C -80.233147,-305.02529 -70.646071,-295.47944 -70.646071,-283.6758 C -70.646071,-271.87217 -80.233147,-262.28508 -92.036791,-262.28508 C -103.84043,-262.28508 -113.42751,-271.87216 -113.42751,-283.6758 C -113.42751,-295.47946 -103.84043,-305.02531 -92.036791,-305.02531 z M 117.91374,-305.02531 C 129.71738,-305.02533 139.26324,-295.47944 139.26324,-283.6758 C 139.26324,-271.87216 129.71738,-262.28508 117.91374,-262.28508 C 106.1101,-262.28507 96.523021,-271.87216 96.523021,-283.6758 C 96.523021,-295.47944 106.1101,-305.02531 117.91374,-305.02531 z M 103.2216,-333.14394 L 103.2216,-333.14394 z M 103.2216,-333.14394 C 103.11577,-333.93673 102.96963,-334.55679 102.80176,-335.21316 C 101.69663,-339.53416 100.2179,-342.16153 97.043938,-345.3793 C 93.958208,-348.50762 90.488134,-350.42644 86.42796,-351.28706 C 82.4419,-352.13197 45.472822,-352.13422 41.474993,-351.28706 C 33.885682,-349.67886 27.380491,-343.34759 25.371094,-335.633 C 25.286417,-335.3079 25.200722,-334.40363 25.131185,-333.2339 L 103.2216,-333.14394 z M 64.176391,-389.01277 C 58.091423,-389.00227 52.013792,-385.83757 48.882186,-379.47638 C 47.628229,-376.92924 47.532697,-376.52293 47.532697,-372.24912 C 47.532697,-368.02543 47.619523,-367.53023 48.822209,-364.99187 C 50.995125,-360.40581 54.081354,-357.67937 59.048334,-355.90531 C 60.598733,-355.35157 62.040853,-355.17797 64.86613,-355.27555 C 68.233081,-355.39187 68.925861,-355.58211 71.703539,-356.95492 C 75.281118,-358.72306 77.90719,-361.35074 79.680517,-364.96188 C 80.736152,-367.11156 80.820083,-367.68829 80.820085,-372.0392 C 80.820081,-376.56329 80.765213,-376.87662 79.470596,-379.50637 C 76.3443,-385.85678 70.261355,-389.02327 64.176391,-389.01277 z",
                fillColor: '#FF0000',
                fillOpacity: .6,
                anchor: new google.maps.Point(12,-290),
                strokeWeight: 0,
                scale: .10,
                rotation: rotation
            }; 
           /*   var lineSymbol = {
                  url: "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDIwMDEwOTA0Ly9FTiIKICJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy1TVkctMjAwMTA5MDQvRFREL3N2ZzEwLmR0ZCI+CjxzdmcgdmVyc2lvbj0iMS4wIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCiB3aWR0aD0iMzAwLjAwMDAwMHB0IiBoZWlnaHQ9IjIyNS4wMDAwMDBwdCIgdmlld0JveD0iMCAwIDMwMC4wMDAwMDAgMjI1LjAwMDAwMCIKIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaWRZTWlkIG1lZXQiPgo8bWV0YWRhdGE+CkNyZWF0ZWQgYnkgcG90cmFjZSAxLjEwLCB3cml0dGVuIGJ5IFBldGVyIFNlbGluZ2VyIDIwMDEtMjAxMQo8L21ldGFkYXRhPgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLjAwMDAwMCwyMjUuMDAwMDAwKSBzY2FsZSgwLjEwMDAwMCwtMC4xMDAwMDApIgpmaWxsPSIjMTcwYWRmIiBzdHJva2U9Im5vbmUiPgo8cGF0aCBkPSJNMjQ0MCAxOTk2IGMwIC0yOCAtNyAtNDEgLTM3IC02NSAtNDkgLTQwIC04OSAtNTEgLTE4OSAtNTEgLTgxIDAgLTgyIDAgLTE0MyAtNDUgLTUwIC0zNyAtMTExIC0xMDggLTExMSAtMTMwIDAgLTEzIDI5IC0zIDM1IDEzIDggMjQgNDIgNjEgOTQgMTAyIDQzIDMzIDQ5IDM1IDEzNCAzNyAxMDEgMiAxNDkgMTUgMTkyIDUwIDQ4IDQwIDc1IDEyMyA0MCAxMjMgLTEwIDAgLTE1IC0xMCAtMTUgLTM0eiIvPgo8cGF0aCBkPSJNMjY2MyAxOTEzIGMtNCAtMTAgLTE5IC0zNyAtMzQgLTU5IC00MSAtNjAgLTg3IC03NiAtMjQ0IC04NCAtODggLTUgLTE0MCAtMTIgLTE2MSAtMjMgLTQ0IC0yMyAtOTcgLTc1IC04OSAtODggNSAtNyAxOCAwIDM5IDIwIDUzIDUxIDk4IDY0IDQxCjcxIDExMiA1IDEzNiA5IDE2OCAyOCA0MyAyOCA5MSA4NiAxMDEgMTI1IDcgMzAgLTEwIDM5IC0yMSAxMHoiLz4KPHBhdGggZD0iTTEyMjUgMTg5NSBjLTU1IC0yOCAtMTU3IC0xNDIgLTI0MiAtMjcyIC0yNCAtMzUgLTE0MiAtMTczIC0yNDYgLTI4OCAtMTUgLTE2IC01MyAtNjYgLTg0IC0xMTAgLTMxIC00NCAtNjMgLTg0IC03MCAtODggLTExIC03IC05NSAtMTE1IC0xMzYgLTE3NyAtMjMgLTMzIC0yMSAtODIgMyAtMTEzIDMxIC00MCAxMzcgLTY3IDI1OSAtNjcgMTAwIDAgMTEwIC0zIDE4NSAtNDcgNDAgLTI1IDQyMSAtMTQ3IDUyMSAtMTY4IDQ0IC0xMCAxMDkgLTI2IDE0NSAtMzcgMjI4IC03MCAyOTIgLTg4IDMwNyAtODggMTAgMCAyNyAxMyAzNyAyNyAyMyAzMiAzNyA5NyA3MiAzNDkgNCAyOCAxMCAzMyA0MiAzOSAyMCA0IDc0IDE3IDExOCAzMCA0NSAxMyAxMTIgMjggMTUwIDM0IDE3NSAyNyAyMTMgMzkgMjYyIDg0IDI3IDI1IDI5IDcyIDQgMTA4IC0yMSAzMiAtMjE1IDIxOCAtMzAyIDI5MCAtOTUgNzkgLTEyOSAxMDMgLTE4OCAxMzQgLTY2IDM1IC0xMjUgMzEgLTIxMiAtMTIgbC02MCAtMzAgMCA5NiBjMCAxNDUgLTI5IDE4MCAtMjA1IDI0OSAtMTQ1IDU3IC0xNjQgNjIgLTI1MSA2OCAtNjAgNCAtODYgMSAtMTA5IC0xMXogbTEzMCAtMjUgYzczIC0xMiAxOTMgLTQ4IDIyMCAtNjYgMTEgLTggMjcgLTE0IDM1IC0xNCAyNCAwIDEwNyAtNTUgMTI1IC04NCAzNCAtNTIgLTEgLTg4IC0xNjUgLTE3MiAtNDEgLTIxIC04OSAtNDkgLTEwNiAtNjEgLTE3IC0xMyAtNTEgLTM0IC03NSAtNDYgLTI0IC0xMiAtNjIgLTM0IC04NCAtNDggLTY2IC00MSAtNzkgLTQ4IC0xMTAgLTYyIC0xNiAtOCAtNjUgLTM1IC0xMDggLTYxIC00MyAtMjUgLTgxIC00NiAtODMgLTQ2IC02IDAgLTE1NSAtNjkgLTE3NCAtODEgLTggLTUgLTM1IC0yMCAtNjAgLTM0IC0yNSAtMTQgLTYzIC0zNiAtODUgLTQ4IC0zNCAtMTkgLTEzNyAtOTMgLTE5NyAtMTQzIC0xNiAtMTIgLTE4IC0xMSAtMTggMTIgMCAyMyA2MyAxMTUgMTI0IDE3OSAxMCAxMSA0OSA2MSA4NiAxMTAgMzggNTAgMTE2IDE0NCAxNzUgMjEwIDU4IDY2IDEzNCAxNTggMTY4IDIwNSAzNCA0NyA3MiA5NiA4NSAxMTAKMTIgMTQgMzcgNDQgNTUgNjcgMjggMzYgNjIgNTggMTE3IDc3IDggMiAxNSA1IDE1IDUgMCAxIDI3IC00IDYwIC05eiBtNDA1IC0zMzIgbC0xIC02MyAtMTU3IC03NyBjLTg2IC00MyAtMTg2IC05MCAtMjIyIC0xMDQgLTM2IC0xNCAtOTQgLTM5IC0xMzAgLTU2IC0zNiAtMTYgLTEzMCAtNTQgLTIxMCAtODQgLTEyNyAtNDcgLTIwNSAtNzkgLTI4NyAtMTE3IC0xMyAtNiAtMjUgLTggLTI4IC01IC0zIDIgMTkgMTUgNDggMjggMjggMTIgNTkgMjggNjcgMzUgOCA2IDU2IDI5IDEwNSA1MSA1MCAyMSAxMjQgNTkgMTY1IDgzIDQxIDI0IDg5IDUwIDEwNSA1OCAzMiAxNCAzOSAxOCAxMzEgNzUgMzMgMjEgNjQgMzggNjkgMzggNCAwIDI4IDE1IDU0IDMzIDI1IDE4IDg0IDUyIDEzMSA3NiA0NyAyNCAxMDEgNTUgMTIwIDY4IDE5IDEyIDM2IDIzIDM3IDIzIDIgMCAzIC0yOCAzIC02MnogbTMxNyAtNTIgYzMyIC0xOSA3OCAtNTIgMTAzIC03MyAyNSAtMjEgNTkgLTQ5IDc1IC02MiAxNyAtMTIgODUgLTc2IDE1MSAtMTQxIDEyNQotMTIyIDE0NiAtMTU2IDExNSAtMTg0IC0zMSAtMjggLTEwNiAtNTQgLTE3NiAtNjIgLTM4IC00IC0xMjIgLTIwIC0xODUgLTM2IC0xNTUgLTQwIC0xODcgLTQ1IC0zODUgLTY0IC05MyAtOSAtMjA0IC0yMCAtMjQ1IC0yNCAtNDEgLTUgLTI2NSAtMTIgLTQ5NyAtMTYgLTM5NSAtNyAtNDI1IC02IC00ODcgMTIgLTM2IDEwIC02NiAyMSAtNjYgMjQgMCA2IDEwMCA2OCAxNDAgODcgNjggMzIgMTY0IDczIDE3MiA3MyA1IDAgMjggOSA1MiAyMCA0MCAxOCA4MCAzMyAyOTEgMTEyIDQ0IDE2IDEwOSA0MyAxNDQgNTkgMzQgMTcgOTEgNDAgMTI1IDUzIDMzIDEzIDE2NCA3NiAyOTEgMTQwIDI2OCAxMzYgMjg0IDEzOSAzODIgODJ6IG0tMTM2NyAtNDY2IGMwIC01IC01IC0xMCAtMTEgLTEwIC01IDAgLTcgNSAtNCAxMCAzIDYgOCAxMCAxMSAxMCAyIDAgNCAtNCA0IC0xMHogbTEyMjUgLTIyNyBjLTEyIC0xMDYgLTM2IC0yNDggLTQ2IC0yODAgLTggLTI0IC0xNyAtMzMgLTMyIC0zMyAtMjAgMCAtMTQwIDM1IC0yODIgODIgLTMzIDExIC0xMTIgMzAgLTE3NSA0MyAtNjMgMTMgLTE0NiAzNiAtMTg1IDUwIC0zOCAxNSAtODEgMzAgLTk1IDM1IC03NCAyNSAtMjIzIDgwIC0yMjcgODMgLTIgMyA5OSA4IDIyNCAxMSAyOTUgOCA2MjcgMzMgNzUzIDU1IDc2IDE0IDcyIDE3IDY1IC00NnoiLz4KPC9nPgo8L3N2Zz4K",
                  anchor: new google.maps.Point(12,-290),
                  scale: 10
               };  */
    
              flightPath =  new google.maps.Polyline({
              path: locations,
              geodesic:true,
              strokeColor: '#2E2EFE',
              strokeOpacity: 0.7, 
              strokeWeight: 4,
              icons: [{
                  icon: lineSymbol,
                  offset: '100%'
                }],
                map: map            
        });
      objthis2.animateCircle(flightPath);  
    }//flightPathMaker end
      
      this.removeLine = function () {
          flightPath.setMap(null);
             // flightPathMaker();
      }//removeLine end  
      this.animateCircle = function (line) {
          var count = 0;
          window.setInterval(function() {
            count = (count + 1) % 200;
      
            var icons = line.get('icons');
            icons[0].offset = (count / 2) + '%';
            line.set('icons', icons);
        }, 20);
      } //animateCircle end      
                  
}//Location end 
   </script>
   <script src="http://maps.google.com/maps/api/js?key=AIzaSyAtigIrLnYLdIioQQT2bn9jZCiXk52JAuw&signed_in=true" 
          type="text/javascript"></script>
