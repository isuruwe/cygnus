
import 'dart:convert';


class maril {
  String? id;
  String? name;

  maril({this.id, this.name});

  maril.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}List<maril> marilFromJson1(String str) =>
    List<maril>.from(json.decode(str).map((x) => maril.fromJson(x)));