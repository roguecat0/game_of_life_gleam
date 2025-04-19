import game_board.{type Cell, type GameBoard, Alive, Dead}
import gleam/list
import gleam/result

pub fn num_alive_neighbours(block: List(List(Cell))) {
  list.flatten(block)
  |> fn(res) { list.split(res, list.length(res) / 2) }
  |> fn(x) { list.append({ x.0 }, list.drop({ x.1 }, 1)) }
  |> list.count(fn(elem) { elem == Alive })
}

pub fn current_state(block: List(List(Cell))) {
  list.flatten(block)
  |> list.drop(4)
  |> list.first
  |> result.unwrap(Dead)
}

pub fn new_state(block: List(List(Cell))) {
  case num_alive_neighbours(block) {
    3 -> Alive
    2 -> current_state(block)
    n if n <= 1 -> Dead
    n if n >= 4 -> Dead
    _ -> Dead
  }
}

pub fn list_of_blocks(gb: GameBoard) {
  list.fold(gb.board, [], fn(agg, x) { list.append(agg, list.window(x, 3)) })
}

pub fn main() {
  [1, 2, 3, 4, 5]
  |> fn(res) { list.split(res, list.length(res) / 2) }
  |> echo
  |> fn(x) { list.append({ x.0 }, list.drop({ x.1 }, 1)) }
  |> echo
}
