import java.util.ArrayList;
Board board;

void setup() {
  size(500,600);
  board = new Board();
}

void draw() {
 board.display();
}


void keyPressed() {
  if (keyCode == UP){
    board.up();
    board.newBlock();
  } else if (keyCode == DOWN) {
    board.down();
    board.newBlock();
  } else if (keyCode == LEFT) {
    board.left();
    board.newBlock();
  } else if (keyCode == RIGHT) {
    board.right();
    board.newBlock();
  }
  
}
