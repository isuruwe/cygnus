import 'dart:convert';

class rel {
  String? id;
  String? name;

  rel({this.id, this.name});

  rel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
List<rel> relFromJson1(String str) =>
    List<rel>.from(json.decode(str).map((x) => rel.fromJson(x)));