$(document).ready(function() {

  $(document).on('click', '.intro button', function(event) {
    $('.intro').css('display', 'none');
    $('.game-board').css('display', 'block');
  });
  $('#reset').on('click', function(event) {
    event.preventDefault;
    $.post('/reset');
    window.location.href('/');
  });

  $(document).on('click', '.space', function(event) {
    event.preventDefault();
    var hit = $(this).data('hit');
    if (hit=='X') {
      $('.last-shot').html('Last shot was a hit!');
      $('')
    }
    else { 
      $('.last-shot').html('Last shot was a miss :(') 
    } 
    $(this).replaceWith($(this).data('hit'));
    var location = $(this).data('location');
    var board_id = $(this).data('board_id');
    $.post('/shot', {loc: location, board_id: board_id});
    $.get('/game_status', function(response) { $('#game-status').html(response); });
  });
});
