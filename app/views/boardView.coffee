class window.BoardView extends Backbone.View

  tagName: 'table'

  initialize: ->
    @render()

  render: ->
    n = @model.get 'n'
    @$el.empty()
    cells = @model.get('cells')

    # Render each row
    _(cells).each (row, y) =>
      $tr = $('<tr>').appendTo(@$el)
      # Populate row
      _(row).each (cell, x) =>
        $td = new CellView(model:cells[y][x]).$el
        # For testing:
        $td.data({'x': x, 'y': y})
        $td.appendTo($tr)
