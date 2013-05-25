class window.Board extends Backbone.Model

  initialize: (n = 8) ->
    @set 'n', n
    # Initialize 2d array, fill with 0s
    ary = _(_.range(n)).map ->
      _(_.range(n)).map ->
        0

    @set 'cells', ary

  getCellState: (x, y) ->
    n = @get 'n'
    if (x >= n) or (x < 0) then return null
    if (y >= n) or (y < 0) then return null
    @get('cells')[y][x]

  toggle: (x, y) ->
    cells = @get 'cells'
    cells[y][x] = if cells[y][x] then 0 else 1
    @trigger 'change'

  checkHoriz: (x, y) ->
    @getCellState(x+1, y) + @getCellState(x-1, y)

  checkVert: (x, y) ->
    @getCellState(x, y+1) + @getCellState(x, y-1)

  checkDiag: (x, y) ->
    @getCellState(x+1, y+1) + @getCellState(x-1, y-1) +
      @getCellState(x+1, y-1) + @getCellState(x-1, y+1)