class window.CellView extends Backbone.View

  tagName: 'td'

  initialize: (params) ->
    
    @model.on 'change:alive', =>
      if @model.get 'alive'
        @$el.css 'background-color': 'white'
      else
        @$el.css 'background-color': 'black'

  events:
    'click': (event) ->
      @model.set 'alive', !@model.get('alive')

