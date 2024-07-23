class ArticleModel{
  late final String title;
  late final String author;
  late final String url;

  ArticleModel({required this.title, required this.author, required this.url});

  ArticleModel.fromJson(Map json){
    author = json['author'];
    title = json['title'];
    url = json['url'];
  }
}