import game_board.{type GameBoard, Alive, Dead, None}
import gleam/io
import gleam/list

pub fn draw(gb: GameBoard) {
  list.map(gb.board, fn(x) {
    list.map(x, fn(y) {
      case y {
        Dead -> io.print(".")
        Alive -> io.print("#")
        None -> io.print(" ")
      }
    })
    io.print("\n")
  })
  gb
}

pub fn update(gb: GameBoard) {
  list.map(list.range(1, gb.height), fn(x) {
    io.print("\u{1B}[1A")
    io.print("\u{1B}[2K")
  })
  draw(gb)
}
