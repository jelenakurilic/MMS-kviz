import java.util.ArrayList;
import java.util.List;

//lista pitanja
ArrayList<Pitanje> listaPitanja = new ArrayList();
int indeksPitanja = 0;
int tocnoOdg;
int h =0;
char o = '0';
ArrayList<Pitanje> pomocnaLista = new ArrayList();

//status programa, opcije:
final int uTijeku=0;
final int kraj=1;
final int odgovorenoPitanje=2;
final int topRated =3;
int time = 30;
int startTime = 0;
int waitTime = 0;

//trenutni status označvam varijablom status
int status = uTijeku; 

int vrijeme;
int cekaj = 1500;
boolean otkucaj = false;
//sva pitanja spremim u polje
String[] poljePitanja;
int[] tocniOdgovori;
IntList topDeset = new IntList();

void setup(){
  size(800,400);
  
  //ucitavanje pitanja i odgovora
  poljePitanja = loadStrings("pitanja.txt");
  String[] tocni = loadStrings("odgovori.txt")[0].split(",");
  
  tocniOdgovori = new int[tocni.length];
  for(int i = 0; i < tocni.length; i++) {
    tocniOdgovori[i] = Integer.parseInt(tocni[i]);
  }
  
  String[] rang = loadStrings("topDeset.txt");
  if(rang.length !=0) {
    for(int i = 0; i < rang.length; i++) {
      topDeset.append(Integer.parseInt(rang[i]));   
    }
  }
   
  topDeset.sortReverse();
  pocetnoStanje();
}

void draw() {
  
  background(220);
  textFont(createFont("SansSerif", 18));
  int ukupnoPitanja= listaPitanja.size();
  
  drawTimer();
    
  switch(status) {
    case uTijeku:
      listaPitanja.get(indeksPitanja).display();
      drawHover(); 
      time = 30 - (millis()-startTime)/1000;
      if(time <= 0) {
        status = kraj;
        zapisiRezultat();
      }
      break;
    case odgovorenoPitanje:
      waitTime = millis();
      listaPitanja.get(indeksPitanja).display();
      //ako je tocno ----- inače ----
      if(listaPitanja.get(indeksPitanja).check(o)) {
        fill(0,180,0,70);
        drawBox("+10");
        h=1;
      }
      else{
        fill(180,0,0,70);
        drawBox("-5");
        h=0;
      }
      if(millis()-vrijeme>=cekaj)
      {
        status = uTijeku;
        indeksPitanja++;
        otkucaj = true;
        vrijeme = millis();
        
        if(h==1) tocnoOdg+=10;
        else tocnoOdg -=5;
        
        startTime += cekaj;
      }
      if(indeksPitanja>listaPitanja.size()-1)
      {
        status = kraj;
        tocnoOdg += time;
        zapisiRezultat();
      }
      break;
    case kraj:
      drawKraj();
      break;
  }
}

void keyPressed()
{
  switch(status) {
    case uTijeku:
      if(key>='a' && key <='d')
      {
        o = key;
        status = odgovorenoPitanje;
        vrijeme = millis();
      }
      break;
    case kraj:
      if(key=='r') {
          pocetnoStanje();
      }
      break;
    default:
       break;  
  }
}

void mousePressed()
{
  switch(status) {
    case uTijeku:
      if(mouseX>=31 && mouseX<=237 && mouseY>=63 && mouseY<=85){
        o = 'a';
      }
      else if(mouseX>=31 && mouseX<=237 && mouseY>=113 && mouseY<=135){
        o = 'b';
      }
      else if(mouseX>=31 && mouseX<=237 && mouseY>=163 && mouseY<=185){
        o = 'c';
      }
      else if(mouseX>=31 && mouseX<=237 && mouseY>=213 && mouseY<=235){
        o = 'd';
      }
      else break;
      status = odgovorenoPitanje;
      vrijeme = millis();
      break;
     default:
      break;
  }
}
