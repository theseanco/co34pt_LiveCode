  class Thread {                                              // create new class

  ArrayList<Stitch> stitches = new ArrayList<Stitch>();      // Declaring the ArrayList, note the use of the syntax "<Stitch>" to indicate our intention to fill this ArrayList with Stitch objects


  boolean isEven () {
    return (stitches.size()%2 == 0);        //Odd/Even - sets stitch length
  }

  int xlog;
  int ylog;

  void move (int x, int y) {            // method for creating object

    Stitch stitch = new Stitch();      // declare & construct new object
    stitch.x = x;                      // set object variable x
    stitch.y = y;                      // set object variable y
    stitches.add(stitch);              // Objects can be added to an ArrayList with add()
  }

  // thread dirction method
  // first input controls the movement speed, second input controls the type of OSCMessage sent to SuperCollider (Keyboard vs Sequenced input)
  // if movement is 1, send normal string, if movement is 2, send a string to dictate a longer movement. This handles 'ALT' presses

  // These directions are now integers. 0-7 with a second entry of 0 is normal directions, and a second entry of 1 is a long direction
  // They have been re-arranged clockwise
  void up(int n, int inputType) {          //  UP = 'e'
    synchronized(stitches) {
      move(0, 0-n);
      if ( n == 1) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(0);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(0);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        }
        //send message for long stitches
      } else if (n == 2 ) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(0);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(0);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        }
      }
    }
  }

  void upRight(int n, int inputType) {      //  UP+RIGHT = 'r'
      synchronized(stitches) {
        move(n, 0-n);
        if ( n == 1) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(1);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(1);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          }
        } else if ( n == 2 ) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(1);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(1);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          }
        }
      }
    }

      void right(int n, int inputType) {       //  RIGHT = 'f'
    synchronized(stitches) {
      move(n, 0);
      if ( n == 1) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(2);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(2);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        }
      } else if ( n == 2 ) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(2);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(2);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        }
      }
    }
  }

  void downRight(int n, int inputType) {   //  DOWN+RIGHT = 'v'
      synchronized(stitches) {
        move(n, n);
        if ( n == 1 ) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(3);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(3);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          }
        } else if ( n == 2 ) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(3);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(3);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          }
        }
      }
    }



  void down(int n, int inputType) {        //  DOWN = 'c'
    synchronized(stitches) {
      move(0, n);
      if ( n == 1 ) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(4);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(4);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        }
      } else if ( n == 2 ) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(4);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(4);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        }
      }
    }
  }

    void downLeft(int n, int inputType) {    //  DOWN+LEFT = 'x'
      synchronized(stitches) {
        move(0-n, n);
        if ( n == 1) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(5);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(5);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          }
        } else if ( n == 2 ) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(5);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(5);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          }
        }
      }
    }


  void left(int n, int inputType) {        //  LEFT = 's'
    synchronized(stitches) {
      move(0-n, 0);
      if (n == 1) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(6);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(6);
          stitchMsg.add(0);
          oscP5.send(stitchMsg, supercollider);
        }
      } else if (n == 2) {
        if (inputType == 0) {
          //send relevant OSC message to SuperCollider
          OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
          stitchMsg.add(6);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        } else if (inputType == 1) {
          OscMessage stitchMsg = new OscMessage("/stitchSampler");
          stitchMsg.add(6);
          stitchMsg.add(1);
          oscP5.send(stitchMsg, supercollider);
        }
      }
    }
  }

    void upLeft(int n, int inputType) {      //  UP+LEFT = 'w'
      synchronized(stitches) {
        move(0-n, 0-n);
        if ( n == 1) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(7);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(7);
            stitchMsg.add(0);
            oscP5.send(stitchMsg, supercollider);
          }
        } else if ( n == 2) {
          if (inputType == 0) {
            //send relevant OSC message to SuperCollider
            OscMessage stitchMsg = new OscMessage("/stitchKeyboard");
            stitchMsg.add(7);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          } else if (inputType == 1) {
            OscMessage stitchMsg = new OscMessage("/stitchSampler");
            stitchMsg.add(7);
            stitchMsg.add(1);
            oscP5.send(stitchMsg, supercollider);
          }
        }
      }
    }




    // direction control keys function

    void moveChar(char c, KeyEvent e) {    // Declare variable 'c' of type character
      //synchronize messages to avoid ConcurrentModificationError
      synchronized(stitches) {
        if (c == 'e') {          // UP = 'e'
          up(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 'c') {    //  DOWN = 'c'
          down(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 's') {    //  LEFT = 's'
          left(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 'f') {    //  RIGHT = 'f'
          right(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 'w') {    //  UP+LEFT = 'w'
          upLeft(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 'r') {    //  UP+RIGHT = 'r'
          upRight(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 'v') {    //  DOWN+RIGHT = 'v'
          downRight(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 'x') {    //  DOWN+LEFT = 'x'
          downLeft(e.isAltDown() ? 2 : 1, 0);
        } else if (c == 'a') {
          //SEND MESSAGE FOR SUPERCOLLIDER TO SAVE PATTERN
          OscMessage stitchMsg = new OscMessage("/hostSave");
          stitchMsg.add("SAVING CURRENT PATTERN:");
          oscP5.send(stitchMsg, supercollider);
        }

        //SQUARES

        else if (c == 'F') {   // DRAW SQUARE TOP RIGHT
          up(1, 0);
          right(1, 0);
          down(1, 0);
          left(1, 0);
          right(1, 0);
          up(1, 0);
          left(1, 0);
          down(1, 0);
        } else if (c == 'C') {      // DRAW SQUARE DOWN RIGHT
          down(1, 0);
          right(1, 0);
          up(1, 0);
          left(1, 0);
          right(1, 0);
          down(1, 0);
          left(1, 0);
          up(1, 0);
        } else if (c == 'S') {   // DRAW SQAURE DOWN LEFT
          down(1, 0);
          left(1, 0);
          up(1, 0);
          right(1, 0);
          left(1, 0);
          down(1, 0);
          right(1, 0);
          up(1, 0);
        } else if (c == 'E') {     // DRAW SQUARE UP LEFT
          up(1, 0);
          left(1, 0);
          down(1, 0);
          right(1, 0);
          left(1, 0);
          up(1, 0);
          right(1, 0);
          down(1, 0);
        }

        // CROSSES

        else if (c == 'R') {            // CROSS TOP RIGHT
          if (isEven() == false) {
            right(1, 0);
            upLeft(1, 0);
            right(1, 0);
            downLeft(1, 0);
          } else {
            upRight(1, 0);
            left(1, 0);
            downRight(1, 0);
            left(1, 0);
          }
        } else if (c == 'V') {                  // CROSS BOTTOM RIGHT
          if (isEven() == false) {
            right(1, 0);
            downLeft(1, 0);
            right(1, 0);
            upLeft(1, 0);
          } else {
            downRight(1, 0);
            left(1, 0);
            upRight(1, 0);
            left(1, 0);
          }
        } else if (c == 'X') {                  // CROSS BOTTOM LEFT
          if (isEven() == false) {
            left(1, 0);
            downRight(1, 0);
            left(1, 0);
            upRight(1, 0);
          } else {
            downLeft(1, 0);
            right(1, 0);
            upLeft(1, 0);
            right(1, 0);
          }
        } else if (c == 'W') {                  // CROSS TOP LEFT
          if (isEven() == false) {
            left(1, 0);
            upRight(1, 0);
            left(1, 0);
            downRight(1, 0);
          } else {
            upLeft(1, 0);
            right(1, 0);
            downLeft(1, 0);
            right(1, 0);
          }
        }
      }
    }


    // draw thread function
    int i;

    void draw() {
      boolean up = true;  // is this a top thread?
      int x = (width/grid)/2;                                // declare & set x pos
      int y = (height/grid)/2;                                // declare & set y pos
      int newX = 0;
      int newY = 0;
      strokeWeight(0.1);                        // set stroke weight
      synchronized(stitches) {
        for (Stitch stitch : stitches) {           // for loop - for (init; test; update) - calling from stitch array
          stroke(0, 0, 0);                    // covers old needle position
          point(x, y);
          newX = x + stitch.x;                // decaler var newX (line endpoint) x pos + values from move function (see stitch object arguments)
          newY = y + stitch.y;                // decaler var newY (line endpoint) y pos + values from move function (see stitch object arguments)
          stroke(up ? color(0, 250) : color(200, 80));     // set stroke colour depending on boolean up true/false
          // result = test ? expression1 : expression2
          // is equivalent to this structure:
          /*  if (test) {
           result = expression1
           } else {
           result = expression2
           }                          */
          line(x, y, newX, newY);                  // draw stitch
          x = newX;                                // makes stitch end start point x for next stitch
          y = newY;                                 // makes stitch end start point x for next stitch
          stroke(needleColor);                     // set needle colour
          point(x, y);                             // needle position
          up = ! up;// makes boolean up opposite for next stitch
        }
      }
      if (newX < 0 || newX > width/grid) {
        clearScreen(grid);
      }
      if (newY < 0 || newY > height/grid) {
        clearScreen(grid);
      }
    }
  }