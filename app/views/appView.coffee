class window.AppView extends Backbone.View

  template: _.template '
    <button id="step">Step</button>
    <button id="run">Run</button>
    <button id="stop" disabled>Stop</button>
    '

  initialize: ->
    @render()

  events:
    'click button#step': ->
      @model.get('board').step()
    'click button#run': ->
      @model.run()
      $('#stop').attr 'disabled': false
      $('#run').attr 'disabled': true
    'click button#stop': ->
      @model.stop()
      $('#run').attr 'disabled': false
      $('#stop').attr 'disabled': true

  render: ->
    @$el.html @template()
    @$el.append new BoardView({model: @model.get('board')}).el
