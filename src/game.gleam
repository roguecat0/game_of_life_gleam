import game_board.{type Cell, Alive, Dead}
import gleam/io

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

pub fn main() {
  let alive = Alive
  print_cel(alive)
}
