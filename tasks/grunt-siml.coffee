# grunt-siml
# https://github.com/wooorm/grunt-siml
# 
# Copyright (c) 2013 wooorm
# Licensed under the MIT license.

siml = require 'siml'
fs = require 'fs'

module.exports = ( grunt ) ->

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
			document = siml.html5.parse src, options

			# Write.
			grunt.file.write pattern.dest, document

			# Report.
			grunt.log.writeln 'File `' + pattern.dest.green + '` created.'
