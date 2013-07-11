class window.App extends Backbone.Model

  initialize: ->
    @set 'board', new Board()
    @set 'running', false
    @get('board').on 'stop', =>
      @stop()

    window.buttonState = 0

  run: ->
    func = =>
      @get('board').step()
    @set 'runIndex', setInterval(func, 100)
    @set 'running', true

  stop: ->
    clearInterval @get('runIndex')
    @set 'running', false

  mouseDown: ->
    window.buttonState++

  mouseUp: ->
    window.buttonState--
