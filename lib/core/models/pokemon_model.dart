import 'dart:convert';

class PokemonModel {
  int id;
  String name;
  String? image;

  PokemonModel({
    required this.id,
    required this.name,
    required this.image,
  });

  PokemonModel copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['sprites']['other']['official-artwork']['front_default'] ?? "",
    );
  }

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());
}
