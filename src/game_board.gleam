pub type Cell {
  Dead
  Alive
  None
}

pub type GameBoard {
  GameBoard(width: Int, height: Int, board: List(List(Cell)))
}
