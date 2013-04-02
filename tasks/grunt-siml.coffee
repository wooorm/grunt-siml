# grunt-siml
# https://github.com/wooorm/grunt-siml
# 
# Copyright (c) 2013 wooorm
# Licensed under the MIT license.

module.exports = ( grunt ) ->

	siml = require 'siml'
	fs = require 'fs'

	parser = 
		'html5' : siml.html5.parse
		'angular' : siml.angular.parse
		'default' : siml.parse

	grunt.registerMultiTask 'siml', 'SIML in Grunt.', () ->
		
		options = this.options
			# Delimeter, to join multiple files together.
			'delimeter' : '\n'

			# [default=false] pass true if you're using curlies for hierarchy.
			'curly' : false

			# [default=true] Will give you pretty HTML
			'pretty' : true

			# [default='  '] Use custom indentation when pretty=true
			'indent' : '  '
			
			'parse' : 'default'

		unless parser[ options.parse ]
			options.parse = 'default'

		parse = parser[ options.parse ]

		globOptions = 
			'nonull' : true

		this.files.forEach ( pattern ) ->

			# Expand.
			files = grunt.file.expand globOptions, pattern.src

			# Read.
			src = files.map ( filepath ) ->
				unless grunt.file.exists filepath 
					grunt.log.error 'Source file "' + filepath.red + '" not found.'
					return ''
		
				grunt.file.read filepath

			# Join.
			src = src.join options.delimeter

			# Convert.
			document = parse src, options

			# Write.
			grunt.file.write pattern.dest, document

			# Report.
			grunt.log.writeln [
					'File `'
					, pattern.dest.green
					, '` created in '
					, options.parse
					, ' mode.'
				].join ''
