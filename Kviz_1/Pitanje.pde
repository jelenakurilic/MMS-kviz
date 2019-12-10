class Pitanje {
  String tekstPitanja;
  String odg1, odg2, odg3, odg4;
  int tocanOdgovor;
  int pozicijaX, pozicijaY;

  
  Pitanje(String tp, String o1, String o2, String o3, String o4, int tocan, int x, int y)
  {
    tekstPitanja = tp;
    odg1 = o1;
    odg2 = o2;
    odg3 = o3;
    odg4 = o4;
    tocanOdgovor = tocan;
    pozicijaX = x;
    pozicijaY = y;
    tocnoOdg=0;
  }
  
  void display() {
    fill(210,7,7);
    textSize(20);
    text((indeksPitanja+1)+". "+tekstPitanja, pozicijaX, pozicijaY);
    fill(0,102,150);
    textSize(16);
    text(" A) "+odg1, pozicijaX, pozicijaY+50);
    text(" B) "+odg2, pozicijaX, pozicijaY+100);
    text(" C) "+odg3, pozicijaX, pozicijaY+150);
    text(" D) "+odg4, pozicijaX, pozicijaY+200);
    fill(0);
    //textSize(13);
    //text("Na tipkovnici odaberi broj uz točan odgovor.", pozicijaX, pozicijaY+130);
  }
  
  boolean check(char keyToTest) {
    if(keyToTest=='a' && tocanOdgovor==1)  return true;
    if(keyToTest=='b' && tocanOdgovor==2)  return true; 
    if(keyToTest=='c' && tocanOdgovor==3)  return true; 
    if(keyToTest=='d' && tocanOdgovor==4)  return true; 
    return false;
  }
}
