# grunt-siml
> Compile SIML templates.

## Getting Started
This plugin requires Grunt `~0.4.0`

Checkout [Grunt](http://gruntjs.com/), if you haven't before.

Checkout [SIML's introduction](https://github.com/padolsey/SIML/wiki/101---Introduction) for more information on [SIML](https://github.com/padolsey/SIML) itself.

```shell
npm install grunt-slim --save-dev
```

Once the Grunt Plugin has been installed, it may be enabled inside your Gruntfile with this line of CoffeeScript:

```coffee
grunt.loadNpmTasks 'grunt-slim'
```

...or with the following JavaScript:

```js
grunt.loadNpmTasks('grunt-slim');
```

## SIML task
_Run this task with the `grunt siml` command._

Task targets, files and options may be specified according to the grunt [Configuring tasks](http://gruntjs.com/configuring-tasks) guide.

### Options

#### pretty
Type: `Boolean`
Default: `true`

Output indented HTML (see `indent`).

#### indent
Type: `String`
Default: `"  "`

Use custom indentation. Works only with `pretty: true`

#### curly
Type: `Boolean`
Default: `false`

Nest with curly brackets when true, whitespace when false.

### Usage Examples

In CoffeeScript, setting indentation to :

```coffee
'siml' :
	'compile' :
		'options' : 
		  	'indent' : '\t'
		'files' :
			'_dist/index.html' : '_source/index.siml'
```


```js
'siml' : {
	'compile' : {
		'options' : {
			'curly' : true,
			'pretty' : false
		},
		'files' : {
			'index.html' : 'index.siml'
		}
	}
}
```
