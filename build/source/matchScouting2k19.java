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
//#16302B Medium Jungle Green (Activated Buttons)
//#28061C Eerie Black (Unactivated Button )
//#FFFFFF White (text color/base color)

match[] matches;

//read variables
String teamId = "0000";
String alliance;
int startPos;//
int stormRocketHatchLow;//
int stormCargoHatchLow;//
int stormHatchMid;//
int stormHatchHigh;//
int stormCargoRocketLow;//
int stormCargoCargoLow;//
int stormCargoMid;//
int stormCargoHigh;//
int hatchRocketLow;//
int hatchCargoLow;//
int hatchMid;//
int hatchHigh;//
int cargoRocketLow;//
int cargoCargoLow;//
int cargoMid;//
int cargoHigh;//
int techFouls;//
int fouls;//
int endPos;//
int scoutNum;//
String cantDo;//
String struggledWith;//
String didWell;//
boolean redCard;
boolean yellowCard;
boolean disabled;
boolean flippedOver;

//Color Vars
int is = 5;
int gre = 145;
int en = 0;
int reBlack = 0;
int usc = 12;
int ca = 40;
int rd = 0;
int mi = 0;
int dGre = 180;
int enn = 180;
int eeB = 40;
int la = 6;
int ck = 28;
int white = 255;

int backgroundCl;
int textCl;
int unactiveBut;
int activeBut;

String alli;
int i = 0;

//Location Vars
int xLocation = 100;
int yLocation = 100;
int xSpacing = 105;
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



//Active Tab Vart
int activeTab;
int matchNum = 1;
String textValue = "";
Textfield cantText;
Textfield struggledText;
Textfield didWellText;
Textfield match;
public void setup () {
  loadJSON();
  B b = new B();
  
  PFont pfont = createFont("Arial", 20, true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont, 15);
  ControlFont largeFont = new ControlFont(pfont, 40);

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

 JSONArray values;

  cp5 = new ControlP5 (this);

  //ControlFont cf1 = new ControlFont(createFont("Arial",20));

  backgroundCl = white;
  textCl = reBlack;
  unactiveBut = color(usc, ca, rd);
  activeBut = color(mi, dGre, enn);

  //cp5.getTab("default").setColorBackground(color(eeB, la, ck));
  cp5.getTab("default")
    .activateEvent(true)
    .setId(0)
    .setLabel("Welcome")
    .setColorValue(color(textCl))
    .setColorActive(color(is, gre, en))
    .setColorBackground(color(eeB, la, ck))
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
    .setId(1)
    .setLabel("Sandstorm")
    .setColorActive(color(is, gre, en))
    .setColorBackground(color(eeB, la, ck))
    //.setColor(color(eeB, la, ck))
    .setSize(sizeing * 2, sizeingPt2)
    .setHeight(sizeingPt2*2)
    .getCaptionLabel()
    .setFont(font)
    .setSize(fontSize)
    .toUpperCase(false)
    ;


  cp5.getTab("teleop")
    .activateEvent(true)
    .setId(2)
    .setLabel("Teleop")
    .setColorActive(color(is, gre, en))
    .setColorBackground(color(eeB, la, ck))
    //.setColor(color(eeB, la, ck))
    .setSize(sizeing * 2, sizeingPt2)
    .setHeight(sizeingPt2*2)
    .getCaptionLabel()
    .setFont(font)
    .setSize(fontSize)
    .toUpperCase(false)
    ;

  cp5.getTab("postGame")
    .activateEvent(true)
    .setId(3)
    .setLabel("Post Game")
    .setColorActive(color(is, gre, en))
    .setColorBackground(color(eeB, la, ck))
    //.setColor(color(eeB, la, ck))
    .setSize(sizeing * 2, sizeingPt2)
    .setHeight(sizeingPt2*2)
    .getCaptionLabel()
    .setFont(font)
    .setSize(fontSize)
    .toUpperCase(false) //they are good at _____ they struggle with ___ they can't do ______
    ;
  cp5.getTab("settings")
    .activateEvent(true)
    .setId(4)
    .setLabel("Settings")
    .setColorActive(color(is, gre, en))
    .setColorBackground(color(eeB, la, ck))
    //.setColor(color(eeB, la, ck))
    .setSize(sizeing * 2, sizeingPt2)
    .setHeight(sizeingPt2*2)
    .getCaptionLabel()
    .setFont(font)
    .setSize(fontSize)
    .toUpperCase(false)
    ;

  cp5.addListener(b);
  //---------------------------------------------------------------------------ROCKET1---------------------------------------------------------------------------------
  //Sandstorm Rocket1 Checkboxes
  cp5.addCheckBox("rocket1CargoSand")
    .setPosition(xLocation*1.48f, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(ySpacing)
    .setSpacingRow(xSpacing/5)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("stormCargoHigh", 1)
    .addItem("stormCargoHigh1", 2)
    .addItem("stormCargoMid", 3)
    .addItem("stormCargoMid1", 4)
    .addItem("rocketStormCargoLow", 5)
    .addItem("rocketStormCargoLow1", 6)
    .hideLabels()
    ;

  cp5.addCheckBox("rocket1HatchSand")
    .setPosition(xLocation, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(xSpacing+(xSpacing/5))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("stormHatchHigh", 1)
    .addItem("stormHatchHigh1", 2)
    .addItem("stormHatchMid", 3)
    .addItem("stormHatchMid1", 4)
    .addItem("rocketHatchCargoLow", 5)
    .addItem("rocketHatchCargoLow1", 6)
    .hideLabels()
    ;
  //Teleop Rocket1 Checkboxes
  cp5.addCheckBox("rocket1CargoTele")
    .setPosition(xLocation*1.48f, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(ySpacing)
    .setSpacingRow(xSpacing/5)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("teleCargoHigh", 1)
    .addItem("teleCargoHigh1", 2)
    .addItem("teleCargoMid", 3)
    .addItem("teleCargoMid1", 4)
    .addItem("rocketTeleCargoLow", 5)
    .addItem("rocketTeleCargoLow1", 6)
    .hideLabels()
    ;

  cp5.addCheckBox("rocket1HatchTele")
    .setPosition(xLocation, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(xSpacing+(xSpacing/5))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("teleHatchHigh", 1)
    .addItem("teleHatchHigh1", 2)
    .addItem("teleHatchMid", 3)
    .addItem("teleHatchMid1", 4)
    .addItem("rocketTeleHatchLow", 5)
    .addItem("rocketTeleHatchLow1", 6)
    .hideLabels()
    ;

  //-------------------------------------------------------------------------ROCKET2-----------------------------------------------------------------------------------------
  //Rocket 2 Cargo Sandstorm
  cp5.addCheckBox("rocket2CargoSand")
    .setPosition(xLocation*3.98f, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(ySpacing)
    .setSpacingRow(xSpacing/5)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("rocket2stormCargoHigh", 1)
    .addItem("rocket2stormCargoHigh1", 2)
    .addItem("rocket2stormCargoMid", 3)
    .addItem("rocket2stormCargoMid1", 4)
    .addItem("rocket2StormCargoLow", 5)
    .addItem("rocket2StormCargoLow1", 6)
    .hideLabels()
    ;

  cp5.addCheckBox("rocket2HatchSand")
    .setPosition(xLocation*3.5f, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(xSpacing+(xSpacing/5))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("rocket2stormHatchHigh", 1)
    .addItem("rocket2stormHatchHigh1", 2)
    .addItem("rocket2stormHatchMid", 3)
    .addItem("rocket2stormHatchMid1", 4)
    .addItem("rocket2HatchCargoLow", 5)
    .addItem("rocket2HatchCargoLow1", 6)
    .hideLabels()
    ;
  //Rocket 2 Teleop checkboxes
  cp5.addCheckBox("rocket2CargoTele")
    .setPosition(xLocation*3.98f, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(ySpacing)
    .setSpacingRow(xSpacing/5)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("rocket2teleCargoHigh", 1)
    .addItem("rocket2teleCargoHigh1", 2)
    .addItem("rocket2teleCargoMid", 3)
    .addItem("rocket2teleCargoMid1", 4)
    .addItem("rocket2TeleCargoLow", 5)
    .addItem("rocket2TeleCargoLow1", 6)
    .hideLabels()
    ;

  cp5.addCheckBox("rocket2HatchTele")
    .setPosition(xLocation*3.5f, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(xSpacing+(xSpacing/5))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("rocket2teleHatchHigh", 1)
    .addItem("rocket2teleHatchHigh1", 2)
    .addItem("rocket2teleHatchMid", 3)
    .addItem("rocket2teleHatchMid1", 4)
    .addItem("rocket2TeleHatchLow", 5)
    .addItem("rocket2TeleHatchLow1", 6)
    .hideLabels()
    ;



  //---------------------------------------------------------------------CARGOSHIP-------------------------------------------------------------
  //Ship Cargo Teleop
  cp5.addCheckBox("shipCargoTele")
    .setPosition(xLocation*10, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(4)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("shipTeleCargo1", 1)
    .addItem("shipTeleCargo2", 2)
    .addItem("shipTeleCargo3", 3)
    .addItem("shipTeleCargoFront1", 4)
    .addItem("shipTeleCargoFront2", 5)
    .addItem("shipTeleCargo4", 6)
    .addItem("shipTeleCargo5", 7)
    .addItem("shipTeleCargo6", 8)
    .hideLabels()
    ;

  //Ship Hatch Teleop
  cp5.addCheckBox("shipHatchTele")
    .setPosition(xLocation*7, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(4)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("shipTeleHatch1", 1)
    .addItem("shipTeleHatch2", 2)
    .addItem("shipTeleHatch3", 3)
    .addItem("shipTeleHatchFront1", 4)
    .addItem("shipTeleHatchFront2", 5)
    .addItem("shipTeleHatch4", 6)
    .addItem("shipTeleHatch5", 7)
    .addItem("shipTeleHatch6", 8)
    .hideLabels()
    ;



  //Ship Cargo Sandstorm
  cp5.addCheckBox("shipCargoSand")
    .setPosition(xLocation*10, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(4)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("shipSandCargo1", 1)
    .addItem("shipSandCargo2", 2)
    .addItem("shipSandCargo3", 3)
    .addItem("shipSandCargoFront1", 4)
    .addItem("shipSandCargoFront2", 5)
    .addItem("shipSandCargo4", 6)
    .addItem("shipSandCargo5", 7)
    .addItem("shipSandCargo6", 8)
    .hideLabels()
    ;

  //Ship Hatch Sandstorm
  cp5.addCheckBox("shipHatchSand")
    .setPosition(xLocation*7, yLocation*2)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(4)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("shipSandHatch1", 1)
    .addItem("shipSandHatch2", 2)
    .addItem("shipSandHatch3", 3)
    .addItem("shipSandHatchFront1", 4)
    .addItem("shipSandHatchFront2", 5)
    .addItem("shipSandHatch4", 6)
    .addItem("shipSandHatch5", 7)
    .addItem("shipSandHatch6", 8)
    .hideLabels()
    ;

  //----------------------------------------------------------------------FOULS/TECHFOULS---------------------------------------------------------------------------------------
  //Storm tech fouls
  cp5.addRadioButton("techFoul")
    .setPosition(xLocation, yLocation*4.7f)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("zeroTech", 1)
    .addItem("oneTech", 2)
    .addItem("twoTech", 3)
    .addItem("threeTech", 4)
    .addItem("greaterThreeTech", 5)
    .getCaptionLabel()
    .setFont(font);
  ;

  cp5.getGroup("techFoul");
  cp5.getController("zeroTech").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("zeroTech").setLabel("0");
  cp5.getController("oneTech").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("oneTech").setLabel("1");
  cp5.getController("twoTech").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("twoTech").setLabel("2");
  cp5.getController("threeTech").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("threeTech").setLabel("3");
  cp5.getController("greaterThreeTech").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("greaterThreeTech").setLabel(">3");






  //Storm fouls
  cp5.addRadioButton("foul")
    .setPosition(xLocation*4, yLocation*4.7f)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("zeroFoul", 1)
    .addItem("oneFoul", 2)
    .addItem("twoFoul", 3)
    .addItem("threeFoul", 4)
    .addItem("fourFoul", 5)
    .addItem("moreThanFourFoul", 1)
    .setFont(font)
    ;
  cp5.getGroup("foul");
  cp5.getController("zeroFoul").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("zeroFoul").setLabel("0");
  cp5.getController("oneFoul").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("oneFoul").setLabel("1");
  cp5.getController("twoFoul").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("twoFoul").setLabel("2");
  cp5.getController("threeFoul").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("threeFoul").setLabel("3");
  cp5.getController("fourFoul").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("fourFoul").setLabel("4");
  cp5.getController("moreThanFourFoul").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("moreThanFourFoul").setLabel(">4");





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

  //-----------------------------------------------------------------------------------Penalty Switches-------------------------------------------------------------------
  Toggle yellowCard = cp5.addToggle("yellowCard")
    .setPosition(xLocation*8, yLocation*4.7f)
    .setSize(70, 20)
    .setValue(false)
    .setFont(font)
    .setColorActive(color(225, 225, 10))
    .setColorBackground(unactiveBut)
    ;

  cp5.getController("yellowCard").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("yellowCard").setLabel("Yellow Card");
  yellowCard.getCaptionLabel().getStyle().marginLeft = 85;
  yellowCard.getCaptionLabel().getStyle().marginTop = -27;



  Toggle redCard = cp5.addToggle("redCard")
    .setPosition(xLocation*8, yLocation*5.2f)
    .setSize(70, 20)
    .setValue(false)
    .setFont(font)
    .setColorActive(color(255, 10, 10))
    .setColorBackground(unactiveBut)
    ;

  cp5.getController("redCard").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("redCard").setLabel("Red Card");
  redCard.getCaptionLabel().getStyle().marginLeft = 85;
  redCard.getCaptionLabel().getStyle().marginTop = -27;





  Toggle disabled = cp5.addToggle("disabled")
    .setPosition(xLocation*8, yLocation*5.7f)
    .setSize(70, 20)
    .setValue(false)
    .setFont(font)
    .setColorActive(activeBut)
    .setColorBackground(unactiveBut)
    ;

  cp5.getController("disabled").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("disabled").setLabel("Disabled");
  disabled.getCaptionLabel().getStyle().marginLeft = 85;
  disabled.getCaptionLabel().getStyle().marginTop = -27;





  Toggle flippedOver = cp5.addToggle("flippedOver")
    .setPosition(xLocation*8, yLocation*6.2f)
    .setSize(70, 20)
    .setValue(false)
    .setFont(font)
    .setColorActive(activeBut)
    .setColorBackground(unactiveBut)
    ;

  cp5.getController("flippedOver").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("flippedOver").setLabel("Flipped Over");
  flippedOver.getCaptionLabel().getStyle().marginLeft = 85;
  flippedOver.getCaptionLabel().getStyle().marginTop = -27;


  //----------------------------------------------------------------------------------Dark Mode----------------------------------------------------------------------------
  cp5.addToggle("toggleDarkMode", false)
    .setLabel("Dark Mode")
    .setColorActive(color(activeBut))
    .setColorBackground(color(unactiveBut))
    .setPosition(xLocation, yLocation)
    .setSize(sizeing*2, sizeingPt2*2)
    .setValue(0)
    .getCaptionLabel()
    .align(CENTER, CENTER)
    .toUpperCase(false)
    .setFont(pfont)
    .setSize(fontSize)
    ;


  //-------------------------------------------------------------------------Post Game Text Fields------------------------------------------------------------------------
  didWellText = cp5.addTextfield("didWellInput")
    .setColorValue(color(white))
    .setPosition(xLocation, yLocation*3)
    .setSize(sizeing*11, sizeingPt2)
    .setFocus(true)
    .setFont(font)
    .setLabel("What they did well")
    ;

  struggledText = cp5.addTextfield("struggledInput")
    .setColorValue(color(white))
    .setPosition(xLocation, yLocation*4.5f)
    .setSize(sizeing*11, sizeingPt2)
    .setFont(font)
    .setLabel("What they struggled with")
    ;

  cantText = cp5.addTextfield("cantInput")
    .setColorValue(color(white))
    .setPosition(xLocation, yLocation*6)
    .setSize(sizeing*11, sizeingPt2)
    .setFont(font)
    .setLabel("What they can't do")
    ;


cp5.addRadioButton("endPos")
    .setPosition(xLocation*11.8f, yLocation)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("habOneE", 1)
    .addItem("habTwoE", 2)
    .addItem("habThreeE", 3)
    .getCaptionLabel()
    .setFont(font);
  ;

  cp5.getGroup("endPos");
  cp5.getController("habOneE").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("habOneE").setLabel("1");
  cp5.getController("habTwoE").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("habTwoE").setLabel("2");
  cp5.getController("habThreeE").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("habThreeE").setLabel("3");

  //---------------------------------------------------------------------------Welcome page--------------------------------------------------------------------------------
  cp5.addBang("addMatch", (xLocation*7+13), (yLocation*6), 40, 40)
    .setFont(font)
    ;

  cp5.getController("addMatch").setLabel("+");
  cp5.getController("addMatch").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setColor(textCl).setFont(largeFont);

  cp5.addBang("subtractMatch", (xLocation*6+13), (yLocation*6), 40, 40)
    .setFont(font)
    ;

  cp5.getController("subtractMatch").setLabel("-");
  cp5.getController("subtractMatch").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setColor(textCl).setFont(largeFont);
  cp5.addButton("submit", 0, (xLocation*6), (yLocation*7), 100, 40).setFont(font);



  cp5.addRadioButton("scoutNum")
    .setPosition(xLocation, yLocation*3)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing/2)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("one", 1)
    .addItem("two", 2)
    .addItem("three", 3)
    .addItem("four", 4)
    .addItem("five", 5)
    .addItem("six", 6)
    .getCaptionLabel()
    .setFont(font);
  ;




  cp5.getGroup("scoutNum");
  cp5.getController("one").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("one").setLabel("1");
  cp5.getController("two").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("two").setLabel("2");
  cp5.getController("three").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("three").setLabel("3");
  cp5.getController("four").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("four").setLabel("4");
  cp5.getController("five").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("five").setLabel("5");
  cp5.getController("six").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("six").setLabel("6");



  cp5.addRadioButton("startPos")
    .setPosition(xLocation*11.5f, yLocation*3.7f)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(2)
    .setSpacingColumn(xSpacing+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("habOne", 1)
    .addItem("habTwo", 2)
    .getCaptionLabel()
    .setFont(font);
  ;

  cp5.getGroup("starPos");
  cp5.getController("habOne").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("habOne").setLabel("1");
  cp5.getController("habTwo").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("habTwo").setLabel("2");



  //------------------------------------------------------------------------------Move to correct tabs------------------------------------------



  //cp5.getController("sliderValue").moveTo("sneeze");
  //cp5.getController("slider").moveTo("sneeze");
  //cp5.getController("button").moveTo("sneeze");
  //cp5.getController("buttonValue").moveTo("sneeze");
  cp5.getGroup("endPos").moveTo("postGame");
  cp5.getController("didWellInput").moveTo("postGame");
  cp5.getController("struggledInput").moveTo("postGame");
  cp5.getController("cantInput").moveTo("postGame");
  cp5.getController("submit").moveTo("postGame");

  /*cp5.getController("1").moveTo("sandstorm");
   cp5.getController("2").moveTo("sandstorm");
   cp5.getController("3").moveTo("sandstorm");
   cp5.getController("3").moveTo("sandstorm");
   cp5.getController("4").moveTo("sandstorm");
   cp5.getController("5").moveTo("sandstorm");
   cp5.getController("6").moveTo("sandstorm");*/
  cp5.getGroup("rocket1CargoSand").moveTo("sandstorm");
  cp5.getGroup("rocket1HatchSand").moveTo("sandstorm");
  cp5.getGroup("rocket2CargoSand").moveTo("sandstorm");
  cp5.getGroup("rocket2HatchSand").moveTo("sandstorm");
  cp5.getGroup("shipCargoSand").moveTo("sandstorm");
  cp5.getGroup("shipHatchSand").moveTo("sandstorm");
  cp5.getGroup("techFoul").moveTo("sandstorm");
  cp5.getGroup("foul").moveTo("sandstorm");
  cp5.getController("yellowCard").moveTo("sandstorm");
  cp5.getController("disabled").moveTo("sandstorm");
  cp5.getController("redCard").moveTo("sandstorm");
  cp5.getController("flippedOver").moveTo("sandstorm");

  cp5.getGroup("rocket1CargoTele").moveTo("teleop");
  cp5.getGroup("rocket1HatchTele").moveTo("teleop");
  cp5.getGroup("rocket2CargoTele").moveTo("teleop");
  cp5.getGroup("rocket2HatchTele").moveTo("teleop");
  cp5.getGroup("shipCargoTele").moveTo("teleop");
  cp5.getGroup("shipHatchTele").moveTo("teleop");

  cp5.getController("toggleDarkMode").moveTo("settings");
}


public void draw () {
  background(backgroundCl);
  fill(textCl);
  stroke(textCl);
  //  test.setProgress((test.getProgress() + 0.01) % 1);


  //UI Elements
  if (activeTab == 0) {
    cp5.getGroup("scoutNum").setColorLabel(color(textCl));
    cp5.getGroup("startPos").setColorLabel(color(textCl));
    textAlign(CENTER);
    textSize(fontSize+20);
    text(matchNum, xLocation*6.82f, yLocation*6.35f);
    text(teamId, xLocation*6.82f, yLocation*1.2f);
    textSize(fontSize);
    text("Team Number", xLocation*6.82f, yLocation*1.7f);
    text("Match Number", xLocation*6.82f, yLocation*6.8f);
    text("Scout Number", xLocation*1.2f, yLocation*2.7f);
    text("Starting Position", xLocation*12.3f, yLocation*2.7f);
    textAlign(LEFT);
  }
  if (activeTab == 1 || activeTab==2) { //If on Sandstorm or Teleop tabs
    line(0, (yLocation*3.7f), width, (yLocation*3.7f)); //Draw horisontal line
    textSize(fontSize);

    //Rocket Text
    textSize(fontSize + 5);
    text("Rockets", xLocation*2.5f, yLocation*1);
    textSize(fontSize);
    text("Left", xLocation*1.6f, yLocation*1.8f);
    text("Right", xLocation*4.05f, yLocation*1.8f);
    textSize(fontSize - 3);
    text("Cargo", xLocation*1.5f, yLocation*3.3f);
    text("Cargo", xLocation*4.05f, yLocation*3.3f);
    textSize(fontSize);

    //Cargo ship text
    textSize(fontSize + 5);
    text("Cargo Ship", xLocation*8.6f, yLocation*1);
    textSize(fontSize);
    text("Hatches", xLocation*7.42f, yLocation*1.8f);
    text("Cargo", xLocation*10.52f, yLocation*1.8f);

    //Fouls text
    text("Tech Fouls", xLocation*.7f, yLocation*4.3f);
    text("Fouls", xLocation*3.9f, yLocation*4.3f);

    cp5.getGroup("techFoul").setColorLabel(color(textCl));
    cp5.getGroup("foul").setColorLabel(color(textCl));
    cp5.getController("yellowCard").getCaptionLabel().setColor(color(textCl));
    cp5.getController("redCard").getCaptionLabel().setColor(color(textCl));
    cp5.getController("disabled").getCaptionLabel().setColor(color(textCl));
    cp5.getController("flippedOver").getCaptionLabel().setColor(color(textCl));
  }


  if (activeTab==3) {
    cp5.getController("didWellInput").getCaptionLabel().setColor(color(textCl));
    cp5.getController("struggledInput").getCaptionLabel().setColor(color(textCl));
    cp5.getController("cantInput").getCaptionLabel().setColor(color(textCl));
    cp5.getGroup("endPos").setColorLabel(color(textCl));
    text("Ending Position", xLocation*11, yLocation*.7f);
  }
}


abstract class A implements ControlListener {
  public void rocketCargo() {
    //println(theValue);
  }
  public void controlEvent(ControlEvent theEvent) {
    if (theEvent.isTab()) {
      activeTab = theEvent.getTab().getId();
      if (activeTab == 1) {
        cp5.getGroup("techFoul").moveTo("sandstorm");
        cp5.getGroup("foul").moveTo("sandstorm");
        cp5.getController("disabled").moveTo("sandstorm");
        cp5.getController("yellowCard").moveTo("sandstorm");
        cp5.getController("redCard").moveTo("sandstorm");
        cp5.getController("flippedOver").moveTo("sandstorm");
      }

      if (activeTab == 2) {
        cp5.getGroup("techFoul").moveTo("teleop");
        cp5.getGroup("foul").moveTo("teleop");
        cp5.getController("disabled").moveTo("teleop");
        cp5.getController("yellowCard").moveTo("teleop");
        cp5.getController("redCard").moveTo("teleop");
        cp5.getController("flippedOver").moveTo("teleop");
      }
    }
  }
}

/*void toggleAutoClear(boolean theFlag) {
 myTextfield.setAutoClear(theFlag);
 }*/

public void toggleDarkMode(boolean darkMode) {
  if (darkMode == true) {
    backgroundCl=reBlack;
    textCl = white;
  } else {
    backgroundCl=white;
    textCl = reBlack;
  }
}

public void submit() {
  didWellText.submit();
  struggledText.submit();
  cantText.submit();
  addMatch();
}

public void addMatch() {
  matchNum++;
  setTeamNumber(scoutNum, matchNum);
}

public void subtractMatch() {
  if (matchNum>1) {
    matchNum--;
  }
  setTeamNumber(scoutNum, matchNum);
}



class B extends A {
}

public void controlEvent(ControlEvent theEvent) {

  if (theEvent.isAssignableFrom(Textfield.class)) {
    didWell = cp5.get("didWellInput").getStringValue();
    struggledWith = cp5.get("struggledInput").getStringValue();
    cantDo = cp5.get("cantInput").getStringValue();
  }
  if (theEvent.isTab()) {
  }

  if (theEvent.isAssignableFrom(CheckBox.class)) {

    stormRocketHatchLow = (int)cp5.getGroup("rocket1HatchSand").getArrayValue(4) + (int)cp5.getGroup("rocket1HatchSand").getArrayValue(5)
      + (int)cp5.getGroup("rocket2HatchSand").getArrayValue(4) + (int)cp5.getGroup("rocket2HatchSand").getArrayValue(5)
      ;
    stormCargoHatchLow =
      (int)cp5.getGroup("shipHatchSand").getArrayValue(0) +
      (int)cp5.getGroup("shipHatchSand").getArrayValue(1) +
      (int)cp5.getGroup("shipHatchSand").getArrayValue(2) +
      (int)cp5.getGroup("shipHatchSand").getArrayValue(3) +
      (int)cp5.getGroup("shipHatchSand").getArrayValue(4) +
      (int)cp5.getGroup("shipHatchSand").getArrayValue(5) +
      (int)cp5.getGroup("shipHatchSand").getArrayValue(6) +
      (int)cp5.getGroup("shipHatchSand").getArrayValue(7)
      ;

    stormHatchMid = (int)cp5.getGroup("rocket1HatchSand").getArrayValue(2) + (int)cp5.getGroup("rocket1HatchSand").getArrayValue(3)
      + (int)cp5.getGroup("rocket2HatchSand").getArrayValue(2) + (int)cp5.getGroup("rocket2HatchSand").getArrayValue(3)
      ;

    stormHatchHigh = (int)cp5.getGroup("rocket1HatchSand").getArrayValue(0) + (int)cp5.getGroup("rocket1HatchSand").getArrayValue(1)
      + (int)cp5.getGroup("rocket2HatchSand").getArrayValue(0) + (int)cp5.getGroup("rocket2HatchSand").getArrayValue(1)
      ;



    stormCargoRocketLow = (int)cp5.getGroup("rocket1CargoSand").getArrayValue(4) + (int)cp5.getGroup("rocket1CargoSand").getArrayValue(5)
      + (int)cp5.getGroup("rocket2CargoSand").getArrayValue(4) + (int)cp5.getGroup("rocket2CargoSand").getArrayValue(5)
      ;
    stormCargoCargoLow =
      (int)cp5.getGroup("shipCargoSand").getArrayValue(0) +
      (int)cp5.getGroup("shipCargoSand").getArrayValue(1) +
      (int)cp5.getGroup("shipCargoSand").getArrayValue(2) +
      (int)cp5.getGroup("shipCargoSand").getArrayValue(3) +
      (int)cp5.getGroup("shipCargoSand").getArrayValue(4) +
      (int)cp5.getGroup("shipCargoSand").getArrayValue(5) +
      (int)cp5.getGroup("shipCargoSand").getArrayValue(6) +
      (int)cp5.getGroup("shipCargoSand").getArrayValue(7)
      ;

    stormCargoMid = (int)cp5.getGroup("rocket1CargoSand").getArrayValue(2) + (int)cp5.getGroup("rocket1CargoSand").getArrayValue(3)
      + (int)cp5.getGroup("rocket2CargoSand").getArrayValue(2) + (int)cp5.getGroup("rocket2CargoSand").getArrayValue(3)
      ;

    stormCargoHigh = (int)cp5.getGroup("rocket1CargoSand").getArrayValue(0) + (int)cp5.getGroup("rocket1CargoSand").getArrayValue(1)
      + (int)cp5.getGroup("rocket2CargoSand").getArrayValue(0) + (int)cp5.getGroup("rocket2CargoSand").getArrayValue(1)
      ;


    hatchRocketLow = (int)cp5.getGroup("rocket1HatchTele").getArrayValue(4) + (int)cp5.getGroup("rocket1HatchTele").getArrayValue(5)
      + (int)cp5.getGroup("rocket2HatchTele").getArrayValue(4) + (int)cp5.getGroup("rocket2HatchTele").getArrayValue(5)
      ;
    hatchCargoLow =
      (int)cp5.getGroup("shipHatchTele").getArrayValue(0) +
      (int)cp5.getGroup("shipHatchTele").getArrayValue(1) +
      (int)cp5.getGroup("shipHatchTele").getArrayValue(2) +
      (int)cp5.getGroup("shipHatchTele").getArrayValue(3) +
      (int)cp5.getGroup("shipHatchTele").getArrayValue(4) +
      (int)cp5.getGroup("shipHatchTele").getArrayValue(5) +
      (int)cp5.getGroup("shipHatchTele").getArrayValue(6) +
      (int)cp5.getGroup("shipHatchTele").getArrayValue(7)
      ;

    hatchMid = (int)cp5.getGroup("rocket1HatchTele").getArrayValue(2) + (int)cp5.getGroup("rocket1HatchTele").getArrayValue(3)
      + (int)cp5.getGroup("rocket2HatchTele").getArrayValue(2) + (int)cp5.getGroup("rocket2HatchTele").getArrayValue(3)
      ;

    hatchHigh = (int)cp5.getGroup("rocket1HatchTele").getArrayValue(0) + (int)cp5.getGroup("rocket1HatchTele").getArrayValue(1)
      + (int)cp5.getGroup("rocket2HatchTele").getArrayValue(0) + (int)cp5.getGroup("rocket2HatchTele").getArrayValue(1)
      ;



    cargoRocketLow = (int)cp5.getGroup("rocket1CargoTele").getArrayValue(4) + (int)cp5.getGroup("rocket1CargoTele").getArrayValue(5)
      + (int)cp5.getGroup("rocket2CargoTele").getArrayValue(4) + (int)cp5.getGroup("rocket2CargoTele").getArrayValue(5)
      ;
    cargoCargoLow =
      (int)cp5.getGroup("shipCargoTele").getArrayValue(0) +
      (int)cp5.getGroup("shipCargoTele").getArrayValue(1) +
      (int)cp5.getGroup("shipCargoTele").getArrayValue(2) +
      (int)cp5.getGroup("shipCargoTele").getArrayValue(3) +
      (int)cp5.getGroup("shipCargoTele").getArrayValue(4) +
      (int)cp5.getGroup("shipCargoTele").getArrayValue(5) +
      (int)cp5.getGroup("shipCargoTele").getArrayValue(6) +
      (int)cp5.getGroup("shipCargoTele").getArrayValue(7)
      ;

    cargoMid = (int)cp5.getGroup("rocket1CargoTele").getArrayValue(2) + (int)cp5.getGroup("rocket1CargoTele").getArrayValue(3)
      + (int)cp5.getGroup("rocket2CargoTele").getArrayValue(2) + (int)cp5.getGroup("rocket2CargoTele").getArrayValue(3)
      ;

    cargoHigh = (int)cp5.getGroup("rocket1CargoTele").getArrayValue(0) + (int)cp5.getGroup("rocket1CargoTele").getArrayValue(1)
      + (int)cp5.getGroup("rocket2CargoTele").getArrayValue(0) + (int)cp5.getGroup("rocket2CargoTele").getArrayValue(1)
      ;
  }

  //-----------------------------------------------------------------Penalties, Fouls, ETC--------------------------------------------------------------------
  if (theEvent.isFrom("techFoul")) {
    if (theEvent.getArrayValue(0) == 1) {
      techFouls = 0;
    } else if (theEvent.getArrayValue(1) == 1) {
      techFouls = 1;
    } else if (theEvent.getArrayValue(2) == 1) {
      techFouls = 2;
    } else if (theEvent.getArrayValue(3) == 1) {
      techFouls = 3;
    } else if (theEvent.getArrayValue(4) == 1) {
      techFouls = 4;
    }
  }

  if (theEvent.isFrom("foul")) {
    if (theEvent.getArrayValue(0) == 1) {
      fouls = 0;
    } else if (theEvent.getArrayValue(1) == 1) {
      fouls = 1;
    } else if (theEvent.getArrayValue(2) == 1) {
      fouls = 2;
    } else if (theEvent.getArrayValue(3) == 1) {
      fouls = 3;
    } else if (theEvent.getArrayValue(4) == 1) {
      fouls = 4;
    } else if (theEvent.getArrayValue(5) == 1) {
      fouls = 5;
    }
  }

  if (theEvent.isFrom("startPos")) {
    if (theEvent.getArrayValue(0) == 1) {
      startPos = 1;
    } else if (theEvent.getArrayValue(1) == 1) {
      startPos = 2;
    }
  }


  if (theEvent.isFrom("endPos")) {
    if (theEvent.getArrayValue(0) == 1) {
      endPos = 1;
    } else if (theEvent.getArrayValue(1) == 1) {
      endPos = 2;
    } else if (theEvent.getArrayValue(2) == 1) {
      endPos = 3;
    }
  }



  if (theEvent.isFrom("scoutNum")) {
    if (theEvent.getArrayValue(0) == 1) {
      scoutNum = 1;
    } else if (theEvent.getArrayValue(1) == 1) {
      scoutNum = 2;
    } else if (theEvent.getArrayValue(2) == 1) {
      scoutNum = 3;
    } else if (theEvent.getArrayValue(3) == 1) {
      scoutNum = 4;
    } else if (theEvent.getArrayValue(4) == 1) {
      scoutNum = 5;
    } else if (theEvent.getArrayValue(5) == 1) {
      scoutNum = 6;
    }
    setTeamNumber(scoutNum,matchNum);
  }
}
  public void redCard(boolean toggled){
    redCard = toggled;
  }
  public void yellowCard(boolean toggled){
    yellowCard = toggled;
  }
  public void disabled(boolean toggled){
    disabled = toggled;
  }
  public void flippedOver(boolean toggled){
    flippedOver = toggled;
  }


public void loadJSON(){
  JSONArray values;
  values = loadJSONArray("dataIn.json");

 int numMatches = values.size();

 matches = new match[numMatches + 1];

  for(int m = 0; m < numMatches; m++){
    JSONObject Jmatch = values.getJSONObject(m);
    int matchNum = Jmatch.getInt("match_number");
    JSONObject alliances = Jmatch.getJSONObject("alliances");
    JSONObject redAlli = alliances.getJSONObject("red");
    JSONArray redAllia = redAlli.getJSONArray("team_keys");
    String[] red = redAllia.getStringArray();
    JSONObject blueAlli = alliances.getJSONObject("blue");
    JSONArray blueAllia = blueAlli.getJSONArray("team_keys");
    String[] blue = blueAllia.getStringArray();
    matches[matchNum] = new match(matchNum);
    matches[matchNum].setRed(red);
    matches[matchNum].setBlue(blue);
  }

}
public void saveJSON() {

JSONArray values1;
int id = (matchNum-1)*6;
id = id+scoutNum;
id--;

 values1 = new JSONArray();

i = matchNum;
JSONObject match = new JSONObject();//(i);

match.setInt("Scout Number", scoutNum);
match.setInt("Match #",matchNum);
match.setString("Team #",teamId);
match.setInt("Start Position", startPos);
match.setInt("Storm Rocket Hatch Low", stormRocketHatchLow);
match.setInt("Storm Cargo Hatch Low", stormCargoHatchLow);
match.setInt("Storm Hatch Mid", stormHatchMid);
match.setInt("Storm Hatch High", stormHatchHigh);
match.setInt("Storm Cargo Rocket Low", stormCargoRocketLow);
match.setInt("Storm Cargo Cargo Low", stormCargoCargoLow);
match.setInt("Storm Cargo Mid", stormCargoMid);
match.setInt("Storm Cargo High", stormCargoHigh);
match.setInt("Hatch Rocket Low", hatchRocketLow);
match.setInt("Hatch Cargo Low", hatchCargoLow);
match.setInt("Hatch Mid", hatchMid);
match.setInt("Hatch High", hatchHigh);
match.setInt("Cargo Rocket Low", cargoRocketLow);
match.setInt("Cargo Cargo Low", cargoCargoLow);
match.setInt("Cargo Mid", cargoMid);
match.setInt("Cargo High", cargoHigh);
match.setInt("Tech Fouls", techFouls);
match.setInt("End Position", endPos);
match.setString("They Cant Do", cantDo);
match.setString("They Struggled With", struggledWith);
match.setString("They Did Well", didWell);
match.setBoolean("Red Card", redCard);
match.setBoolean("Yellow Card", yellowCard);
match.setBoolean("Disabled", disabled);
match.setBoolean("Flipped Over", flippedOver);

values1.setJSONObject(i-1, match);
saveJSONArray(values1,"data/dataOut.json");
}


/*
 values1.setJSONObject(i-1, match);
 saveJSONArray(values1, "data/dataOut.json");
 */
 public void setTeamNumber(int scoutNum, int matchNum){
   int teamNum;
   if(scoutNum <= 3){
     teamNum = matches[matchNum].getRed(scoutNum-1);
   }else{
     teamNum = matches[matchNum].getBlue(scoutNum-4);
   }
   teamId = str(teamNum);
 }
public class match {
  // Fields
  int matchNum;
  int[] red = {0,0,0};
  int[] blue = {0,0,0};

  // Constructors
  public match (int matchNum) {
    this.matchNum = matchNum;
  }

  //methods
  public void setRed(String[] redIn) {
    for (int t = 0; t <= 2; t++) {
      this.red[t] = Integer.parseInt(redIn[t].replaceAll("[\\D]", ""));
    }
  }
  public void setBlue(String[] blueIn) {
    for (int t = 0; t <= 2; t++) {
      this.blue[t] = Integer.parseInt(blueIn[t].replaceAll("[\\D]", ""));
    }
  }
  public int getBlue(int t) {
    return blue[t];
  }
  public int getRed(int t){
    return red[t];
  }
 }
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
