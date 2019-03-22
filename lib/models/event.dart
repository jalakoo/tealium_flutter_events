// JSON representation
// {
// 	"id": "_autogen_id_",
// 	"name": "Digital Velocity SD 2019",
// 	"lat": 32.906640,
// 	"lon": -117.236840,
// 	"address": "11095 Torreyana Rd., San Diego, CA 92121",
// 	"utc_ts_start": 1554109200,
// 	"utc_ts_end": 1554224400,
// 	"url": "https;//www.digitalvelocityconference.com",
// 	"utc_ts_updated": 1552229778
// }

class Event {
  String id;
  String name;
  double lat;
  double lon;
  String address;
  int utcStart;
  int utcEnd;
  String url;
  int utcUpdated;

  Event(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.address,
      this.utcStart,
      this.utcEnd,
      this.url,
      this.utcUpdated});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    utcStart = json['utc_ts_start'];
    utcEnd = json['utc_ts_end'];
    url = json['url'];
    utcUpdated = json['utc_ts_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['address'] = this.address;
    data['utc_ts_start'] = this.utcStart;
    data['utc_ts_end'] = this.utcEnd;
    data['url'] = this.url;
    data['utc_ts_updated'] = this.utcUpdated;
    return data;
  }

  // Put formatdate function in here instead of eventDetail.dart?

}
