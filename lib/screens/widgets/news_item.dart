
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../models/news_model.dart';
import '../desc_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.articleModel});

  final ArticleModel articleModel;

  // Future<void> launchurl() async {
  //   final Uri uri = Uri.parse(articleModel.url);
  //   if (!await launchUrl(uri)) {
  //     throw Exception('Could not launch $uri');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //launchurl();
      },
      child: Container(
        decoration: const BoxDecoration(),
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                articleModel.image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd2NAjCcjjk7ac57mKCQvgWVTmP0ysxnzQnQ&s'),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DescriptionScreen(articleModel: articleModel)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleModel.title,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 23,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      articleModel.subTitle,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 17.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
