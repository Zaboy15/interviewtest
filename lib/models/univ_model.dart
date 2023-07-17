class UnivModel {
  UnivData? data;

  UnivModel({this.data});

  UnivModel.fromJson(Map<String, dynamic> json) {
    data = json == null ? null : UnivData.fromJson(json);
  }
}

class UnivData {
  List<String>? webPages;
  List<String>? domains;
  Country? country;
  String? name;
  dynamic stateProvince;
  AlphaTwoCode? alphaTwoCode;

  UnivData({
    this.webPages,
    this.domains,
    this.country,
    this.name,
    this.stateProvince,
    this.alphaTwoCode,
  });

  factory UnivData.fromJson(Map<String, dynamic> json) => UnivData(
        webPages: json["web_pages"] == null
            ? []
            : List<String>.from(json["web_pages"]!.map((x) => x)),
        domains: json["domains"] == null
            ? []
            : List<String>.from(json["domains"]!.map((x) => x)),
        country: countryValues.map[json["country"]]!,
        name: json["name"],
        stateProvince: json["state-province"],
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
      );

  Map<String, dynamic> toJson() => {
        "web_pages":
            webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
        "domains":
            domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "country": countryValues.reverse[country],
        "name": name,
        "state-province": stateProvince,
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
      };
}

enum AlphaTwoCode { ID }

final alphaTwoCodeValues = EnumValues({"ID": AlphaTwoCode.ID});

enum Country { INDONESIA }

final countryValues = EnumValues({"Indonesia": Country.INDONESIA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
