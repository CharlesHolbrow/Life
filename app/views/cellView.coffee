class window.CellView extends Backbone.View

  tagName: 'td'

  initialize: (params) ->

    @model.on 'change:alive', =>
      if @model.get 'alive'
        @$el.css 'background-color': @model.get 'color'
      else
        @$el.css 'background-color': 'black'

  events:
    # hint: try 'mouseenter'
    'mouseenter': (event) ->
      @model.set 'alive', !@model.get('alive')

