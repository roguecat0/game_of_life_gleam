import game_board.{type Cell, type GameBoard, Alive, Dead, None}
import gleam/list
import gleam/result

pub fn new_state(block: List(List(Cell))) {
  let current_state =
    list.drop(list.flatten(block), 4)
    |> list.first
    |> fn(res) { result.unwrap(res, Dead) }

  let neighbours =
    list.fold(list.flatten(block), 0, fn(count, elem) {
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

pub fn list_of_blocks(gb: GameBoard) {
  list.fold(gb.board, [], fn(agg, x) { list.append(agg, list.window(x, 3)) })
}
