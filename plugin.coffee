LiveScript   = require('LiveScript')
fs           = require 'fs'

module.exports = (env, callback) ->
  class LiveScriptPlugin extends env.ContentPlugin

    constructor: (@_filepath, @_text) ->

    getFilename: ->
      @_filepath.relative.replace /(ls)$/, 'js'

    getView: ->
      return (env, locals, contents, templates, callback) ->
        try
          js = LiveScript.compile @_text
          callback null, new Buffer js
        catch error
          callback error

  LiveScriptPlugin.fromFile = (filepath, callback) ->
    fs.readFile filepath.full, (error, buffer) ->
      if error
        callback error
      else
        callback null, new LiveScriptPlugin filepath, buffer.toString()

  env.registerContentPlugin 'livescript', '**/*.*(ls)', LiveScriptPlugin
  callback()
