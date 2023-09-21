class MakeModels {
  final int id;
  final String name;

  MakeModels({
    required this.id,
    required this.name,
  });

  factory MakeModels.fromJson(Map<String, dynamic> json) {
    return MakeModels(
      id: json['Model_ID'] as int? ?? 0,
      name: json['Model_Name'] as String? ?? '',
    );
  }
}
