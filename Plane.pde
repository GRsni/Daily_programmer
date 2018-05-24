class Plane {
  PVector pos;
  String origin, callsign, icao_24;
  float geoAlt;
  String ID;
  float distToP;

  Plane(float lon, float lat, float geoA, String icao, String call, String or) {
    icao_24=icao;
    callsign=call;
    pos=new PVector(lon, lat);
    origin=or;
    geoAlt=geoA;
  }

  void out() {
    println("Distance to check: "+distToP);
    println("Lattitude and Longitude: "+pos.x+", "+pos.y);
    println("Geometric altitude: "+geoAlt);
    println("Origin: "+origin);
    println("Callsign: "+callsign);
    println("ICAO: "+icao_24);
  }
}
