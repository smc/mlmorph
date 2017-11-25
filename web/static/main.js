$(function () {

    function formatResult(textValue) {
        var i, j, root, tags,
            resultHTML = '',
            components;

        if (!textValue) {
            return textValue;
        }
        components = textValue.match(/([^<]+)(<[^>]+>)+/g);

        for (i = 0; i < components.length; i++) {
            root = components[i].match(/[^<]+/g)[0];
            tags = components[i].match(/<[^>]+>/g)
            resultHTML += '<div class="component">';
            resultHTML += '<div class="root">' + root + '</div>';
            resultHTML += '<div class="tags">';
            for (j = 0; j < tags.length; j++) {
                resultHTML += '<div class="tag">' + tags[j].replace(/[><]/g, '') + '</div>';
            }
            resultHTML += '</div></div>';
        }
        return resultHTML;
    }

    $('select').material_select();
    $(".analresult").hide();
    $('#generate').on('click', function () {
        $(".genresult").empty();
        $.getJSON('/generate', {
            word: $('input[name="word"]').val(),
            type: $('select[name="type"]').val(),
            infl: $('select[name="infl"]').val(),
        }, function (data) {
            var i, result = data.result;
            $.each(result, function (key, value) {
                $(".genresult").append($('<div>').text(value));
            });
        });
    });

    $('#analyse').on('click', function () {
        $(".analresult").find("tbody").empty();
        $(".analresult").show();
        $.post('/analyse', {
            text: $('textarea[name="text"]').val()
        }, function (data) {
            var i, result = data.result;
            $.each(result, function (key, values) {
                if (key && key.trim()) {
                    var formattedValues = '';
                    for (var i = 0; i < values.length; i++) {
                        formattedValues += '<div class="result">' + formatResult(values[i]) + '</div>';
                    }
                    $(".analresult tbody").append(
                        $('<tr>').append(
                            $('<td>').text(key),
                            $('<td>').html(formattedValues)
                        )
                    );
                }
            });
        });
    });
});
