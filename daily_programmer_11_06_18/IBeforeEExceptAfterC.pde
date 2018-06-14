String[] in={"a", "zombie", "transceiver", "veil", "icier"};

void setup() {
  String[] enable=loadStrings("enable1.txt");
  println(checkRule(enable));
  exit();
}

boolean checkRule(String input) {
  boolean follows=true;
  if (input.contains("ei")) {
    if (!input.contains("cei")) {
      follows=false;
    }
  } else if (input.contains("ie")) {
    if (input.contains("cie")) {
      follows=false;
    }
  }
  return follows;
}

int checkRule(String[] input) {
  int counter=0;
  ArrayList<String> dontFollow=new ArrayList<String>();
  for (String in : input) {
    boolean follows=true;
    if (in.contains("ei")) {
      if (!in.contains("cei")) {
        follows=false;
      }
    } else if (in.contains("ie")) {
      if (in.contains("cie")) {
        follows=false;
      }
    }
    dontFollow.add((in+" "+follows));
    if (!follows) {
      counter++;
    }
  }
  String[] out=dontFollow.toArray(new String[dontFollow.size()]);
  saveStrings("test.txt", out);
  return counter;
}
