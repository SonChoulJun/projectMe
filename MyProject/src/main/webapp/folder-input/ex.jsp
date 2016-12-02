%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">


<style>

    /* a태그 내부링크로 이동시.. 해당 타겟이 되는 요소에 css를 적용 */
   
    .a:target {              /* 모든 a태그 타겟 요소에 css적용 */
        background: red;
    }
    
    #that10:target {        /* 아이디가 #that10인  a태그의 타겟요소에 css적용 */
        background: orange;
    }
    
    .a{
      background: orange;
    }
    
</style>
<script src="js/jquery.js"></script>

    
</head>
<body>
    <table border="1">
        <tr>
            <td>1</td>
            <td id="that2" class ="a">2</td>
            <td>3</td>
            <td id="that4">4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td id="that10">10</td>
        </tr>
    </table>
    <a href="#that2">타겟2</a> <!-- #that3란 타겟은 존재하지 않음 -->
    <p><a href="#that4">타겟4</a></p>
    <p><a href="#that10">타겟10</a></p>
</body>
</html>