class window.BoardView extends Backbone.View

  tagName: 'table'

  initialize: ->
    @render()
    @model.on 'change', =>
      @render()

  events:
    'click td': (event)->
      data = $(event.target).data()
      @model.toggle data.x, data.y

  render: ->
    n = @model.get 'n'
    @$el.empty()
    cells = @model.get('cells')

    # Render each row
    _(cells).each (row, y) =>
      $tr = $('<tr>').appendTo(@$el)
      yColor = Math.floor(255 / n * (y+1))
      # Populate row
      _(row).each (cell, x) =>
        xColor = Math.floor(255 / n * (x+1))
        $td = $('<td>')
        if cell
          $td.css {'background-color': 'rgb(255, '+xColor+', '+yColor+')'}
        $td.data({'x': x, 'y': y})
        $td.appendTo($tr)
