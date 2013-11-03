$(document).ready(function() {
  $(document).on('click', '.space',function(event) {
    event.preventDefault();
    var hit = $(this).data('hit');
    if (hit=='X') {
    $('.game-status').html('That was a hit!');
    }
    else { 
      $('.game-status').html('That was a miss :(') 
    } 
    $(this).replaceWith($(this).data('hit'));
    var location = $(this).data('location');
    var board_id = $(this).data('board_id');
    console.log(board_id);
    $.post('/shot', {loc: location, board_id: board_id})
    
  });
});
