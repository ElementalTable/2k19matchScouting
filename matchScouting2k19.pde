import controlP5.*;
//import interfascia.*;
ControlP5 cp5;

//Color Pallett
//#059100 Islamic Green (main accent)
//#000000 Registration Black (text color/base color)
//#990000 USC Cardnial (Unactivated Buttons)
//#16302B Medium Jungle Green (Activated Buttons)
//#28061C Eerie Black (Unactivated Button )
//#FFFFFF White (text color/base color)

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

color backgroundCl;
color textCl;
color unactiveBut;
color activeBut;

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
void setup () {
  B b = new B();
  fullScreen();
  PFont pfont = createFont("Arial", 20, true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont, 15);

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
    .setPosition(xLocation*1.48, yLocation*2)
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
    .setPosition(xLocation*1.48, yLocation*2)
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
    .setPosition(xLocation*3.98, yLocation*2)
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
    .setPosition(xLocation*3.5, yLocation*2)
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
    .setPosition(xLocation*3.98, yLocation*2)
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
    .setPosition(xLocation*3.5, yLocation*2)
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
  cp5.addRadioButton("techFoulStorm")
    .setPosition(xLocation, yLocation*4.7)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("zeroTechStorm", 1)
    .addItem("oneTechStorm", 2)
    .addItem("twoTechStorm", 3)
    .addItem("threeTechStorm", 4)
    .addItem("greaterThreeTechStorm", 5)
    .getCaptionLabel()
    .setFont(font);
  ;

  cp5.getGroup("techFoulStorm");
  cp5.getController("zeroTechStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("zeroTechStorm").setLabel("0");
  cp5.getController("oneTechStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("oneTechStorm").setLabel("1");
  cp5.getController("twoTechStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("twoTechStorm").setLabel("2");
  cp5.getController("threeTechStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("threeTechStorm").setLabel("3");
  cp5.getController("greaterThreeTechStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("greaterThreeTechStorm").setLabel(">3");




  //Tele Tech Fouls
  cp5.addRadioButton("techFoulTele")
    .setPosition(xLocation, yLocation*4.7)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("zeroTechTele", 1)
    .addItem("oneTechTele", 2)
    .addItem("twoTechTele", 3)
    .addItem("threeTechTele", 4)
    .addItem("greaterThreeTechTele", 5)
    .setFont(font)
    ;
  cp5.getGroup("techFoulTele");
  cp5.getController("zeroTechTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("zeroTechTele").setLabel("0");
  cp5.getController("oneTechTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("oneTechTele").setLabel("1");
  cp5.getController("twoTechTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("twoTechTele").setLabel("2");
  cp5.getController("threeTechTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("threeTechTele").setLabel("3");
  cp5.getController("greaterThreeTechTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("greaterThreeTechTele").setLabel(">3");





  //Storm fouls
  cp5.addRadioButton("foulStorm")
    .setPosition(xLocation*4, yLocation*4.7)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("zeroFoulStorm", 1)
    .addItem("oneFoulStorm", 2)
    .addItem("twoFoulStorm", 3)
    .addItem("threeFoulStorm", 4)
    .addItem("fourFoulStorm", 5)
    .addItem("moreThanFourFoulStorm", 1)
    .setFont(font)
    ;
  cp5.getGroup("foulStorm");
  cp5.getController("zeroFoulStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("zeroFoulStorm").setLabel("0");
  cp5.getController("oneFoulStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("oneFoulStorm").setLabel("1");
  cp5.getController("twoFoulStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("twoFoulStorm").setLabel("2");
  cp5.getController("threeFoulStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("threeFoulStorm").setLabel("3");
  cp5.getController("fourFoulStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("fourFoulStorm").setLabel("4");
  cp5.getController("moreThanFourFoulStorm").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("moreThanFourFoulStorm").setLabel(">4");




  cp5.addRadioButton("foulTele")
    .setPosition(xLocation*4, yLocation*4.7)
    .setSize(sizeingPt2, sizeingPt2)
    .setItemsPerRow(1)
    .setSpacingColumn(xSpacing/5+(xSpacing/10))
    .setSpacingRow(ySpacing)
    .activateEvent(true)
    .setColorActive(activeBut)
    .setColorBackground(color(unactiveBut))
    .addItem("zeroFoulTele", 1)
    .addItem("oneFoulTele", 2)
    .addItem("twoFoulTele", 3)
    .addItem("threeFoulTele", 4)
    .addItem("fourFoulTele", 5)
    .addItem("moreThanFourFoulTele", 1)
    .setFont(font)
    ;
  cp5.getGroup("foulTele");
  cp5.getController("zeroFoulTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("zeroFoulTele").setLabel("0");
  cp5.getController("oneFoulTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("oneFoulTele").setLabel("1");
  cp5.getController("twoFoulTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("twoFoulTele").setLabel("2");
  cp5.getController("threeFoulTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("threeFoulTele").setLabel("3");
  cp5.getController("fourFoulTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("fourFoulTele").setLabel("4");
  cp5.getController("moreThanFourFoulTele").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("moreThanFourFoulTele").setLabel(">4");
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
    .setPosition(xLocation, yLocation*4.5)
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

  cp5.addButton("submit", 0, (xLocation*6), (yLocation*7), 100, 40).setFont(font);

  //cp5.getController("sliderValue").moveTo("sneeze");
  //cp5.getController("slider").moveTo("sneeze");
  //cp5.getController("button").moveTo("sneeze");
  //cp5.getController("buttonValue").moveTo("sneeze");
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
  cp5.getGroup("techFoulStorm").moveTo("sandstorm");
  cp5.getGroup("foulStorm").moveTo("sandstorm");
  cp5.getGroup("rocket1CargoTele").moveTo("teleop");
  cp5.getGroup("rocket1HatchTele").moveTo("teleop");
  cp5.getGroup("rocket2CargoTele").moveTo("teleop");
  cp5.getGroup("rocket2HatchTele").moveTo("teleop");
  cp5.getGroup("shipCargoTele").moveTo("teleop");
  cp5.getGroup("shipHatchTele").moveTo("teleop");
  cp5.getGroup("techFoulTele").moveTo("teleop");
  cp5.getGroup("foulTele").moveTo("teleop");
  cp5.getController("toggleDarkMode").moveTo("settings");
}


void draw () {   
  background(backgroundCl);
  fill(textCl);
  stroke(textCl);
  //  test.setProgress((test.getProgress() + 0.01) % 1);

  //UI Elements
  if (activeTab == 1 || activeTab==2) { //If on Sandstorm or Teleop tabs
    line(0, (yLocation*3.7), width, (yLocation*3.7)); //Draw horisontal line
    textSize(fontSize);

    //Rocket Text
    textSize(fontSize + 5);
    text("Rockets", xLocation*2.5, yLocation*1);
    textSize(fontSize);
    text("Left", xLocation*1.6, yLocation*1.8);
    text("Right", xLocation*4.05, yLocation*1.8);
    textSize(fontSize - 3);
    text("Cargo", xLocation*1.5, yLocation*3.3);
    text("Cargo", xLocation*4.05, yLocation*3.3);
    textSize(fontSize);

    //Cargo ship text
    textSize(fontSize + 5);
    text("Cargo Ship", xLocation*8.6, yLocation*1);
    textSize(fontSize);
    text("Hatches", xLocation*7.42, yLocation*1.8);
    text("Cargo", xLocation*10.52, yLocation*1.8);

    //Fouls text
    text("Tech Fouls", xLocation*.7, yLocation*4.3);
    text("Fouls", xLocation*3.9, yLocation*4.3);

    cp5.getGroup("techFoulTele").setColorLabel(color(textCl));
    cp5.getGroup("techFoulStorm").setColorLabel(color(textCl));
    cp5.getGroup("foulTele").setColorLabel(color(textCl));
    cp5.getGroup("foulStorm").setColorLabel(color(textCl));
  }
  if (activeTab==3) {
    cp5.getController("didWellInput").getCaptionLabel().setColor(color(textCl));
    cp5.getController("struggledInput").getCaptionLabel().setColor(color(textCl));
    cp5.getController("cantInput").getCaptionLabel().setColor(color(textCl));
  }
}


abstract class A implements ControlListener {
  void rocketCargo(float theValue) {
    //println(theValue);
  }
  public void controlEvent(ControlEvent theEvent) {
    rocketCargo(theEvent.value());

    if (theEvent.isTab()) {
      activeTab = theEvent.getTab().getId();
    }
  }
}

/*void toggleAutoClear(boolean theFlag) {
 myTextfield.setAutoClear(theFlag);
 }*/

void toggleDarkMode(boolean darkMode) {
  if (darkMode == true) {
    backgroundCl=reBlack;
    textCl = white;
  } else {
    backgroundCl=white;
    textCl = reBlack;
  }
}

void submit(int theValue) {

  didWellText.submit();
  struggledText.submit();
  cantText.submit();
}


//read variables
int teamId;
String alliace;
int startPos;
int stormRocketHatchLow;//
int stormCargoHatchLow;//
int stormHatchMid;//
int stormHatchHigh;//
int stormCargoRocketLow;//
int stormCargoCargoLow;//
int stormCargoMid;//
int stormCargoHigh;//
int stormTechFouls;
int stormFouls;
int hatchRocketLow;//
int hatchCargoLow;//
int hatchMid;//
int hatchHigh;//
int cargoRocketLow;//
int cargoCargoLow;//
int cargoMid;//
int cargoHigh;//
int techFouls;
int fouls;
int endPos;

class B extends A {
}

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isAssignableFrom(Textfield.class)) {
    cp5.get("didWellInput").getStringValue();
    //println(cp5.get("didWellInput").getStringValue());
  }
  if (theEvent.isTab()) {
    //println("got an event from tab : "+theEvent.getTab().getName()+" with id "+theEvent.getTab().getId());
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




    println(hatchMid);
    // if(theEvent.getName() ==
  }
}


/*
void performTextfieldActions() {
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
 */

public void textinput(String theText) {
  // receiving text from controller textinput
  //println("a textfield event for controller 'textinput': "+theText);
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
