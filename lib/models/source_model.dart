class SourceModel {
//  late String id;
  late String name;
  SourceModel({required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      SourceModel(name: json['name']);
}
