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
    @$el.empty()
    cells = @model.get('cells')

    # Render each row
    _(cells).each (row, rowIndex) =>
      $tr = $('<tr>').appendTo(@$el)

      # Populate row
      _(row).each (cell, colIndex) =>
        $td = $('<td>').text(cell)
        $td.data({'x': colIndex, 'y': rowIndex})
        $td.appendTo($tr)
