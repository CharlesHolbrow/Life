class window.AppView extends Backbone.View

  template: _.template '
    <button id="step">Step</button>
    <button id="run">Run</button>
    <button id="stop" disabled>Stop</button>
    '

  initialize: ->
    @render()

    @model.on 'change:running', =>
      running = !!@model.get 'running'
      $('#stop').attr disabled: !running
      $('#run').attr disabled: running

  events:
    'click button#step': ->
      @model.get('board').step()

    'click button#run': ->
      @model.run()

    'click button#stop': ->
      @model.stop()

    'mousedown': ->
      @model.mouseDown()

    'mouseup': ->
      @model.mouseUp()

  render: ->
    @$el.html @template()
    @$el.append new StatsView(model: @model.get('board')).el
    @$el.append new BoardView(model: @model.get('board')).el
