import java.util.ArrayList;
import java.util.List;

//lista pitanja
ArrayList<Pitanje> listaPitanja = new ArrayList();
ArrayList<Pitanje> listaTocnihPitanja = new ArrayList();
int indeksPitanja = 0;
  int tocnoOdg;
int h =0;
ArrayList<Pitanje> pomocnaLista = new ArrayList();

//status programa, opcije:
final int uTijeku=0;
final int kraj=1;
final int odgovorenoPitanje=2;
//trenutni status označvam varijablom status
int status = uTijeku; 

int vrijeme;
int cekaj = 1500;
boolean otkucaj = false;
//sva pitanja spremim u polje
 String[] poljePitanja = {"Kada počinje godišnje doba zima?", "21.12.", "21.3.","21.6.","23.9.", "Koliko stranica ima geometrijski lik pravokutnik?","2","3","4","5",
                           "Koji je glavni grad Hrvatske?", "Split", "Osijek", "Zadar", "Zagreb", "Kako se zove naše lijepo plavo more?", "Jonsko", "Talijansko", "Baltičko", "Jadransko",
                           "Čudnovate zgode šegrta hlapića napisao/napisala je:", "August Šenoa","Ivana Brlić-Mažuranić", "Dobriša Cesarić", "Marko Marulić",
                           "Grad ne ušću rijeke Cetine je:", "Omiš","Split", "Šibenik","Makarska",
                           "Navijači Hajduka nazivaju se: ", "Bad Blude Boysi", "Kohorta",  "Torcida", "Funcuti",
                           "Sport koji se igra na ledu nazivamo:", "Nogomoet", "Košarka", "Plivanje", "Hokej",
                           "Za koju životinju kažemo da je čovjekov vjerni prijatelj?", "Krokodil","Pas","Lav","Zlatna ribica",
                           "Izbaci uljeza! Što od navedenog nije padalina?", "Sijeg", "Kiša", "Mraz", "Sunce",
                           "Koje navedeno voće NE raste na stablu: ", "Lubenica", "Kruška","Jabuka", "Breskva",
                           "Grad u Istri je: ", "Dubrovnik", "Pula","Osijek","Rab",
                           "Koliko 1 sat ima minuta?","30","40","50","60",
                           "U jednadzbi 2x=16, x iznosi:", "4","6","8","10",
                           "Prijevod za 'Good morning' glasi...", "Dobro jutro!", "Dobar dan.", "Dobra večer.", "Laku noć...",
                           "Koja navedena životinja živi u moru:", "žaba", "dupin","ptica","mrav",
                           "Prve piramide izgrađe su u:", "Irskoj","Španjolskoj", "Egiptu", "Kini", 
                           "Što od naveenog nije marka automobila: ", "BMW", "Nokia", "Audi", "Mazda",
                           "Geometrijski lik je trokut a njemu slično geometrijsko tijelo je...", "Kocka","Valjak","Kvadar","Piramida",
                           "Izbaci uljeza među nebeskim tijelima!", "Zvijezda", "Oblak", "Sunce", "Mjesec"
                          };
  int[] tocniOdgovori={1,3,4,4,2,1,3,4,2,4,1,2,4,3,1,2,3,2,4,2};

void setup(){
  size(800,400);
  vrijeme = millis();
  tocnoOdg=0;

  int i2=0;
    for (int i=0; i<poljePitanja.length; i+=5)
    {
      Pitanje trenutnoPitanje = new Pitanje(poljePitanja[i], poljePitanja[i+1],poljePitanja[i+2], poljePitanja[i+3],poljePitanja[i+4], tocniOdgovori[i2], 30, 30);
      pomocnaLista.add(trenutnoPitanje);
      i2++;
    }
   //za shuffle arrayliste
   // Collections.shuffle(listaPitanja);
   
   while(listaPitanja.size()< 10)
   {
     int indeks = (int)random(pomocnaLista.size());
     listaPitanja.add(pomocnaLista.get(indeks));
     pomocnaLista.remove(indeks);
   }
    
    
}

void draw() {
  background(220);
  int brojTocnihPitanja = listaTocnihPitanja.size();
   int ukupnoPitanja= listaPitanja.size();
  
  
  switch(status) {
    case uTijeku:
      listaPitanja.get(indeksPitanja).display();
      break;
    case odgovorenoPitanje:
      
      //ako je tocno ----- inače ----
      if(listaPitanja.get(indeksPitanja).check(key))
      {
       fill(39,185,208);
       textSize(16);
       listaTocnihPitanja.add(listaPitanja.get(indeksPitanja));
       text("Točan odgovor", 100,50);
      h=1;
      }
      else
      {
        h=0;
        fill(39,185,208);
        textSize(16);
        text("Netočan odgovor", 100,50);
      }
       if(millis()-vrijeme>=cekaj)
      {
      status = uTijeku;
      indeksPitanja++;
      otkucaj = true;
      vrijeme = millis();
      if(h==1) tocnoOdg++;
      }
      if(indeksPitanja>listaPitanja.size()-1)
      {
        status = kraj;
      }
       break;
    case kraj:
   
      fill(11,138,6);
      textSize(18);
      text("Kviz je završio.Vaš rezultat je "+tocnoOdg+"/"+ukupnoPitanja+".", 100, 100);
      text("Kliknite R za ponovo igranje",100,150);
      
  }
}

void keyPressed()
{
  switch(status) {
    case uTijeku:
      if(key>='1' && key <='4')
      {
        status = odgovorenoPitanje;
        vrijeme = millis();
      }
      break;
    case odgovorenoPitanje:
      status = uTijeku;
     // indeksPitanja++;
      if(indeksPitanja>listaPitanja.size()-1)
      {
        status = kraj;
      }
      
      break;
     case kraj:
       if(key=='r') {
         indeksPitanja=0;
         status=uTijeku;
         tocnoOdg=0;
         int i2=0;
         
        pomocnaLista= new ArrayList();
        listaPitanja= new ArrayList();
        for (int i=0; i<poljePitanja.length; i+=5)
        {
          Pitanje trenutnoPitanje = new Pitanje(poljePitanja[i], poljePitanja[i+1],poljePitanja[i+2], poljePitanja[i+3],poljePitanja[i+4], tocniOdgovori[i2], 30, 30);
          pomocnaLista.add(trenutnoPitanje);
          i2++;
          }

        while(listaPitanja.size()< 3)
        {
         int indeks = (int)random(pomocnaLista.size());
         listaPitanja.add(pomocnaLista.get(indeks));
         pomocnaLista.remove(indeks);
        }
       }
       break;
     default:
       break;  
  }
  
}

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
    text(tekstPitanja, pozicijaX, pozicijaY);
    fill(0,102,150);
    textSize(16);
    text(" 1.) "+odg1, pozicijaX, pozicijaY+25);
    text(" 2.) "+odg2, pozicijaX, pozicijaY+50);
    text(" 3.) "+odg3, pozicijaX, pozicijaY+75);
    text(" 4.) "+odg4, pozicijaX, pozicijaY+100);
    fill(0);
    textSize(13);
    text("Na tipkovnici odaberi broj uz točan odgovor.", pozicijaX, pozicijaY+130);
  }
  
  boolean check(char keyToTest) {
    if(keyToTest=='1' && tocanOdgovor==1)  return true;
    if(keyToTest=='2' && tocanOdgovor==2)  return true; 
    if(keyToTest=='3' && tocanOdgovor==3)  return true; 
    if(keyToTest=='4' && tocanOdgovor==4)  return true; 
    return false;
  }
  
  
}