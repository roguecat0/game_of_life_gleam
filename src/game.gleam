import game_board.{type Cell, type GameBoard, Alive, Dead, GameBoard, None}
import gleam/io
import gleam/list.{map, range}

pub fn update() {
  io.println("update")
}

pub fn print_cel(hello: Cell) {
  echo hello
}

pub fn alive() -> Cell {
  Alive
}

pub fn dead() -> Cell {
  Dead
}

pub fn init_game_board(width: Int, height: Int) -> GameBoard {
  GameBoard(
    width: width,
    height: height,
    board: range(0, height)
      |> map(fn(_) { range(0, width) |> map(fn(_) { Dead }) }),
  )
}

pub fn add_paddign(gb: GameBoard) -> game_board.GameBoard {
  let padding_x = range(0, gb.height + 2)
  //   |> list.map(fn(_) { None })
  // let gb = gb.map(fn(c) { todo })
  todo
  // append(l1, l2) -> l3
}

pub fn main() {
  let alive = Alive
  print_cel(alive)
}
