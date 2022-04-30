class ArticleModel{
  final author;
  final title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  

  //either use String? to declare nullable or non-nullable type or declare final

  // ArticleModel({this.author,})
  ArticleModel({this.author, this.title, this.description, this.url, this.urlToImage, this.content});
}