//stvara pocetno stanje igre, odnosno resetira igru
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

//crta timer
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

//crta zatamnjeni pravokutnik
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

//crta pravokutnik koji se kasnije oboja ovisno o tocnosti odgovora
void drawBox(String text) {
  noStroke();
  switch(o){
    case 'a':
      rect(31,63,204,22,7);
      stroke(0,180,0);
      text(text,236,80);
      break;
    case 'b':
      rect(31,113,204,22,7);
      stroke(0,180,0);
      text(text,236,130);
      break;
    case 'c':
      rect (31,163,204,22,7);
      stroke(0,180,0);
      text(text,236,180);
      break;
    case 'd':
      rect(31,213,204,22,7);
      stroke(0,180,0);
      text(text,236,230);
      break;
  }
}

//crta zavrsni zaslon
void drawKraj() {
  textFont(createFont("SansSerif", 18));
  fill(11,138,6);
  text("Kviz je završio.Vaš rezultat je "+tocnoOdg+".", 100, 100);
  text("Kliknite R za ponovo igranje",100,125);
  
  int j = 0;
  topDeset.sortReverse();
  text("Top 10:", width-250, 100);
  for(int i : topDeset) {
    if(j==9)
      text(++j+". "+i,width-250,100+25*j);
    else
      text("  "+(++j)+". "+i,width-250,100+25*j);
  }
  
  textFont(createFont("orange-juice.ttf", 40));
  text("KRAJ", 50, 50);
  textFont(createFont("SansSerif", 18));
}

//zapisuje rezultate u datoteku ž
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
