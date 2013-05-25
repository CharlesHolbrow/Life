describe 'board', ->
  board = null

  beforeEach ->
    board = new Board(8)

  it 'should initialize a cells array of size n', ->
    expect(board.get('cells').length).toEqual 8

  describe '#getCellState', ->
    it 'should return the value of a cell if in range', ->
      expect(board.getCellState(2, 3)).toEqual 0

    it 'should return null if the indices are out of range', ->
      expect(board.getCellState(8, 0)).toEqual null
      expect(board.getCellState(0, 8)).toEqual null
      expect(board.getCellState(-1, 0)).toEqual null
      expect(board.getCellState(0, -1)).toEqual null

  describe '#toggle', ->
    it 'should toggle a cells state between 0 and 1', ->
      expect(board.getCellState(2, 3)).toEqual 0
      board.toggle 2, 3
      expect(board.getCellState(2, 3)).toEqual 1

  describe '#checkHoriz', ->
    it 'should return number of alive neighbors to the left or right', ->
      expect(board.checkHoriz(7, 7)).toEqual 0
      board.toggle(6, 7)
      expect(board.checkHoriz(7, 7)).toEqual 1
      board.toggle(7, 6)
      expect(board.checkHoriz(7, 7)).toEqual 1

  describe '#checkVert', ->
    it 'should return number of alive neighbors to the top or bottom', ->
      expect(board.checkVert(7, 7)).toEqual 0
      board.toggle(6, 7)
      expect(board.checkVert(7, 7)).toEqual 0
      board.toggle(7, 6)
      expect(board.checkVert(7, 7)).toEqual 1

  describe '#checkDiag', ->
    it 'should return number of alive diagonal neighbors', ->
      expect(board.checkDiag(3, 4)).toEqual 0
      board.toggle(4, 5)
      expect(board.checkDiag(3, 4)).toEqual 1
      board.toggle(4, 3)
      expect(board.checkDiag(3, 4)).toEqual 2
      board.toggle(2, 3)
      expect(board.checkDiag(3, 4)).toEqual 3
      board.toggle(2, 5)
      expect(board.checkDiag(3, 4)).toEqual 4
      board.toggle(3, 3)
      expect(board.checkDiag(3, 4)).toEqual 4

  describe '#checkNeighbors', ->
    it 'should return number of alive neighbors in all adjacent cells', ->
      expect(board.checkNeighbors(3, 4)).toEqual 0
      board.toggle(4, 5)
      expect(board.checkNeighbors(3, 4)).toEqual 1
      board.toggle(4, 3)
      expect(board.checkNeighbors(3, 4)).toEqual 2
      board.toggle(2, 3)
      expect(board.checkNeighbors(3, 4)).toEqual 3
      board.toggle(2, 5)
      expect(board.checkNeighbors(3, 4)).toEqual 4
      board.toggle(3, 3)
      expect(board.checkNeighbors(3, 4)).toEqual 5
      board.toggle(4, 4)
      expect(board.checkNeighbors(3, 4)).toEqual 6

  describe '#cellWillLive', ->
    it 'should return false if alive and less than 2 neighbors', ->
      board.toggle(3, 4)
      expect(board.cellWillLive(3, 4)).toBe false
      board.toggle(3, 3)
      expect(board.cellWillLive(3, 4)).toBe false
    it 'should return true if alive and 2 or 3 neighbors', ->
      board.toggle(3, 3)
      board.toggle(4, 4)
      board.toggle(3, 4)
      expect(board.cellWillLive(3, 4)).toBe true
      board.toggle(2, 3)
      expect(board.cellWillLive(3, 4)).toBe true
    it 'should return false if alive and more than 3 neighbors', ->
      board.toggle(3, 3)
      board.toggle(4, 4)
      board.toggle(2, 3)
      board.toggle(3, 5)
      board.toggle(3, 4)
      expect(board.cellWillLive(3, 4)).toBe false
    it 'should return true if dead and exactly 3 neighbors', ->
      board.toggle(3, 3)
      board.toggle(4, 4)
      board.toggle(2, 3)
      expect(board.cellWillLive(3, 4)).toBe true