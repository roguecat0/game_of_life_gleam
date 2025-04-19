import game
import game_board.{type GameBoard, Alive, Dead, GameBoard}
import gleam/erlang/process
import gleam/io
import ui

pub fn main() {
  io.println("Hello from gol_tty_ui!")
  // game.init_game_board(5, 5)
  // |> ui.draw()
  // |> loop()
  GameBoard(10, 12, [
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Alive, Alive, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Alive, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Alive, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Alive, Alive, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
    [Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead, Dead],
  ])
  |> ui.draw()
  |> loop()
}

pub fn loop(gb: GameBoard) {
  process.sleep(500)
  game.update(gb)
  |> loop()
}
