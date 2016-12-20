<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/html/plugins/jQuery/jquery-2.2.3.min.js"></script>
  <style type="text/css">
    .tab-menu {
      list-style : none;
      height:80px;
    }
    .tab-menu li {
      width:99px;
      height:40px;
      background-position-y:0;
      text-indent : -1000px;
      overflow : hidden;
      display : inline-block;
      float:left;
    }
    .tab-menu li:hover {
      background-postion-y : -40px;
    }
    .tab-menu li.select {
      background-postion-y : -80px;
      height:80px;
    }
    .tab-menu li.menuitem1 {
      background-image : url(/images/newbtn.bar.1.png);
    }
    .tab-menu li.menuitem2 {
      background-image : url(/images/newbtn.bar.2.png);
    }
    .tab-menu li.menuitem3 {
      background-image : url(/images/newbtn.bar.3.png);
    }
    .tab-menu li.menuitem4 {
      background-image : url(/images/newbtn.bar.4.png);
    }
    .tab-menu li.menuitem5 {
      background-image : url(/images/newbtn.bar.5.png);
    }
    .tab-menu li.menuitem6 {
      background-image : url(/images/newbtn.bar.6.png);
    }
    
  </style>
  <script type="text/javascript">
    var $tabMenu = null;
    var $menuItems = null;
    var $selectMenuItem = null;
    
    $(function(){
      //탭메뉴 요소 초기화
      init();
      //탭메뉴 요소 이벤트 등록
      initEvent();
    });
    
    // 요소 초기화
    function init(){
      $tabMenu = $("#tabMenu1");
      $menuItems = $tabMenu.find("li");
    }
    
    // 이벤트 등록
    function initEvent(){
      $menuItems.on("click",function(){
        setSelectItem($(this));
      });
    }
    
    // $menuItem에 해당하는 메뉴 아이템 선택하기
    function setSelectItem($menuItem){
      //기존 선택메뉴 아이템을 비활성화 처리
      if($selectMenuItem){
        $selectMenuItem.removeClass("select");
      }
      //신규 아이템 활성화 처리
      $selectMenuItem = $menuItem;
      $selectMenuItem.addClass("select");
    }
  </script>
</head>
<body>
  <p>첫 번째 탭 메뉴</p>
  <ul class="tab-menu" id="tabMenu1">
    <li class="menuitem1">google</li>
    <li class="menuitem2">facebook</li>
    <li class="menuitem3">pinterest</li>
    <li class="menuitem4">twitter</li>
    <li class="menuitem5">airbnb</li>
    <li class="menuitem6">path</li>
  </ul> 
</body>
</html>







