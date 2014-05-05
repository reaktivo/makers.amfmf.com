module.exports = (app) ->

  app.locals.title = 'MusicMakers Hacklab'

  app.get '/', (req, res) ->
    res.render 'index'