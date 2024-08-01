class WeatherModel {
  String icon;
  String durum;
  String derece;
  String min;
  String max;
  String gece;
  String nem;
  String day;

  WeatherModel(this.icon, this.durum, this.derece, this.min, this.max,
      this.gece, this.nem,this.day);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
     
      json["icon"],
      json["description"],
      json["degree"],
      json["min"],
      json["max"],
      json["night"],
      json["humidity"],
       json["day"],
    );
  }
}
