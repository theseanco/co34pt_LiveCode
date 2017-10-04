import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sampler_sampler extends PApplet {

/*
Sampler-Sampler 1.0

Blackwok Stitching Emulator - processing sketch

See the README.md file of the master directory for more detailed information about the project

SETUP:

Switch between 'client' and 'host' mode using the variables before setup:
mode = "client"
or
mode = "host"

The IP address of the host can be changed by changing the hostIP variable

HOW TO USE:

When the sketch is started, keyboard keys are used to create blackwork stitches on the processing window. The keys used for movement are in a circle:

e = UP
c = DOWN
f = RIGHT
s = LEFT
w = UPLEFT
r = UPRIGHT
v = DOWNRIGHT
x = DOWNLEFT

There are also two modifier keys that can be used for creating alternate stitching patterns:

ALT + direction key = draw a long stitch, where a stitch will remain on the same 'side' of the canvas for a double distance

SHIFT + direction key = draw squares (UP, DOWN, LEFT, RIGHT) and crosses (UPLEFT, UPRIGHT, DOWNLEFT, DOWNRIGHT) in one button press. This speeds up the creation of patterns that may contain multiple complex units.

SONIFICATION & SAMPLING:

Note that this processing sketch is one half of Sampler-Sampler, which is designed to be run in tandem with the SuperCollider live coding microlanguage also in this repo. Please see the SuperCollider folder for instructions on how to use this.
*/



//import relevant OSC goodies


OscP5 oscP5;
NetAddress supercollider;

int needleColor;


//choose betweeen "client" or "host" here
String mode = "client";

Thread thread = new Thread();

String hostIP = "192.168.1.2";
int hostPort = 57120;

String clientIP = "127.0.0.1";
int clientPort = 57120;

int grid = 32;

public void setup() {

  frameRate(30);
  //size(1000, 1000);
  
  needleColor = color(5,255,255);
  //start relevant OSC goodies
  //starting reciever on port 12000
  oscP5 = new OscP5(this, 12000);
  //starting sender to sclang's default port
  if (mode == "client"){
  supercollider = new NetAddress(clientIP, clientPort);
  } else if (mode == "host"){
  supercollider = new NetAddress(hostIP, hostPort);
  }

  // draw plain background
  background(255);

  // set grid %
  scale(grid);

  // dot grid
  for (int i = 0; i <= width/grid; i ++) {
    for (int j = 0; j <= height/grid; j ++) {
      noStroke();
      fill(150);
      ellipse(i, j, 0.1f, 0.1f);
    }
  }
}

// draw method
public void draw() {
  background(255);

  scale(grid);       // set thread scale

  //draw grid
  for (int i = 0; i <= width/grid; i ++) {
    for (int j = 0; j <= height/grid; j ++) {
      noStroke();
      fill(150);
      ellipse(i, j, 0.1f, 0.1f);
      stroke(66, 244, 238);
    }
  }

  thread.draw();

}

// key press event
public void keyPressed(KeyEvent e) {
  if (e.getKey() == 'A') {undoStitch(grid);
  OscMessage stitchMsg = new OscMessage("/hostUndo");
  print("hkhhkhkhkjhjk");
  stitchMsg.add("UNDO STITCH");
  oscP5.send(stitchMsg, supercollider);
}
  thread.moveChar(key, e);
}

//function to clear screen and re-scale acording to set scaler
public void clearScreen(int scaler) {
  background(255);
  grid = scaler;
  scale(scaler);
  synchronized(thread.stitches) {
    thread.stitches.clear();
    for (int i = 0; i <= width/grid; i ++) {
      for (int j = 0; j <= height/grid; j ++) {
        noStroke();
        fill(150);
        ellipse(i, j, 0.1f, 0.1f);
      }
    }
  }
  OscMessage stitchMsg = new OscMessage("/screenCleared");
  stitchMsg.add("CLEAR!");
  oscP5.send(stitchMsg, supercollider);
}

//function to clear screen and re-scale acording to set scaler
//a separate function to work with SuperCollider function so as not to feed back.
public void clearScreenSC(int scaler) {
  background(255);
  grid = scaler;
  scale(scaler);
  synchronized(thread.stitches) {
    thread.stitches.clear();
    for (int i = 0; i <= width/grid; i ++) {
      for (int j = 0; j <= height/grid; j ++) {
        noStroke();
        fill(150);
        ellipse(i, j, 0.1f, 0.1f);
      }
    }
  }
}

public void mousePressed() {
  clearScreen(grid);
  OscMessage stitchMsg = new OscMessage("/hostClearArray");
  stitchMsg.add("CLEARING CURRENT PATTERN");
  oscP5.send(stitchMsg, supercollider);
}

// function to undo last stitch
public void undoStitch(int scaler) {
  background(255);
  grid = scaler;
  scale(scaler);
  synchronized(thread.stitches) {
    thread.stitches.remove(thread.stitches.size() - 1);
    for (int i = 0; i <= width/grid; i ++) {
      for (int j = 0; j <= height/grid; j ++) {
        noStroke();
        fill(150);
        ellipse(i, j, 0.1f, 0.1f);
      }
    }
  }
  OscMessage stitchMsg = new OscMessage("/undoStitch");
  stitchMsg.add("UNDO!");
  oscP5.send(stitchMsg, supercollider);
}

//function to undo last stitch and re-scale acording to set scaler
//a separate function to work with SuperCollider function so as not to feed back.
public void undoStitchSC(int scaler) {
  background(255);
  grid = scaler;
  scale(scaler);
  synchronized(thread.stitches) {
    thread.stitches.remove(thread.stitches.size() - 1);
    for (int i = 0; i <= width/grid; i ++) {
      for (int j = 0; j <= height/grid; j ++) {
        noStroke();
        fill(150);
        ellipse(i, j, 0.1f, 0.1f);
      }
    }
  }
}

//void undoKey() {
  //undoStitch(grid);
  //OscMessage stitchMsg = new OscMessage("/hostUndo");
  //stitchMsg.add("UNDO STITCH");
  //oscP5.send(stitchMsg, supercollider);
//}

//handler for OSC messages. will be used to recieve stitching information from SuperCollider
//it would be nice if this could take an array to do more complex modifiers
public void oscEvent(OscMessage theOscMessage) {
  //checks if the message is being recieved from SuperCollider using the address
  if (theOscMessage.checkAddrPattern("/stitchSC")==true) {



    //make an arrayList to hold the instructions to be sent to the stitch emulator
    ArrayList<String> instructions =   new ArrayList<String>();

    //Handler for STRINGS
    //if the typetag is a string, add the information to the first index of the arrayList
    //this could do with a regular expression to check that it only contains strings, but i cannot be bothered to write one right now
    //instead I will use the legnth of the typetag of the string


    //I NEED TO MAKE THIS SO THAT IT DOES NOT PASS SI AS ARGUMENT BECAUSE IT BREAKS
    if (theOscMessage.typetag().contains("ii") == true) {

      int[] direction = new int[2];
      //print("yay");

      //Direct assignment - inflexible
      //direction[0] = theOscMessage.get(0).intValue();
      //direction[1] = theOscMessage.get(1).intValue();

      //generate array containing direction and any modifiers based on the send OSC message
      for (int i = 0; i < theOscMessage.typetag().length(); i++) {
        direction[i] = theOscMessage.get(i).intValue();
      }

       //up
       if( direction[0] == 0 ) {
         if( direction[1] == 0){
           //up
           thread.up(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.up(2, 1);
         }
        }

        //upright
        if( direction[0] == 1 ) {
         if( direction[1] == 0){
           //up
           thread.upRight(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.upRight(2, 1);
         }
        }

        //right

         if( direction[0] == 2 ) {
         if( direction[1] == 0){
           //up
           thread.right(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.right(2, 1);
         }
        }


        //downright

         if( direction[0] == 3 ) {
         if( direction[1] == 0){
           //up
           thread.downRight(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.downRight(2, 1);
         }
        }


        //down

         if( direction[0] == 4 ) {
         if( direction[1] == 0){
           //up
           thread.down(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.down(2, 1);
         }
        }


        //downleft

         if( direction[0] == 5 ) {
         if( direction[1] == 0){
           //up
           thread.downLeft(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.downLeft(2, 1);
         }
        }


        //left

                if( direction[0] == 6 ) {
         if( direction[1] == 0){
           //up
           thread.left(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.left(2, 1);
         }
        }


        //upleft

        if( direction[0] == 7 ) {
         if( direction[1] == 0){
           //up
           thread.upLeft(1, 1);
         } else if ( direction [1] == 1 ){
           //uplong
           thread.upLeft(2, 1);
         }
        }






      //println(str(direction));

    }


      //old string detecting code
      /*
      for (int i = 0; i < theOscMessage.typetag().length(); i++) {

        //using the direction as a local variable so as not to compute it multiple times
         instructions.add(theOscMessage.get(i).stringValue());
         //check if the message contains relevant characters and send the relevant direction messages
         direction = instructions.get(i);

        direction = theOscMessage.get(i).stringValue();

        if ( direction.equals("UP") ) {
          thread.up(1, 1);
        }
        if ( direction.equals("DOWN") ) {
          thread.down(1, 1);
        }

        if ( direction.equals("LEFT") ) {
          thread.left(1, 1);
        }

        if ( direction.equals("RIGHT") ) {
          thread.right(1, 1);
        }

        if ( direction.equals("UPLEFT")) {
          thread.upLeft(1, 1);
        }

        if ( direction.equals("UPRIGHT")) {
          thread.upRight(1, 1);
        }

        if ( direction.equals("DOWNLEFT")) {
          thread.downLeft(1, 1);
        }

        if ( direction.equals("DOWNRIGHT")) {
          thread.downRight(1, 1);
        }

        if ( direction.equals("UPLONG") ) {
          thread.up(2, 1);
        }
        if ( direction.equals("DOWNLONG") ) {
          thread.down(2, 1);
        }

        if ( direction.equals("LEFTLONG") ) {
          thread.left(2, 1);
        }

        if ( direction.equals("RIGHTLONG") ) {
          thread.right(2, 1);
        }

        if ( direction.equals("UPLEFTLONG")) {
          thread.upLeft(2, 1);
        }

        if ( direction.equals("UPRIGHTLONG")) {
          thread.upRight(2, 1);
        }

        if ( direction.equals("DOWNLEFTLONG")) {
          thread.downLeft(2, 1);
        }

        if ( direction.equals("DOWNRIGHTLONG")) {
          thread.downRight(2, 1);
        }
      }
    }

    */

    if (theOscMessage.typetag().contains("si")) {
      if (theOscMessage.get(0).stringValue().equals("CLEAR")) {
        int size = theOscMessage.get(1).intValue();
        //sends to SuperCollider version to avoid feedback
        clearScreenSC(size);
      }
    }
  }
}
class Stitch {                // stitch object class with two variables
  int x;                      // use thread class to create instances of object
  int y;
}
  class Thread {                                              // create new class

  ArrayList<Stitch> stitches = new ArrayList<Stitch>();      // Declaring the ArrayList, note the use of the syntax "<Stitch>" to indicate our intention to fill this ArrayList with Stitch objects


  public boolean isEven () {
    return (stitches.size()%2 == 0);        //Odd/Even - sets stitch length
  }

  int xlog;
  int ylog;

  public void move (int x, int y) {            // method for creating object

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
  public void up(int n, int inputType) {          //  UP = 'e'
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

  public void upRight(int n, int inputType) {      //  UP+RIGHT = 'r'
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

      public void right(int n, int inputType) {       //  RIGHT = 'f'
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

  public void downRight(int n, int inputType) {   //  DOWN+RIGHT = 'v'
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



  public void down(int n, int inputType) {        //  DOWN = 'c'
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

    public void downLeft(int n, int inputType) {    //  DOWN+LEFT = 'x'
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


  public void left(int n, int inputType) {        //  LEFT = 's'
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

    public void upLeft(int n, int inputType) {      //  UP+LEFT = 'w'
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

    public void moveChar(char c, KeyEvent e) {    // Declare variable 'c' of type character
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

    public void draw() {
      boolean up = true;  // is this a top thread?
      int x = (width/grid)/2;                                // declare & set x pos
      int y = (height/grid)/2;                                // declare & set y pos
      int newX = 0;
      int newY = 0;
      strokeWeight(0.1f);                        // set stroke weight
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
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sampler_sampler" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
