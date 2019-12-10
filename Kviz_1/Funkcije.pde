void pocetnoStanje() {
  indeksPitanja=0;
  status=uTijeku;
  tocnoOdg=0;
  time = 30;
  int i2=0;
         
  pomocnaLista= new ArrayList();
  listaPitanja= new ArrayList();
  for (int i=0; i<poljePitanja.length; i+=5) {
      Pitanje trenutnoPitanje = new Pitanje(poljePitanja[i], poljePitanja[i+1],poljePitanja[i+2], poljePitanja[i+3],poljePitanja[i+4], tocniOdgovori[i2], 30, 30);
      pomocnaLista.add(trenutnoPitanje);
      i2++;
    }
  
  while(pomocnaLista.size() != 0) {
     int indeks = (int)random(pomocnaLista.size());
     listaPitanja.add(pomocnaLista.get(indeks));
     pomocnaLista.remove(indeks);
   }
  startTime = millis();
}

void drawTimer() {
  stroke(0,0,255);
  noFill();
  circle(width-85, height-65, 100);
  stroke(255,0,0);
  noFill();
  circle(width-85, height-65, 110);
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text(time, width-85, height-52);
  textAlign(LEFT);
}
void drawHover() {
   if(mouseX>=31 && mouseX<=237 && mouseY>=63 && mouseY<=85){
      fill(120,70);
      noStroke();
      rect(31,63,204,22,7);
    }
    if(mouseX>=31 && mouseX<=237 && mouseY>=113 && mouseY<=135){
      fill(120,70);
      noStroke();
      rect(31,113,204,22,7);
    }
    if(mouseX>=31 && mouseX<=237 && mouseY>=163 && mouseY<=185){
      fill(120,70);
      noStroke();
      rect(31,163,204,22,7);
    }
    if(mouseX>=31 && mouseX<=237 && mouseY>=213 && mouseY<=235){
      fill(120,70);
      noStroke();
      rect(31,213,204,22,7);
    }
}

void drawBox(String text) {
  noStroke();
  switch(o){
    case '1':
      rect(31,63,204,22,7);
      stroke(0,180,0);
      text(text,236,80);
      break;
    case '2':
      rect(31,113,204,22,7);
      stroke(0,180,0);
      text(text,236,130);
      break;
    case '3':
      rect (31,163,204,22,7);
      stroke(0,180,0);
      text(text,236,180);
      break;
    case '4':
      rect(31,213,204,22,7);
      stroke(0,180,0);
      text(text,236,230);
      break;
  }
}

void zapisiRezultat() {
  if(topDeset.size() < 10) {
     topDeset.append(tocnoOdg);
  }else if(tocnoOdg >= topDeset.min()) {
    topDeset.remove(9);
    topDeset.append(tocnoOdg);
  }
  
  String[] save = new String[topDeset.size()];
  for(int i = 0; i < topDeset.size(); i++) {
    save[i] = Integer.toString(topDeset.array()[i]);
  }
  saveStrings("data/topDeset.txt", save);
}
