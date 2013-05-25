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
