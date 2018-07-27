var morphemechipsInstance, tagInfo;

function formatResult( result ) {
	var $resultHTML = $( '<div>' ).addClass( 'result' );

	let morphemes = result.morphemes;
	for ( let i = 0; i < morphemes.length; i++ ) {
		let morpheme = morphemes[ i ];
		let root = morpheme.root;
		let tags = morpheme.pos;
		let $tags = $( '<div>' ).addClass( 'tags' );
		for ( let j = 0; j < tags.length; j++ ) {
			let tagData = tagInfo.find( item => item.id === tags[ j ] );
			if ( tagData && tagData.url ) {
				$tags.append( $( '<div>' ).addClass( 'tag' ).append(
					$( '<a>' ).attr( 'href', tagData.url ).text( tagData.tag ) ) );
			} else {
				let tagLabel = tagData ? tagData.tag : tags[ j ];
				$tags.append( $( '<div>' ).addClass( 'tag' ).text( tagLabel ) );
			}
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
	$( '#genresult-progress' ).show();
	$.getJSON( '/api/generate', {
		word: morphemechipsInstance.getDataString()
	}, ( data ) => {
		var result = data.result;
		$.each( result, ( key, value ) => {
			$( '.genresult' ).append( $( '<div>' ).addClass( 'result' ).text( value ) );
		} );
		$( '#genresult-progress' ).hide();
	} );
}

function onAnalysisClick() {
	$( '.analresult' ).find( 'tbody' ).empty();
	$( '.analresult' ).show();
	$( '#analresult-progress' ).show();
	let text= $( 'textarea[name="text"]' ).val();
	$.post( '/api/analyse', { text }, ( data ) => {
		$( '#analresult-progress' ).hide();
		let result = data.result;
		let tokens=text.split(/\s+/);
		for (let i=0;i<tokens.length;i++ ) {
			let length = 0;
			let key = tokens[i]
			let values = result[key];
			let formattedValues = $( '<td>' );
			if ( values.length > 0 ) {
				length = 1;
			}
			for ( let i = 0; i < length; i++ ) {
				formattedValues.append( formatResult( values[ i ] ) );
			}
			$( '.analresult tbody' ).append(
				$( '<tr>' ).append(
					$( '<td>' ).text( key ),
					formattedValues
				)
			);
		};
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
	$( '#analresult-progress' ).hide();
	$( '#genresult-progress' ).hide();
	fetchTags().then( ( tags )=>{
		tagInfo = tags;
		init();
	} );
} );
