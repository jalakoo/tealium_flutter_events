class Event {
  String id;
  String name;
  double lat;
  double lon;
  String address;
  int utcTsStart;
  int utcTsEnd;
  String url;
  int utcTsUpdated;

  Event(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.address,
      this.utcTsStart,
      this.utcTsEnd,
      this.url,
      this.utcTsUpdated});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    utcTsStart = json['utc_ts_start'];
    utcTsEnd = json['utc_ts_end'];
    url = json['url'];
    utcTsUpdated = json['utc_ts_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['address'] = this.address;
    data['utc_ts_start'] = this.utcTsStart;
    data['utc_ts_end'] = this.utcTsEnd;
    data['url'] = this.url;
    data['utc_ts_updated'] = this.utcTsUpdated;
    return data;
  }
}
