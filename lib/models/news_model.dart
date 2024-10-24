class ArticleModel {
  final String title;
  final String subTitle;
  final String? image;
  final String url;

  ArticleModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.url,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      subTitle: json['description'] ?? '',
      image: json['urlToImage'],
      url: json['url'],
    );
  }
}
