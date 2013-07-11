class window.Board extends Backbone.Model

  initialize: (n = 40) ->
    @set 'n', n
    @set 'aliveCells', 0

    # Make a 2D array of cells
    ary = ((new Cell({n, x, y}) for x in [0...n]) for y in [0...n])
    @set 'cells', ary

  getCellState: (x, y) ->
    n = @get 'n'
    if (x >= n) or (x < 0) then return null
    if (y >= n) or (y < 0) then return null
    cell = @get('cells')[y][x]
    if cell.get 'alive' then 1 else 0

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
      count is 2 or count is 3
    else
      #cell is dead
      count is 3

  step: ->
    cells = @get 'cells'
    aliveCells = 0

    setWillLive = (cell, x, y) =>
      cell.set 'willLive', @cellWillLive(x, y)
      if cell.get 'willLive' then aliveCells++

    # set willLive on each cell (it's ugly, but it's wonderful)
    setWillLive cell, x, y for cell, x in row for row, y in cells

    # set alive from willLive on each cell
    cell.set 'alive', cell.get 'willLive' for cell in row for row in cells

    @trigger 'stop' unless aliveCells

    @set 'aliveCells', aliveCells
