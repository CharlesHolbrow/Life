class window.Board extends Backbone.Model

  initialize: (n = 8) ->
    # Initialize 2d array, fill with 0s
    ary = _(_.range(n)).map ->
      _(_.range(n)).map ->
        0

    @set 'cells', ary

  toggle: (x, y) ->
    cells = @get 'cells'
    cells[y][x] = if cells[y][x] then 0 else 1
    @trigger 'change'
