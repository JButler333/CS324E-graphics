
class Board {
  Block[][] gameBoard = {{null,null,null,null},{null,null,null,null},{null,null,null,null},{null,null,null,null}};;
  ArrayList<Block> unusedBlocks = new ArrayList<Block>();
  
  Board(){
    for (int b = 1; b <= 16; b++){
      int value = (1 +int(random(2))) * 2;
      unusedBlocks.add(new Block(0, 0, value)); 
    }
    gameBoard[int(random(4))][int(random(4))] = unusedBlocks.get(0);
    unusedBlocks.remove(0);
  }
  
  void up(){
    for (int i = 0; i < 4; i++){
      for (int j = 0; j <4; j++) {
        for (int k = 3; k > 0; k--){
          if (gameBoard[j][k] != null) {
            if (gameBoard[j][k-1] == null) {
              gameBoard[j][k-1] = gameBoard[j][k];
              gameBoard[j][k] = null;
            } else if (gameBoard[j][k].value == gameBoard[j][k-1].value) {
              merge(gameBoard[j][k],j, k, gameBoard[j][k-1], j, k-1);
            }
          }
        }
      }
    }
  }
  
  void down() {
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++) {
        for (int k = 0; k < 3; k++){
          if (gameBoard[j][k] != null) {
            if (gameBoard[j][k+1] == null) {
              gameBoard[j][k+1] = gameBoard[j][k];
              gameBoard[j][k] = null;
            } else if (gameBoard[j][k].value == gameBoard[j][k+1].value) {
              merge(gameBoard[j][k],j, k, gameBoard[j][k+1], j, k+1);
            }
          }
        }
      }
    }
  }
  
  void right() {
    for (int i = 0; i < 4; i++){
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 4; k++){
          if (gameBoard[j][k] != null) {
            if (gameBoard[j+1][k] == null) {
              gameBoard[j+1][k] = gameBoard[j][k];
              gameBoard[j][k] = null;
            } else if (gameBoard[j][k].value == gameBoard[j+1][k].value) {
              merge(gameBoard[j][k],j, k, gameBoard[j+1][k], j+1, k);
            }
          }
        }
      }
    }
  }
  
  
  void left() {
   for (int i = 0; i < 4; i++){
      for (int j = 3; j > 0; j--) {
        for (int k = 0; k < 4; k++){
          if (gameBoard[j][k] != null) {
            if (gameBoard[j-1][k] == null) {
              gameBoard[j-1][k] = gameBoard[j][k];
              gameBoard[j][k] = null;
            } else if (gameBoard[j][k].value == gameBoard[j-1][k].value) {
              merge(gameBoard[j][k],j, k, gameBoard[j-1][k], j-1, k);
            }
          }
        }
      }
    }
  } 
  
  
  void newBlock() {
    boolean flag = false;
    if (unusedBlocks.size() != 0) {
      while (!flag){
        int x = int(random(4));
        int y = int(random(4));
        if (gameBoard[x][y] == null){
          gameBoard[x][y]  = unusedBlocks.get(0);
          unusedBlocks.remove(0);
          flag = true;
          }
      }
    } else {
      lost();
    }
  }
  
  
  void lost() {
    //test neighbors values for a match
  }
  
  void merge(Block del, int x1, int y1, Block add, int x2, int y2) {
    gameBoard[x1][y1].value = 2;
    unusedBlocks.add(gameBoard[x1][y1]);
    gameBoard[x1][y1] = null;
    gameBoard[x2][y2].value = gameBoard[x2][y2].value*2;
  }
  
  void display() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (gameBoard[i][j] != null) {
          gameBoard[i][j].x = 20+120*i;
          gameBoard[i][j].y = 20+120*j;
          gameBoard[i][j].display();
        }
        else {
          fill(100);
          rect(20+120*i,20+120*j,100,100);
        }
      }
    }
  }
}
