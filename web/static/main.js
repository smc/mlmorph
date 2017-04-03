$(function() {
  $('#generate').on('click', function() {
	$.getJSON( '/generate', {
	  word: $('input[name="word"]').val(),
	  type: $('select[name="type"]').val(),
	  infl: $('select[name="infl"]').val(),
	}, function(data) {
	  $(".genresult").text(data.result[0]);
	});
	return false;
  });
});
