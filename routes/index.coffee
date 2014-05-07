module.exports = (app) ->

  app.locals.title = 'MusicMakers Hacklab'

  app.get '/', (req, res, next) ->
    res.redirect '/es'

  app.get '/:lang', (req, res, next) ->
    return do next unless req.params.lang.match /es|en/
    res.render 'index_' + req.params.lang
