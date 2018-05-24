JSONObject planesList;
JSONArray list;
ArrayList<Plane> planes=new ArrayList<Plane>();
float testLat=40.6413, testLon=73.7781;

void setup() {

  planesList=loadJSONObject("https://"+"opensky-network.org/api/states/all");
  //planesList=loadJSONObject("planes.txt");
  //saveJSONObject(planesList, "planes.txt");
  list=planesList.getJSONArray("states");

  for (int i=0; i<list.size(); i++) {
    JSONArray split=list.getJSONArray(i);
    //printArray(split);
    String icao=split.getString(0);
    String call=(split.getString(1)==null?null:split.getString(1));
    String origin=split.getString(2);
    float lon, lat, geo_alt;
    if (split.isNull(5)) {
      lon=0;
    } else {
      lon=split.getFloat(5);
    }
    if (split.isNull(6)) {
      lat=0;
    } else {
      lat=split.getFloat(6);
    }
    if (split.isNull(7)) {
      geo_alt=0;
    } else {
      geo_alt=(split.getFloat(7));
    }
    planes.add(new Plane(lon, lat, geo_alt, icao, origin, call));
    //println(planes.get(i).pos);
  }
  //println(getNearestPlane(planes,48.8584,2.2945).pos);
  getNearestPlane(planes, testLat, testLon).out();
}


Plane getNearestPlane(ArrayList<Plane> planes, float testLat, float testLon) {
  Plane nearest;
  float record=1000000000;
  int index=0;
  for (Plane p : planes) {
    if (p.pos.x==0||p.pos.y==0) {
    } else {
      float d=dist(p.pos.x, p.pos.y, testLat, testLon);
      if (d<record) {
        p.distToP=d;
        record=dist(p.pos.x, p.pos.y, testLat, testLon);
        index=planes.indexOf(p);
      }
    }
  }
  nearest=planes.get(index);

  return nearest;
}
