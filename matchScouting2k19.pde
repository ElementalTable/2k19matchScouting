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
Textfield teamNum;
void setup () {
  B b = new B();
  fullScreen();
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
  cp5.addRadioButton("techFoul")
    .setPosition(xLocation, yLocation*4.7)
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
    .setPosition(xLocation*4, yLocation*4.7)
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
    .setPosition(xLocation*8, yLocation*4.7)
    .setSize(70, 20)
    .setValue(false)
    .setFont(font)
    .setColorActive(color(225,225,10))
    .setColorBackground(unactiveBut)
    ;

  cp5.getController("yellowCard").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("yellowCard").setLabel("Yellow Card");
  yellowCard.getCaptionLabel().getStyle().marginLeft = 85;
  yellowCard.getCaptionLabel().getStyle().marginTop = -27;



  Toggle redCard = cp5.addToggle("redCard")
    .setPosition(xLocation*8, yLocation*5.2)
    .setSize(70, 20)
    .setValue(false)
    .setFont(font)
    .setColorActive(color(255,10,10))
    .setColorBackground(unactiveBut)
    ;

  cp5.getController("redCard").getCaptionLabel().setFont(font).toUpperCase(false).setSize(20);
  cp5.getController("redCard").setLabel("Red Card");
  redCard.getCaptionLabel().getStyle().marginLeft = 85;
  redCard.getCaptionLabel().getStyle().marginTop = -27;
  
  
  
  
  
  Toggle disabled = cp5.addToggle("disabled")
    .setPosition(xLocation*8, yLocation*5.7)
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
    .setPosition(xLocation*8, yLocation*6.2)
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
    
  teamNum = cp5.addTextfield("teamNum")
    .setColorValue(color(white))
    .setPosition(xLocation*6.3, yLocation*1)
    .setSize(sizeing*1, sizeingPt2*3)
    .setFont(largeFont)
    .setLabel("Team Number")
    ;
    
  cp5.getController("teamNum").getCaptionLabel().setFont(font).setPaddingX(-5);

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
  
  cp5.getController("teamNum").moveTo("default");

  cp5.getController("toggleDarkMode").moveTo("settings");
}


void draw () {   
  background(backgroundCl);
  fill(textCl);
  stroke(textCl);
  //  test.setProgress((test.getProgress() + 0.01) % 1);

  //UI Elements
  if(activeTab == 0){
    cp5.getController("teamNum").getCaptionLabel().setColor(color(textCl));
  }
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
  }
}


abstract class A implements ControlListener {
  void rocketCargo() {
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

void toggleDarkMode(boolean darkMode) {
  if (darkMode == true) {
    backgroundCl=reBlack;
    textCl = white;
  } else {
    backgroundCl=white;
    textCl = reBlack;
  }
}

void submit() {
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
  }
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
