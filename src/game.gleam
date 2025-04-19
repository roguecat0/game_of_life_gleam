import game_board.{type Cell, type GameBoard, Alive, Dead, GameBoard, None}
import gleam/bool
import gleam/io
import gleam/list.{map, range}
import gleam/result
import ui

pub fn update(gb: GameBoard) {
  new_board(gb)
  |> ui.update()
}

pub fn new_board(gb: GameBoard) -> GameBoard {
  let new_board =
    add_paddign(gb).board
    |> list_to_3x3s()
    |> map(fn(list) { map(list, fn(s3b3) { new_state(s3b3) }) })

  GameBoard(..gb, board: new_board)
}

pub fn new_state(block: List(List(Cell))) {
  let current_state =
    list.flatten(block)
    |> list.drop(4)
    |> list.first
    |> result.unwrap(Dead)

  let neighbours =
    list.flatten(block)
    |> list.fold(0, fn(count, elem) {
      count
      + case elem {
        Alive -> 1
        _ -> 0
      }
    })
    |> fn(n) {
      n
      - case current_state {
        Alive -> 1
        _ -> 0
      }
    }

  case neighbours {
    3 -> Alive
    2 -> current_state
    n if n <= 1 -> Dead
    n if n >= 4 -> Dead
    _ -> Dead
  }
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
    range(0, gb.height + 1)
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

fn print_2d_list(l2: List(List(value))) {
  list.each(l2, fn(l) {
    echo l
    io.println("")
  })
}

pub fn main() {
  echo range(0, 1)
  let gb = init_game_board(1, 1)
  echo gb
  let gb2 = add_paddign(gb)
  echo print_2d_list(gb2.board)
  let gb3 = remove_padding(gb2)
  echo print_2d_list(gb3.board)
  let gb = init_game_board(2, 2)
  echo print_2d_list(gb.board)
  let gb2 = add_paddign(gb)
  echo print_2d_list(gb2.board)
  let gb3 = list_to_3x3s(gb2.board)
  echo gb3
}
