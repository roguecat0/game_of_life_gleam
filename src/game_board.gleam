import gleam/io

pub type Cell {
  Dead
  Alive
}

pub type GameBoard{
  GameBoard(
    width: Int,
    height: Int,
    board: List(List(Cell))
  )
}