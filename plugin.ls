require! fs

module.exports = (env, cb) ->
  class LiveScriptPlugin extends env.ContentPlugin
    (@path, @body) ->

    get-filename: -> @path.relative.replace /\.ls$/ \.js

    get-view: ->
      (env, locals, contents, templates, cb) ->
        try cb? null, new Buffer LiveScript.compile @body
        catch then cb? e

  LiveScriptPlugin.from-file = (filepath, cb) ->
    err, bf <- fs.read-file filepath.full
    if err then cb? that
           else cb? null new LiveScriptPlugin filepath, bf.toString!

  env.register-content-plugin \livescript \**/*.ls LiveScriptPlugin
  cb?!
