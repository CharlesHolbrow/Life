class window.BoardView extends Backbone.View

  tagName: 'table'

  initialize: ->
    @render()

  render: ->
    cells = @model.get('cells')

    # Render each row
    _(cells).each (row) =>
      $tr = $('<tr>').appendTo(@$el)

      # Populate row
      _(row).each (cell) =>
        $('<td>' + cell + '</td>').appendTo($tr)
