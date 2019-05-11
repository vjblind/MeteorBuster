JSONObject json;
JSONArray values;
PFont font;
PFont font2;

color fillVal = color(126);
JSONArray cities;
float[] cxx=new float[1],cyy=new float[1];
PImage icon;PImage city;
 String Console="| :";
String[] a=new String[1];;
String[] k=new String[1];
float[] xx=new float[1],yy=new float[1];
int[] masse=new int[1];

String[] citie=new String[1];
float[]  memori=new float[3] ;
 int h = hour();    // Values from 0 - 23
 
void setup() {key='_';
size(1980,1080); icon= loadImage("data/icons8-asteroid-64.png");
 icon.filter(INVERT);
 h+=4;
 h*=3;
 city= loadImage("data/icons8-company-48.png"); 
 
  // The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("Constantia-BoldItalic-48.vlw");
 font2 = loadFont("Bahnschrift-48.vlw");
  json = new JSONObject();
values =  loadJSONArray("data/y77d-th95.json");
cities =  loadJSONArray("data/cities.json");


 a=expand(a,values.size());
 k=expand(k,values.size());
  cxx=expand(xx,cities.size());
  cyy=expand(yy,cities.size());
  xx=expand(xx,values.size());
  yy=expand(yy,values.size());
  
  masse=expand(masse,values.size());
  citie=expand(citie,cities.size());
  
   for(int i =0;i<cities.size();i++){
   JSONObject test= cities.getJSONObject(i);
    cyy[i]= float( test.getString("lat"));
    cxx[i]= float( test.getString("lng"));
    citie[i] = test.getString("name");
    
    
    
  
  } 
  
  
  
 for(int i =0;i<values.size();i++){
 JSONObject test= values.getJSONObject(i);
 
 
 int id= test.getInt("id");
  String name= test.getString("name");
  String fall= test.getString("fall");  
   try {
     masse[i]= test.getInt("mass");

  }  
 catch ( Exception e  ) {
   // e.printStackTrace();
  
  }

if(test.getJSONObject("geolocation")!=null){
  JSONObject ee= test.getJSONObject("geolocation");
 String Type= ee.getString("type");
  
    JSONArray  coordinate= ee.getJSONArray("coordinates");
    yy[i]= coordinate.getFloat(1);//lat
   xx[i]= coordinate.getFloat(0);//lng

  
 a[i]=id+""
 ;
  k[i]=name+"   "+Type;}
 }
  //saveJSONObject(json, "data/aaa.json");
}
void draw(){
h%=900;
  background(25); 
 fill(250,150,0,25);
 rect (1045,0,300,1000); 
 int speed=2000;
  fill(250);
textSize(12);
 stroke(250);   for(int i =0;i<values.size();i++){
text( ""+a[ (mouseX+(millis()/speed)+i)%values.size()],1050,50+i*15);
text( ""+k[ (mouseX+(millis()/speed+i))%values.size()],1150,50+i*15);
 
 ellipse(+500+xx[(mouseX+(millis()/speed+1))%values.size()]*3 
 ,500 +yy[(mouseX+(millis()/speed+1))%values.size()] *-3, 10,10);
 }

 text( xx[ (mouseX+(millis()/speed+1))%values.size()],500,50);
 text( yy[ (mouseX+(millis()/speed+1))%values.size()],500,100);
 text( masse[ (mouseX+(millis()/speed+1))%values.size()],600,100);

 
 
 fill(250,150,50);
 textSize(20);
    try {
text(k[ (mouseX+(millis()/speed+1))%values.size()],400,75);
    }  
 catch ( Exception e  ) {
   // e.printStackTrace();
  
  }
  textSize(32);
 
  if(keyPressed&&Console.length()<12 && key!='|' )Console+=key;
  
   //if (keyPressed )  println(key);
     text( Console,450,150);
  String[] m1 = match(Console, "del");

  
  
  
   String[] m2 = match(Console, "<");
if (Console.length()>10||m2 != null) {  m2 = split(Console, "<");     }
      String[] m3 = match(Console, ">");
if (Console.length()>10||m3 != null) { m3 = split(Console, ">");      }
   
//if(m2 != null) text( "Lat"+m2[0],700,150);
   
//if(m3 != null ) text( "Lng"+m3[0],700,200);
textFont(font, 16);
  text( ((500- ( memori[0] ))*-1)/3+"  "+(500-memori[1] )/-3,200,250);

 if (Console.length()>11||m1 != null) {  Console="| :";  }
 
 if (mousePressed){memori[0]=mouseX;memori[1]=mouseY ;  }

 image(icon,325,750);  
 

 
pushStyle(); 
textFont(font, 32);
 
 text("METEOR/BUSTER",400,800);
  textSize(9);
 text("data provided by nasa",500,850);

 popStyle();textFont(font2, 32);
  stroke(250,150,0,50);line(500+h , 100, 500+h, 800); 
for(int i =0;i<12;i++){line(100+(i*(950/12)),700,100+(i*(950/12)),150);}
 noStroke();
 

 for(int i =0;i<cities.size();i++){
   

fill(250,150,0,50);
 rect(500+ cxx[  i]*3,500 +cyy[ i] *-3, 1,1);
 
 
 fill(250 );
   textSize(12);
  if(i*15<600) text(""+citie[ (mouseX+(millis()/speed+i))%values.size()],110,150+i*15);
 }
 
   
 
 
   for(int i =0;i<values.size();i++){
    int d=masse[i];
    ///if(i-int(mouseX+(millis()/150)+i)%values.size()>1)d=50;
    if(masse[i]>100000)d=0;
     try { 
     
     
     float dd=150;
  /* for(int j =0;j<10;j++) {
 //dd= dist(cyy[(int)random(cities.size())]  , cxx[(int)random(cities.size())],xx[ i],yy[ i]);
 }*/
 
 fill(250,dd,80,50);
 ellipse(500+ xx[ i]*3 ,500 +yy[ i] *-3, d/5000 ,d /5000);
 }  
 catch ( Exception e  ) {
    e.printStackTrace();
  
  } fill(250);
     ellipse(+500+ xx[ i]*3 ,500 +yy[ i] *-3, 1,1);
 }
 
tint(250, 53, 0);
 image(city,-16+memori[0],-10+memori[1],25,25);
 
 
 stroke(250,50);  
 noFill();
bezier(210,150+1*15, 
150+cxx[ (mouseX+(millis()/speed+  1))]*3
 , 500 +cyy[(mouseX+(millis()/speed+1))] *-3,
 600, +1*15,500+cxx[ (mouseX+(millis()/speed+  1))]*3
 , 500 +cyy[(mouseX+(millis()/speed+1))] *-3);
}
