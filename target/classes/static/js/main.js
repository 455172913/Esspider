require.config({
	baseUrl: '../js',
	paths: {
    	"jquery": "lib/jquery.min",
    	"underscore": "lib/underscore"
	},
	shim: {
		'underscore': {
            exports: '_'
        }
	}
});
