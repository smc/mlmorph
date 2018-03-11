$( function () {
	var morphemechipsInstance, tagInfo;

	tagInfo = [ { id: 'n', tag: 'Noun' },
		{ id: 'np', tag: 'Proper Noun' },
		{ id: 'v', tag: 'Verb' },
		{ id: 'prn', tag: 'Pronoun' },
		{ id: 'adj', tag: 'Adjective' },
		{ id: 'adv', tag: 'Adverb' },
		{ id: 'pl', tag: 'Plural' },
		{ id: 'accusative', tag: 'Accusative' },
		{ id: 'dative', tag: 'Dative' },
		{ id: 'genitive', tag: 'Genitive' },
		{ id: 'instrumental', tag: 'Instrumental' },
		{ id: 'locative', tag: 'Locative' },
		{ id: 'sociative', tag: 'Sociative' },
		{ id: 'vocative', tag: 'Vocative' },
		{ id: 'indeclinable', tag: 'Indeclinable' },
		{ id: 'past', tag: 'Past' },
		{ id: 'future', tag: 'Future' },
		{ id: 'present', tag: 'present' },
		{ id: 'eng', tag: 'English' },
		{ id: 'cvb-adv-part-future', tag: 'Future adverbial participle' },
		{ id: 'cvb-adv-part-conditional', tag: 'Conditional adverbial participle' },
		{ id: 'cvb-adv-part-absolute', tag: 'Absolute adverbial participle' },
		{ id: 'cvb-adv-part-past', tag: 'Past adverbial participle' },
		{ id: 'concessive', tag: 'Concessive' },
		{ id: 'aff', tag: 'Affirmative' },
		{ id: 'neg', tag: 'Negation' },
		{ id: 'interrogative', tag: 'Interrogative' },
		{ id: 'Punct', tag: 'Punctuation' },
		{ id: 'cardinal', tag: 'Cardinal' },
		{ id: 'ordinal', tag: 'Ordinal' },
		{ id: 'half', tag: 'Half' },
		{ id: 'deriv', tag: 'Derviative' },
		{ id: 'feminine', tag: 'Feminine' },
		{ id: 'masculine', tag: 'Masculine' },
		{ id: 'neutral', tag: 'Neutral' },
		{ id: 'ones', tag: 'Ones' },
		{ id: 'tens', tag: 'Tens' },
		{ id: 'hundreds', tag: 'Hundreds' },
		{ id: 'thousands', tag: 'Thousands' },
		{ id: 'crores', tag: 'Crores' },
		{ id: 'lakhs', tag: 'Lakhs' }

	];
	function formatResult( result ) {
		var i, j, root, tags, morphemes, morpheme, $tags, tagLabel, $resultHTML;

		$resultHTML = $( '<div>' ).addClass( 'result' );

		morphemes = result.morphemes;
		for ( i = 0; i < morphemes.length; i++ ) {
			morpheme = morphemes[ i ];
			root = morpheme.root;
			tags = morpheme.pos;
			$tags = $( '<div>' ).addClass( 'tags' );
			for ( j = 0; j < tags.length; j++ ) {
				tagLabel = tagInfo.find( item => item.id === tags[ j ] );
				tagLabel = tagLabel ? tagLabel.tag : tags[ j ];
				$tags.append( $( '<div>' ).addClass( 'tag' ).text( tagLabel ) );
			}
			$resultHTML.append( $( '<div>' ).addClass( 'component' )
				.append( $( '<div>' ).addClass( 'root' ).text( root ) )
				.append( $tags )
			);
		}
		return $resultHTML;
	}

	$( '.analresult' ).hide();

	$( '#generate' ).on( 'click', function () {
		$( '.genresult' ).empty();
		$.getJSON( '/api/generate', {
			word: morphemechipsInstance.getDataString()
		}, function ( data ) {
			var result = data.result;
			$.each( result, function ( key, value ) {
				$( '.genresult' ).append( $( '<div>' ).addClass( 'result' ).text( value ) );
			} );
		} );
	} );

	$( '#analyse' ).on( 'click', function () {
		$( '.analresult' ).find( 'tbody' ).empty();
		$( '.analresult' ).show();
		$.post( '/api/analyse', {
			text: $( 'textarea[name="text"]' ).val()
		}, function ( data ) {
			var result = data.result;
			$.each( result, function ( key, values ) {
				var formattedValues, i;
				if ( !key || !key.trim() ) {
					return;
				}
				formattedValues = $( '<td>' );
				for ( i = 0; i < values.length; i++ ) {
					formattedValues.append( formatResult( values[ i ] ) );
				}
				$( '.analresult tbody' ).append(
					$( '<tr>' ).append(
						$( '<td>' ).text( key ),
						formattedValues
					)
				);
			} );
		} );
	} );

	morphemechipsInstance = M.MorphemeChips.init( $( '.chips-autocomplete' )[ 0 ], {
		placeholder: 'Add morphemes',
		autocompleteOptions: {
			data: tagInfo,
			limit: Infinity,
			minLength: 1
		} }
	);
} );
