import gleam/io

pub type Cell {
  Dead
  Alive
}

pub type Game_Board{
  Game_Board(
    width: Int,
    height: Int,
    board: List(List(Cell))
  )
}