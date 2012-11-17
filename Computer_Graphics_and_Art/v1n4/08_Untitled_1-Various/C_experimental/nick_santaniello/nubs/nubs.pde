int cols = 11;
int rows = 10;
int frmRate =60;
int updateCounter =0 ;
int sqSize= 100;
int sizeDifference = 17;
Nub[] nubs;

void setup() {
  size(1000, 950);

  rectMode(CENTER);
  strokeWeight(2);
  fill(240);
  nubs = new Nub[110];
  for (int i=0; i<110; i++) {
    Nub newNub = new Nub();
    nubs[i] = newNub;
  }

  //for every row...
  for (int r = 0; r<rows; r++) {
    //for every column...
    for (int c = 0; c<cols; c++) {
      // set the beginning position of each Nub.
      nubs[r*c].update();
    }
  }
}

void draw() {
  for (int r = 0; r<rows; r++) {
    //for every column...
    for (int c = 0; c<cols; c++) {
      //move each Nub to their target offset.
      int currentNub = 10*r + 1*c;
      int row = r;
      int col = c;

      // Ugh, what a hack. Must go back and fix this later.
      if (r == 0) {
        row = 5;
      }
      if (c == 0) {
        col = 3;
      }

      nubs[row*col].run(r, c);
    }
  }

  //increase the frame count 
  updateCounter ++;

  //every X frames, update the Nubs' target offsets.
  if (updateCounter > frmRate) {
    update();
    //reset the update counter
    updateCounter = 0;
  }
}

void update() {
  saveFrame("nubs.jpg");
  for (int i=0; i<110; i++) {
    nubs[i].update();
  }
}

