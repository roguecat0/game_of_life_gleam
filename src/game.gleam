import game_board.{type Cell, type GameBoard, Alive, Dead, GameBoard, None}
import gleam/io
import gleam/list.{map, range}
import gleam/result

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

pub fn add_paddign(gb: GameBoard) -> GameBoard {
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

pub fn remove_padding(gb: GameBoard) -> GameBoard {
  let board =
    remove_first_and_last(gb.board)
    |> map(fn(row) { remove_first_and_last(row) })
  GameBoard(..gb, board: board)
}

pub fn remove_first_and_last(l: List(value)) -> List(value) {
  list.drop(l, 1)
  |> list.reverse
  |> list.drop(1)
}

pub fn list_to_3x3s(
  list_nxn: List(List(value)),
) -> List(List(List(List(value)))) {
  list.window(list_nxn, 3)
  |> map(fn(list_3xn) {
    list.transpose(list_3xn)
    |> list.window(3)
    |> list.transpose
  })
}

fn get_center_square(tbt: List(List(value))) -> value {
  get_center_list3(tbt) |> get_center_list3
}

fn get_center_list3(l: List(value)) -> value {
  case l {
    [_, val, _] -> val
    _ -> panic as "not a 3x3"
  }
}

pub fn main() {
  echo range(0, 1)
  let gb = init_game_board(1, 1)
  echo gb
  let gb2 = add_paddign(gb)
  echo gb2
  let gb3 = remove_padding(gb2)
  echo gb3
  let gb = init_game_board(2, 2)
  echo gb
  let gb2 = add_paddign(gb)
  echo gb2
  let gb3 = list_to_3x3s(gb2.board)
  echo gb3
}
