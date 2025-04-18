import gleam/io

type Cell {
  Dead,
  Alive
}

pub struct Game_Board{
  width: Int
  height: Int
  board: List(List(Cell))
}