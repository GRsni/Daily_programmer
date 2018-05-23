String input="EbAAdbBEaBaaBBdAccbeebaec";
int[] scores= new int[5];
char[] names={'a', 'b', 'c', 'd', 'e'};
surface.setVisible(false);
for (int i=0; i<input.length(); i++) {
  for (int j=0; j<names.length; j++) {
    if (input.charAt(i)==names[j]) scores[j]++;
    else if (input.charAt(i)+32==names[j]) scores[j]--;
  }
}
for (int i=0; i<names.length; i++) {
  for (int j=i; j>0; j--) {
    if (scores[j]>scores[j-1]) {
      int aux=scores[j];
      char auxC=names[j];
      scores[j]=scores[j-1];
      scores[j-1]=aux;
      names[j]=names[j-1];
      names[j-1]=auxC;
    }
  }
}
for (int i=0; i<names.length; i++) {
  println(names[i]+": "+ scores[i]);
}
