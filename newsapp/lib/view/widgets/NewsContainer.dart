import 'package:flutter/material.dart';
import 'package:newsapp/view/detail_view.dart';

// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {
  String imageUrl;
  String newsHeading;
  String newsDescription;
  String newsUrl;
  String newsContent;
  NewsContainer(
      {super.key,
      required this.imageUrl,
      required this.newsHeading,
      required this.newsDescription,
      required this.newsContent,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 6),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.network(
                imageUrl,
                height: 350,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsHeading.length > 80
                        ? "${newsContent.substring(0, 80)}..."
                        : newsHeading,
                    style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    newsDescription,
                    style: const TextStyle(fontSize: 16, color: Colors.yellow),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    newsContent != "--"
                        ? newsContent.length > 350
                            ? newsContent.substring(0, 350)
                            : "${newsContent.toString().substring(0, newsContent.length - 16)}..."
                        : newsContent,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 67, 55, 55),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailViewScreen(newsUrl: newsUrl)));
                    },
                    child: const Text(
                      "Read More",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
