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
