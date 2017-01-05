  function filter(){
    if($('#q').val()==""){
      $("#folder-menu li").css('display','');  
    }
    else{
      $("#folder-menu li").css('display','none');
      $("#folder-menu li[name*='"+$('#q').val()+"']").css('display','');
      $("#folder-menu li[name*='"+$('#q').val()+"'] li").css('display','');
      $("#t_menu").css('display','');
      $("#folder_input").css('display','');
      
    }
    return false;
  }
  
