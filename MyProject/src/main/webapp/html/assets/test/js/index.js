/* Mock Up Swap */
$('nav a').not('.sidebar-toggle').click(function(e) {
  e.preventDefault();
  $('nav a').removeClass('active');
  $(this).addClass('active');
  $('.mockup-content').hide();
  $($.attr(this, 'href'), '.mockup-content.active').show();
  $('.mockup-content').hide();
  $( $.attr(this, 'href') ).show();
});

/* Sidebar Toggle */
$('.sidebar-toggle').click(function() {
  $('.container').toggleClass('with_sidebar');
});