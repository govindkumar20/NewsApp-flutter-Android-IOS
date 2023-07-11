class NewsArt {
  String imageUrl;
  String newsHeading;
  String newsDescription;
  String newsContent;
  String newsUrl;

  NewsArt(
      {required this.imageUrl,
      required this.newsContent,
      required this.newsDescription,
      required this.newsHeading,
      required this.newsUrl});

  static NewsArt fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
        imageUrl: article["urlToImage"] ??
            "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
        newsContent: article["content"] ?? "--",
        newsDescription: article["description"] ?? "--",
        newsHeading: article["title"] ?? "--",
        newsUrl: article["url"] ??
            "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en");
  }
}
