class window.Board extends Backbone.Model

  initialize: (n = 16) ->
    @set 'n', n
    @set 'aliveCells', 0

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
    aliveCells = @get 'aliveCells'
    cells = @get 'cells'
    if cells[y][x]
      cells[y][x] = 0
      @set 'aliveCells', aliveCells - 1
    else
      cells[y][x] = 1
      @set 'aliveCells', aliveCells + 1
    @trigger 'change'

  checkHoriz: (x, y) ->
    @getCellState(x+1, y) + @getCellState(x-1, y)

  checkVert: (x, y) ->
    @getCellState(x, y+1) + @getCellState(x, y-1)

  checkDiag: (x, y) ->
    @getCellState(x+1, y+1) + @getCellState(x-1, y-1) +
      @getCellState(x+1, y-1) + @getCellState(x-1, y+1)

  checkNeighbors: (x, y) ->
    @checkHoriz(x, y) + @checkVert(x, y) + @checkDiag(x, y)

  cellWillLive: (x, y) ->
    count = @checkNeighbors(x ,y)
    if @getCellState(x, y)
      #cell is alive
      if count < 2 then return false
      else if count > 3 then return false
      else return true
    else
      #cell is dead
      if count is 3 then return true
    return false

  step: ->
    cells = @get 'cells'
    aliveCells = 0

    ary = _(cells).map (row, y)=>
      _(row).map (cell, x)=>
        if @cellWillLive(x, y)
          aliveCells++
          1
        else
          0

    @set 'aliveCells', aliveCells
    @set 'cells', ary
    unless aliveCells then @trigger 'stop', @