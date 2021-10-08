class DummyModel {
  late int uid;
  late String title;
  late String body;

  DummyModel({
    required this.uid,
    required this.title,
    required this.body,
  });

  factory DummyModel.fromJson(Map<String, dynamic> json) {
    return DummyModel(
        uid: json['id'], title: json['title'], body: json['body']);
  }
}
