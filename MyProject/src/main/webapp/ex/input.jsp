<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/ex/input.css" rel="stylesheet">
</head>
<body>

<div id="form-main">
  <div id="form-div">
    <form class="form" id="form1">
      
      <p class="title">
        <input name="title" type="text" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" placeholder="title" id="title" />
      </p>
      
      <p class="text">
        <textarea name="text" class="validate[required,length[6,300]] feedback-input" id="comment" placeholder="Comment"></textarea>
      </p>
      
      
      <div class="submit">
        <input type="submit" value="SEND" id="button-blue"/>
        <div class="ease"></div>
      </div>
    </form>
  </div>
  </div>
</body>
</html>