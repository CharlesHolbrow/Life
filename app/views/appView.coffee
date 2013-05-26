class window.AppView extends Backbone.View

  template: _.template '
    <button id="step">Step</button>
    <button id="run">Run</button>
    <button id="stop" disabled>Stop</button>
    '

  initialize: ->
    @render()

    @model.on 'change:running', =>
      if @model.get 'running'
        $('#stop').attr 'disabled': false
        $('#run').attr 'disabled': true
      else
        $('#run').attr 'disabled': false
        $('#stop').attr 'disabled': true

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
