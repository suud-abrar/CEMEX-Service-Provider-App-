class Fonts {
  Roboto roboto;

  Fonts () {
    roboto = new Roboto ();
  }
}

class Roboto {
  PFont regular, medium, bold;

  Roboto () {
    regular = createFont ("/data/fonts/roboto/roboto-regular.ttf", 17);
    medium = createFont ("/data/fonts/roboto/roboto-medium.ttf", 17);
    bold = createFont ("/data/fonts/roboto/roboto-bold.ttf", 17);
  }
}
class Caros {
  PFont regular, medium, bold;

  Caros () {
    regular = createFont ("/data/fonts/caros/caros-regular.otf", 17);
    medium = createFont ("/data/fonts/caros/caros-medium.otf", 17);
    bold = createFont ("/data/fonts/caros/caros-bold.otf", 17);
  }
}
