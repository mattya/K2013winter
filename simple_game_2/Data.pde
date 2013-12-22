class Data{
  XML[] bullets;
  
  void load_bullet_data(){
    XML xml = loadXML("./bullet_data.xml");
    bullets = xml.getChildren("bullet");
  }
}
