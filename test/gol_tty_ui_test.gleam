import game
import game_board.{type Cell, Alive, Dead}
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  1
  |> should.equal(1)
}

pub fn game_board_test() {
  should.equal(game.alive(), Alive)
  should.equal(game.dead(), Dead)
}
