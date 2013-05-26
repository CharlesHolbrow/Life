class window.AppView extends Backbone.View

  template: _.template '<button id="step">Step</button><button id="run">Run</button><button id="stop">Stop</button>'

  initialize: ->
    @render()

  events:
    'click button#step': ->
      @model.get('board').step()
    'click button#run': ->
      @model.run()
    'click button#stop': ->
      @model.stop()

  render: ->
    @$el.html @template()
    @$el.append new BoardView({model: @model.get('board')}).el
