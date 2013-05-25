describe 'board', ->
  board = null

  beforeEach ->
    board = new Board(8)

  it 'should initialize a cells array of size n', ->
    expect(board.get('cells').length).toEqual 8

  describe '#getCellState', ->
    it 'return the value of a cell', ->
      expect(board.getCellState(2, 3)).toEqual 0

  describe '#toggle', ->
    it 'should toggle a cells state between 0 and 1', ->
      expect(board.getCellState(2, 3)).toEqual 0
      board.toggle 2, 3
      expect(board.getCellState(2, 3)).toEqual 1
