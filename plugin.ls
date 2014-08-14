require! fs

module.exports = (env, cb) ->
  class LiveScriptPlugin extends env.ContentPlugin
    (@_filepath, @_text) ->

    get-filename: -> @_filepath.relative.replace /(ls)$/, 'js'

    get-view: ->
      (env, locals, contents, templates, cb) ->
        try
          js = LiveScript.compile @_text
          cb? null, new Buffer js
        catch err
          cb? err

  LiveScriptPlugin.from-file = (filepath, cb) ->
    err, bf <- fs.read-file filepath.full
    if err then cb? err
    else cb?! null, new LiveScriptPlugin(filepath, bf.toString!)

  env.register-content-plugin 'livescript', '**/*.*(ls)', LiveScriptPlugin
  cb?!
