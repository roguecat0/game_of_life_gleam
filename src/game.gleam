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
    board: range(0, height - 1)
      |> map(fn(_) { range(0, width - 1) |> map(fn(_) { Dead }) }),
  )
}

pub fn add_paddign(gb: GameBoard) -> game_board.GameBoard {
  let padding_x =
    range(0, gb.height + 2)
    |> map(fn(_) { None })
  let board2 =
    map(gb.board, fn(c) { list.prepend(c, None) |> list.append([None]) })
    |> list.prepend(padding_x)
    |> list.append([padding_x])
  GameBoard(..gb, board: board2)
  // append(l1, l2) -> l3
}

pub fn main() {
  echo range(0, 1)
  let gb = init_game_board(1, 1)
  echo gb
  let gb2 = add_paddign(gb)
  echo gb2
}
