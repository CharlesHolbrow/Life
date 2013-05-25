class window.BoardView extends Backbone.View

  tagName: 'table'

  initialize: ->
    @render()
    @$el.on 'click', 'td', (event)->
      console.log('click!', $(@).data())

  render: ->
    cells = @model.get('cells')

    # Render each row
    _(cells).each (row, rowIndex) =>
      $tr = $('<tr>').appendTo(@$el)

      # Populate row
      _(row).each (cell, colIndex) =>
        console.log(colIndex, rowIndex)
        $td = $('<td>').text(cell)
        $td.data({'x': colIndex, 'y': rowIndex})
        $td.appendTo($tr)
