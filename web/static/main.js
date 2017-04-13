$(function() {

    $('#generate').on('click', function() {
        $(".genresult").empty();
        $.getJSON('/generate', {
            word: $('input[name="word"]').val(),
            type: $('select[name="type"]').val(),
            infl: $('select[name="infl"]').val(),
        }, function(data) {
            var i, result = data.result;
            $.each(result, function(key, value) {
                $(".genresult").append($('<div>').text(value));
            });
        });
    });

    $('#analyse').on('click', function() {
        $(".analresult").empty();
        $.getJSON('/analyse', {
            text: $('textarea[name="text"]').val()
        }, function(data) {
            var i, result = data.result;
            $.each(result, function(key, value) {
                if (key && key.trim())
                    $(".analresult").append(
                        $('<tr>').append(
                            $('<td>').text(key),
                            $('<td>').text(value)
                        )
                    );
            });

        });
    });
});
