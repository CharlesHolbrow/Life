describe 'board', ->
  board = null

  beforeEach ->
    board = new Board(8)

  it 'should initialize a cells array of size n', ->
    expect(board.get('cells').length).toEqual 8
