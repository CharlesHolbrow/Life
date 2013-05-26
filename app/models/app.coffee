class window.App extends Backbone.Model

  initialize: ->
    @set 'board', new Board()

  run: ->
    board = @get 'board'
    func = ->
      board.step()
    @set 'runIndex', setInterval(func, 250)

  stop: ->
    clearInterval @get('runIndex')
