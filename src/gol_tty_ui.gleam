import game
import gleam/erlang/process
import gleam/io
import ui

pub fn main() {
  io.println("Hello from gol_tty_ui!")
  ui.test_print()
  loop()
}

pub fn loop() {
  process.sleep(500)
  game.update()
  loop()
}
