( function ( $ ) {
	'use strict';

	/**
	   * @typedef {Object} chip
	   * @property {String} tag  chip tag string
	   * @property {String} [image]  chip avatar image string
	   */

	/**
	   * @class
	   *
	   */
	class MorphemeChips extends M.Chips {
		/**
	     * Render Chip
	     * @param {chip} chip
	     * @return {Element}
	     */
		_renderChip( chip ) {
			if ( !chip.tag ) {
				return;
			}
			let renderedChip = super._renderChip( chip );
			renderedChip.classList.add( 'morphemechip' );
			return renderedChip;
		}

		/**
		 * Check if chip is valid
		 * @param {chip} chip
		 * @return {boolean}
		 */
		_isValid( chip ) {
			return !!chip;
		}

		/**
		 * Setup Autocomplete
		 */
		_setupAutocomplete() {
			let onAutocomplete = ( val ) => {
				this.addChip( {
					tag: val,
					id: this.autocompleteData[ val ] ? this.autocompleteData[ val ].id : val
				} );
				this.$input[ 0 ].value = '';
				this.$input[ 0 ].focus();
			};
			this.autocompleteData = {};
			for ( let i = 0; i < this.options.autocompleteOptions.data.length; i++ ) {
				this.autocompleteData[ this.options.autocompleteOptions.data[ i ].tag ] = this.options.autocompleteOptions.data[ i ];
			}

			this.autocomplete = M.Autocomplete.init( this.$input[ 0 ], { data: this.autocompleteData, onAutocomplete } );
		}

		getDataString() {
			let dataString = '';
			for ( let i = 0; i < this.chipsData.length; i++ ) {
				if ( this.chipsData[ i ].id ) {
					dataString += '<' + this.chipsData[ i ].id + '>';
				} else {
					dataString += this.chipsData[ i ].tag;
				}
			}

			return dataString;
		}
	}

	M.MorphemeChips = MorphemeChips;

	if ( M.jQueryLoaded ) {
		M.initializeJqueryWrapper( MorphemeChips, 'morphemechips', 'M_MorphemeChips' );
	}

}( cash ) );
