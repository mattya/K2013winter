XML xml;

void setup(){
  
  xml = loadXML("test.xml");
  println(xml.listChildren());
  
}
