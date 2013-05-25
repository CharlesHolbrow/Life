class window.AppView extends Backbone.View

  template: _.template '<button>Step</button>'

  initialize: ->
    @render()

  events:
    'click button': ->
      @model.get('board').step()

  render: ->
    @$el.html @template()
    @$el.append new BoardView({model: @model.get('board')}).el
