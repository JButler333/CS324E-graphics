import java.util.Random;

PFont font1;
PFont font2;
PFont font3;

void setup(){
  
 //String[] fontlist = PFont.list();
 //printArray(fontlist);
 font1 = createFont("Century Schoolbook L Bold", 10);
 font2 = createFont("SansSerif.plain", 20);
 font3 = createFont("Lucida Bright Regular", 30);
 String[] lines = loadStrings("uniquewords.txt");
 for (int i = 0; i <= lines.length; i++) {
   lines[i] = lines[i].replace("\n", "");
 }
 print(lines);
}


  
