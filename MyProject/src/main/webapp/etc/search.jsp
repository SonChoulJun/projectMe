<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    table {
        border-collapse:collapse;
        width:400px;
        font-size:0.8em;
    }
    td,th{
        border:solid 1px black;
        text-align:center;
    }
    th{
        background:#ccc;
    }
</style>
</head>
<body>

Filter: <input type='text' id='txtFilter' onkeyup='{filter();return false}' onkeypress='javascript:if(event.keyCode==13){ filter(); return false;}'>
<Br/><br/>
<table>
    <thead>
        <tr><th>NO</td><th>TITLE</td></tr>
    </thead>
    <tbody id='languageTBody'>
        <tr name='javascript'><td>1</td><td>javascript</td></tr>
        <tr name='css'><td>2</td><td>css</td></tr>
        <tr name='html'><td>3</td><td>html</td></tr>
        <tr name='php'><td>4</td><td>php</td></tr>
        <tr name='asp.net'><td>5</td><td>asp.net</td></tr>
        <tr name='jsp'><td>6</td><td>jsp</td>
        </tr>
    </tbody>
</table>
            <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script type='text/javascript'>
    function filter(){
        if($('#txtFilter').val()=="")
            $("#languageTBody tr").css('display','');           
        else{
            $("#languageTBody tr").css('display','none');
            $("#languageTBody tr[name*='"+$('#txtFilter').val()+"']").css('display','');
        }
        return false;
    }
</script>
            
            

</body>
</html>




