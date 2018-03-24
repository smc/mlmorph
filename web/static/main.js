var morphemechipsInstance, tagInfo;

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

function onGenerateClick() {
	$( '.genresult' ).empty();
	$.getJSON( '/api/generate', {
		word: morphemechipsInstance.getDataString()
	}, ( data ) => {
		var result = data.result;
		$.each( result, ( key, value ) => {
			$( '.genresult' ).append( $( '<div>' ).addClass( 'result' ).text( value ) );
		} );
	} );
}

function onAnalysisClick() {
	$( '.analresult' ).find( 'tbody' ).empty();
	$( '.analresult' ).show();
	$.post( '/api/analyse', {
		text: $( 'textarea[name="text"]' ).val()
	}, ( data ) => {
		let result = data.result;
		$.each( result, ( key, values ) => {
			if ( !key || !key.trim() ) {
				return;
			}
			let formattedValues = $( '<td>' );
			for ( let i = 0; i < values.length; i++ ) {
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
}

function init() {
	$( '#analyse' ).on( 'click', onAnalysisClick );
	$( '#generate' ).on( 'click', onGenerateClick );
	$( '.analresult' ).hide();
	morphemechipsInstance = M.MorphemeChips.init( $( '.chips-autocomplete' )[ 0 ], {
		placeholder: 'Add morphemes',
		autocompleteOptions: {
			data: tagInfo,
			limit: Infinity,
			minLength: 1
		} }
	);
}

function fetchTags() {
	return fetch( 'static/tags.json' ).then( ( response ) => response.json() );
}

$( function () {
	fetchTags().then( ( tags )=>{
		tagInfo = tags;
		init();
	} );
} );
