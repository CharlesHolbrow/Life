class window.App extends Backbone.Model

  initialize: ->
    @set 'board', new Board()
