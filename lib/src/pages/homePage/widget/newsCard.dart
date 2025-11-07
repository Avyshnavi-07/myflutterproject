import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/pages/newsDetail/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final bool isVideoNews;
  final String type;

  const NewsCard({
    super.key,
    required this.article,
    this.isVideoNews = false,
    this.type = '',
  });

  Widget _playWidget(BuildContext context) {
    return SizedBox(
      height: 20,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          height: 10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
          child: Icon(
            Icons.play_arrow,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 3,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DetailBloc>().add(SelectNewsForDetail(article: article));
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: (article.urlToImage == null ||
                              article.urlToImage!.isEmpty)
                          ? const SizedBox.shrink()
                          : customImage(article.urlToImage!, fit: BoxFit.cover),
                    ),
                    if (isVideoNews) _playWidget(context),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(),
                  SizedBox(
                    height: 52,
                    child: Text(
                      article.title ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          type,
                          style: AppTheme.h6Style.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          article.publishedAt != null
                              ? article.getDateOnly()
                              : '',
                          style: AppTheme.subTitleStyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
