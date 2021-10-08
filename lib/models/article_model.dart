import 'package:http_with_dio/models/source_model.dart';

class ArticleModel {
  late SourceModel source;
  // late String author;
  late String title;
  late String urlToImage;

  ArticleModel(
      {required this.source,
      // required this.author,
      required this.title,
      required this.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        source: SourceModel.fromJson(json['source']),
        // author: json['author'] as String ?? ,
        title: json['title'] as String,
        urlToImage: json['urlToImage'] as String);
  }
}
