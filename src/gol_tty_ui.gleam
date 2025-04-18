import game
import gleam/io
import ui

pub fn main() {
  io.println("Hello from gol_tty_ui!")
  ui.draw()
  game.update()
}
