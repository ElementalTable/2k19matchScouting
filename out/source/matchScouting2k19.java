import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class matchScouting2k19 extends PApplet {


//import interfascia.*;
ControlP5 cp5;

//Color Pallett
   //#059100 Islamic Green (main accent)
   //#000000 Registration Black (text color/base color)
   //#990000 USC Cardnial (Unactivated Buttons)
   //#16302B Medium Jungle Green (Activated Buttions)
   //#28061C Eerie Black (Unactivated Button )
   //#FFFFFF White (text color/base color)

//Color Vars  
   int is = 5; int gre = 145; int en = 0;
   int reBlack = 0;
   int usc = 153; int ca = 0; int rd = 0;
   int mi = 22; int dGre = 48; int enn = 43;
   int eeB = 40; int la = 6; int ck = 28;
   int white = 0;

//Location Vars
   int xLocation = 100;
   int yLocation = 100;
   int xSpacing = 100;
   int ySpacing = 30;
   int sizeing = 100;
   int sizeingPt2 = 20;
   int fontSize = 24;
/*GUIController c;
   IFRadioController rc;
   IFProgressBar test;
   IFLookAndFeel look;
   IFRadioButton b1, b2, b3, b4;
   IFCheckBox c1, c2, c3, c4;
   IFButton d1;*/  

String textValue = "";
   Textfield myTextfield;
   CheckBox helloBox;

public void setup () {
   B b = new B();
   
   PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
      ControlFont font = new ControlFont(pfont,241);

   //c = new GUIController(this);
      //rc = new IFRadioController("Mode Selector");
      //b1 = new IFRadioButton("Reality Distortion Field", 20, 20, rc);
      //b2 = new IFRadioButton("Infinite Improbability Drive", 20, 40, rc);
      //b3 = new IFRadioButton("Bistromathic Drive", 20, 60, rc);
      //b4 = new IFRadioButton("new radio button", 20, 80, rc);
      //test = new IFProgressBar (400, 72, 70);
      //c1 = new IFCheckBox("Test", 200, 20);
      //c2 = new IFCheckBox("Test2", 200, 40);
      //c3 = new IFCheckBox("Test3", 200, 60);
      //c4 = new IFCheckBox("Test4", 200, 80);
      //d1 = new IFButton("this is a button", 200, 100);
  
   cp5 = new ControlP5 (this);

   ControlFont cf1 = new ControlFont(createFont("Arial",20));
   

   cp5.getTab("default").setColorBackground(color(eeB, la, ck));
   cp5.getTab("default")
      .activateEvent(true)
      .setLabel("Welcome")
      .setColorActive(color(is, gre, en))
      //.setColor(color(eeB, la, ck))
      .setSize(sizeing * 2, sizeingPt2)
      .setHeight(sizeingPt2 *2)
      .getCaptionLabel()
      .setFont(font)
      .setSize(fontSize)
      .toUpperCase(false)
      //.getColor()
      //.setColor(color(eeB, la, ck))
      ;

   cp5.getTab("sandstorm")
      .activateEvent(true)
      .setLabel("Sandstorm")
      .setColorActive(color(is, gre, en))
      //.setColor(color(eeB, la, ck))
      .setSize(sizeing * 2,sizeingPt2)
      .setHeight(sizeingPt2*2)
      .getCaptionLabel()
      .setFont(font)
      .setSize(fontSize)
      .toUpperCase(false)
      ;
    
     
   cp5.getTab("teleop") 
      .activateEvent(true)
      .setLabel("Teleop")
      .setColorActive(color(is, gre, en))
      //.setColor(color(eeB, la, ck))
      .setSize(sizeing * 2,sizeingPt2)
      .setHeight(sizeingPt2*2)
      .getCaptionLabel()
      .setFont(font)
      .setSize(fontSize)
      .toUpperCase(false)
      ;

   cp5.getTab("postGame")
      .activateEvent(true)
      .setLabel("Post Game")
      .setColorActive(color(is, gre, en))
      //.setColor(color(eeB, la, ck))
      .setSize(sizeing * 2,sizeingPt2)
      .setHeight(sizeingPt2*2)
      .getCaptionLabel()
      .setFont(font)
      .setSize(fontSize)
      .toUpperCase(false) //they are good at _____ they struggle with ___ they can't do ______
      ;
   cp5.getTab("settings")
      .activateEvent(true)
      .setLabel("Settings")
      .setColorActive(color(is, gre, en))
      //.setColor(color(eeB, la, ck))
      .setSize(sizeing * 2,sizeingPt2)
      .setHeight(sizeingPt2*2)
      .getCaptionLabel()
      .setFont(font)
      .setSize(fontSize)
      .toUpperCase(false)
   ;

   cp5.addListener(b);

   cp5.addCheckBox("rocketCargo")
      .setPosition(xLocation, yLocation*2)
      .setSize(sizeingPt2, sizeingPt2)
      .setItemsPerRow(2)
      .setSpacingColumn(ySpacing)
      .setSpacingRow(xSpacing/5)
      .activateEvent(true)
      .setColorActive(color(usc, ca,rd))
      .addItem("stormCargoHigh",1)
      .addItem("stormCargoHigh1",2)
      .addItem("stormCargoMid",3)
      .addItem("stormCargoMid1",4)
      .addItem("rocketStormCargoLow",5)
      .addItem("rocketStormCargoLow1",6)
      .hideLabels()
      ;

   cp5.addCheckBox("rocketHatch")
      .setPosition(xLocation/2, yLocation*2)
      .setSize(sizeingPt2, sizeingPt2)
      .setItemsPerRow(2)
      .setSpacingColumn(xSpacing+(xSpacing/5))
      .setSpacingRow(ySpacing)
      .activateEvent(true)
      .setColorActive(color(usc, ca, rd))
      .addItem("stormHatchHigh",1)
      .addItem("stormHatchHigh1",2)
      .addItem("stormHatchMid",3)
      .addItem("stormHatchMid1",4)
      .addItem("rocketHatchCargoLow",5)
      .addItem("rocketHatchCargoLow1",6)
      .hideLabels()
      ;
      //cp5.getGroup("stormCargoHigh").setValue(1);
      //cp5.getGroup("stormCargoMid").setValue(2);
      //cp5.getGroup("rocketStormCargoLow").setValue(3);
   
   //look = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
      //look.baseColor = color(18,255,3);
      // look.highlightColor = color (18, 255, 3);
      //c.add(b1);
      //c.add(b2);
      //c.add(b3);
      //c.add(b4);
      //c.add(test);
      //c.add(c1);
      //c.add(c2);
      //c.add(c3);
      //c.add(c4);
      //c.add(d1);
      //c.setLookAndFeel(look);
  
  

   cp5.addToggle("darkMode",false)
      .setLabel("Dark Mode")
      .setColorActive(color(usc, ca, rd))
      .setPosition(xLocation,yLocation)
      .setSize(sizeing*2,sizeingPt2*2)
      .setValue(0)
      .getCaptionLabel()
      .align(CENTER,CENTER)
      .toUpperCase(false)
      .setFont(pfont)
      .setSize(fontSize)
      ;
   /* 
   cp5.addButton("buttonValue")
      .setBroadcast(false)
      .setPosition(220,100)
      .setSize(80,40)
      .setValue(2)
      .setBroadcast(true)
      .getCaptionLabel().align(CENTER,CENTER)
      ;
  
   cp5.addSlider("slider")
      .setBroadcast(false)
      .setRange(100,200)
      .setValue(128)
      .setPosition(100,160)
      .setSize(200,20)
      .setBroadcast(true)
      ;
     
   cp5.addSlider("sliderValue")
      .setBroadcast(false)
      .setRange(0,255)
      .setValue(128)
      .setPosition(100,200)
      .setSize(200,20)
      .setBroadcast(true)
      ;
   */
   myTextfield = cp5.addTextfield("textinput")
      .setPosition(xLocation, yLocation*2)
      .setSize(sizeing*2, sizeingPt2)
      .setFocus(true)
      ;

   cp5.addTextfield("textValue")
      .setPosition(xLocation, yLocation*3)
      .setSize(sizeing*2, sizeingPt2)
      ;
   myTextfield.setAutoClear(true).keepFocus(true);

   cp5.addButton("clear", 0, 20, 200, 70, 20);
      cp5.addButton("submit", 0, 310, 200, 60, 20);
      cp5.addButton("performTextfieldActions", 0, 20, 100, 150, 20);
      cp5.addToggle("toggleAutoClear", true, 180, 100, 90, 20).setCaptionLabel("Auto Clear");
      cp5.addToggle("toggleKeepFocus", true, 280, 100, 90, 20).setCaptionLabel("Keep Focus");

   //cp5.getController("sliderValue").moveTo("sneeze");
   //cp5.getController("slider").moveTo("sneeze");
   //cp5.getController("button").moveTo("sneeze");
   //cp5.getController("buttonValue").moveTo("sneeze");
   cp5.getController("textinput").moveTo("postGame");
   cp5.getController("textValue").moveTo("postGame");
   cp5.getController("clear").moveTo("postGame");
   cp5.getController("submit").moveTo("postGame");
   cp5.getController("performTextfieldActions").moveTo("postGame");
   cp5.getController("toggleAutoClear").moveTo("postGame");
   cp5.getController("toggleKeepFocus").moveTo("postGame");
   /*cp5.getController("1").moveTo("sandstorm");
   cp5.getController("2").moveTo("sandstorm");
   cp5.getController("3").moveTo("sandstorm");
   cp5.getController("3").moveTo("sandstorm");
   cp5.getController("4").moveTo("sandstorm");
   cp5.getController("5").moveTo("sandstorm");
   cp5.getController("6").moveTo("sandstorm");*/
   cp5.getGroup("rocketCargo").moveTo("sandstorm");
   cp5.getGroup("rocketHatch").moveTo("sandstorm");
   cp5.getController("darkMode").moveTo("settings");
}


public void draw (){   
   background(0xffFFFFFF);
   //  test.setProgress((test.getProgress() + 0.01) % 1);
}

   abstract class A implements ControlListener{
      public void rocketCargo(float theValue){
      println(theValue);
      }
      public void controlEvent(ControlEvent theEvent){
         rocketCargo(theEvent.value());
      }
   }

public void toggleAutoClear(boolean theFlag) {
  myTextfield.setAutoClear(theFlag);
}

public void toggleKeepFocus(boolean theFlag) {
  myTextfield.keepFocus(theFlag);
}

public void clear(int theValue) {
  myTextfield.clear();
}

public void submit(int theValue) {
  myTextfield.submit();
}

class B extends A {}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    Textfield t = (Textfield)theEvent.getController();

    println("controlEvent: accessing a string from controller '"
      +t.getName()+"': "+t.getStringValue()
      );

    // Textfield.isAutoClear() must be true
    print("controlEvent: trying to setText, ");

    t.setText("controlEvent: changing text.");
    if (t.isAutoClear()==false) {
      println("success!");
    } 
    else {
      println(" but Textfield.isAutoClear() is false, could not setText here.");
    }
  }
   if (theEvent.isTab()){
      println("got an event from tab : "+theEvent.getTab().getName()+" with id "+theEvent.getTab().getId());
   }
}


public void performTextfieldActions() {
  println("\n");
  // Textfield.getText();
  println("the current text of myTextfield: "+myTextfield.getText());
  println("the current value of textValue: "+textValue);
  // Textfield.setText();
  myTextfield.setText("changed the text of a textfield");
  println("changing text of myTextfield to: "+myTextfield.getText());
  // Textfield.getTextList();
  println("the textlist of myTextfield has "+myTextfield.getTextList().length+" items.");
  for (int i=0;i<myTextfield.getTextList().length;i++) {
    println("\t"+myTextfield.getTextList()[i]);
  }
  println("\n");
}

public void textinput(String theText) {
  // receiving text from controller textinput
  println("a textfield event for controller 'textinput': "+theText);
}

/*void loadJSON(int MATCH) {
  values = loadJSONArray("dataIn.json");
  //println("match: " + MATCH);
  //println("scout: " + child.scout);

  int i = MATCH;
  println(MATCH);
  //i = i+child.scout;
  i--;

  JSONObject match = values.getJSONObject(i); 
  JSONObject alliances = match.getJSONObject("alliances");
  JSONObject redAlli = alliances.getJSONObject("red");
  JSONArray redAllia = redAlli.getJSONArray("team_keys");
  String[] red = redAllia.getStringArray();
  JSONObject blueAlli = alliances.getJSONObject("blue");
  JSONArray blueAllia = blueAlli.getJSONArray("team_keys");
  String[] blue = blueAllia.getStringArray();
  String TEAMNUMBER = "0000";

  if (child.scout == 1) {
    alli = "blue";
    TEAMNUMBER = red[0].replaceAll("[\\D]", "");
  } 
  if (child.scout == 2) {
    alli = "blue";
    TEAMNUMBER = red[1].replaceAll("[\\D]", "");
  } 
  if (child.scout == 3) {
    alli = "blue";
    TEAMNUMBER = red[2].replaceAll("[\\D]", "");
  } 
  if (child.scout == 4) {
    alli = "blue";
    TEAMNUMBER = blue[0].replaceAll("[\\D]", "");
  } 
  if (child.scout == 5) {
    alli = "blue";
    TEAMNUMBER = blue[1].replaceAll("[\\D]", "");
  } 
  if (child.scout == 6) {
    alli = "blue";
    TEAMNUMBER = blue[2].replaceAll("[\\D]", "");
  }


  //String tournament = match.getString("Tournament");
  //alli = match.getString("alliance");

  //int MATCHNUM = match.getInt("Match #");
  //int TEAMNUM = match.getInt("Team #");

  //String TEAMNUMs = str(TEAMNUM);

  //println(i + ", " + alli + ", " + MATCHNUM + ", " + TEAMNUM + ", " + tournament);
  //println(alli);
  updateAlli(); 
  teamNumber.input = TEAMNUMBER;
}
void saveJSON() {
  JSONArray values1;
  if (matchNumber.start > 1) {
    values1 = loadJSONArray("dataOut.json");
  } else {
    values1 = new JSONArray();
  }

  int id = (matchNumber.start-1)*6;
  id = id+child.scout;
  id--;

  i = matchNumber.start;
  JSONObject match = new JSONObject();//(i);

  match.setInt("FactId", id);
  match.setInt("Match #", matchNumber.start);
  match.setInt("Team #", int(teamNumber.input));
  match.setInt("Portal", portal.count);
  //print(portal.count);
  //println("portal count");
  match.setInt("Cube Pile Zone", cubePileZone.count);
  match.setInt("Opponent Cube Line Zone", opponentCubeLineZone.count);
  match.setInt("Alliance Switch", allianceSwitch.count);
  match.setInt("Scale", scale.count);
  match.setInt("Opponent Switch", opponentSwitch.count);
  match.setInt("Exchange Drop Off", exchangeDropoff.count);
  match.setInt("Exchange Pick Up", exchangePickup.count);
  match.setInt("Cube Line Zone", cubeLineZone.count);
  match.setString("Scout Name", teamMember.input);
  match.setInt("Scout Number", child.scout);

  match.setBoolean("Disabled", disabled.isChecked);
  match.setBoolean("Parts on the Field", potf.isChecked);
  match.setBoolean("Flip", flippedOver.isChecked);
  match.setBoolean("Attempted Climb", attemptedClimb.isChecked);
  match.setBoolean("Successful Climb", successfulClimb.isChecked);
  match.setBoolean("No Show", noShow.isChecked);
  match.setInt("Tournament", tournament.checkedBox); 
  match.setBoolean("Yellow Card", yellowCard.isChecked);
  match.setBoolean("Red Card", redCard.isChecked);
  match.setBoolean("Tech Foul", techFoul1.isChecked);
  match.setBoolean("Foul", foul1.isChecked);
  match.setInt( "Dropped Box", droppedBox.count);
  match.setInt( "Foul", foulCounter);
  match.setInt( "Tech Foul", techFoulCounter);
  match.setBoolean("Assisted Climb", assistedClimb.isChecked);

  values1.setJSONObject(i-1, match);
  saveJSONArray(values1, "data/dataOut.json");
}*/
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "matchScouting2k19" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
