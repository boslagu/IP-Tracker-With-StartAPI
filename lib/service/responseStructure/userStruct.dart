
class IPResponse {
  String url;
  String country;
  String city;

  IPResponse({ this.url, this.country, this.city});

  factory IPResponse.fromJson(Map<String, dynamic> json){
    return IPResponse(
      url : json["name"] as String,
      country : json["username"] as String,
      city : json["role"] as String,
    );
  }
}