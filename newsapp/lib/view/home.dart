import 'package:flutter/material.dart';

import 'package:newsapp/view/widgets/newscontainer.dart';

import '../Controller/FetchNews.dart';
import '../model/newsArt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArt newsArt;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    GetNews();
  }

  GetNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            if (value == 0) {
              setState(() {
                isLoading = true;
              });
              GetNews();
            } else {
              setState(() {
                isLoading = false;
              });
            }
          },
          itemBuilder: (context, index) {
            return isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    imageUrl: newsArt.imageUrl,
                    newsHeading: newsArt.newsHeading,
                    newsDescription: newsArt.newsDescription,
                    newsContent: newsArt.newsContent,
                    newsUrl: newsArt.newsUrl);
          }),
    );
  }
}
