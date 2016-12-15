document.getElementById('getval').addEventListener('change', readURL, true);
function readURL(){
    var file = document.getElementById("getval").files[0];
    var reader = new FileReader();
    console.log(reader.result);
    reader.onloadend = function(){
        document.getElementById('profile-upload').style.backgroundImage = "url(" + reader.result + ")";        
    }
    if(file){
    	console.log("true");
        reader.readAsDataURL(file);
        //$('#profile-upload').css('background-image', "url(https://c2.staticflickr.com/8/7151/6717697085_6d28849226_z.jpg)");
    }else{
    }
}
