import 'dart:convert';

List<Network> networkFromJson(String str) =>
    List<Network>.from(json.decode(str).map((x) => Network.fromJson(x)));

String networkToJson(List<Network> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Network {
  String name;

  Network({
    this.name,
  });

  Network copyWith({
    String name,
  }) =>
      Network(
        name: name ?? this.name,
      );

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Network && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'Network name: $name';
}
