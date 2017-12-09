$(function () {

    function formatResult(result) {
        var i, j, root, tags,morphemes,
            $resultHTML =  $('<div>').addClass('result')

        morphemes = result.morphemes;
        for (i = 0; i < morphemes.length; i++) {
            morpheme = morphemes[i];
            root = morpheme.root;
            tags = morpheme.pos;
            $tags = $('<div>').addClass('tags');
            for (j = 0; j < tags.length; j++) {
                $tags.append($('<div>').addClass('tag').text(tags[j]));
            }
            $resultHTML.append($('<div>').addClass('component')
                .append( $('<div>').addClass('root').text(root))
                .append( $tags )
            )
        }
        return $resultHTML;
    }

    $('select').material_select();
    $(".analresult").hide();
    $('#generate').on('click', function () {
        $(".genresult").empty();
        $.getJSON('/api/generate', {
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
        $.post('/api/analyse', {
            text: $('textarea[name="text"]').val()
        }, function (data) {
            var i, result = data.result;
            $.each(result, function (key, values) {
                if (!key || !key.trim()) {
                    return;
                }
                var formattedValues =  $('<td>')
                for (var i = 0; i < values.length; i++) {
                    formattedValues.append( formatResult(values[i]) );
                }
                $(".analresult tbody").append(
                    $('<tr>').append(
                        $('<td>').text(key),
                        formattedValues
                    )
                );
            });
        });
    });
});
