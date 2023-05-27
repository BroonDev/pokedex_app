import 'dart:convert';

class PokemonDetailModel {
  int id;
  String name;
  String? image;
  int weight;
  int height;
  List<String>? moves;
  List<String>? type;
  String? description;
  List<Map<String, dynamic>>? stats;

  PokemonDetailModel({
    required this.id,
    required this.name,
    this.image,
    required this.weight,
    required this.height,
    this.moves,
    this.type,
    this.description,
    this.stats,
  });

  PokemonDetailModel copyWith({
    int? id,
    String? name,
    String? image,
    int? weight,
    int? height,
    List<String>? moves,
    List<String>? type,
    String? description,
    List<Map<String, dynamic>>? stats,
  }) {
    return PokemonDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      moves: moves ?? this.moves,
      type: type ?? this.type,
      description: description ?? this.description,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'weight': weight,
      'height': height,
      'moves': moves,
      'type': type,
      'description': description,
      'stats': stats,
    };
  }

  factory PokemonDetailModel.fromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>> stat = [];

    for (var element in (map['stats'] as List)) {
      stat.add({element['stat']['name']: element['base_stat']});
    }

    List<String> types = [];
    (map['types'] as List)
        .forEach(((element) => types.add(element['type']['name'])));

    List<String> abilities = [];
    (map['abilities'] as List)
        .forEach(((element) => abilities.add(element['ability']['name'])));

    return PokemonDetailModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['sprites']['other']['official-artwork']['front_default'] ?? "",
      weight: map['weight']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
      moves: abilities,
      type: types,
      description: map['description'],
      stats: stat,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonDetailModel.fromJson(String source) =>
      PokemonDetailModel.fromMap(json.decode(source));
}
