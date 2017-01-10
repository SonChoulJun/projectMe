<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/html/colorBox/colorbox.css" />
</head>
<SCRIPT LANGUAGE="JavaScript">
 
  </SCRIPT>
 </HEAD>

 <BODY>
   <p><a class='iframe' href="/photo/photoAlbum.jsp">${userList}</a></p>
   
<div id="test2">
</div>
 <script src="/html/jqueryUi/jquery-ui.js"></script>
   <script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
   <script src="/html/colorBox/jquery.colorbox.js"></script>
      <script>
      var abc=${userList}
      var oData = {
    		  "Name": abc,
    		  , "Age": "29"
    		}

    		var sPerson = JSON.stringify(oData);
    		var oPerson = JSON.parse(sPerson);

    		alert(sPerson);
    		/* Output: "{"Name":"SooYoung","Age":"29"}" */
    		alert(oPerson.Name);
    </script>
 </BODY>
</html>