import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/pages/homePage/bloc/bloc.dart';
import 'package:flutter_news_app/src/pages/homePage/widget/newsCard.dart';
import 'package:flutter_news_app/src/pages/newsDetail/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class VideoNewsPage extends StatelessWidget {
  const VideoNewsPage({super.key});

  Widget _headerNews(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        context.read<DetailBloc>().add(SelectNewsForDetail(article: article));
        Navigator.pushNamed(context, '/detail');
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              customImage(article.urlToImage, fit: BoxFit.cover),
              // Gradient overlay for readability
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 10, bottom: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      article.title ?? 'No Title',
                      style: AppTheme.h2Style.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      article.getTime(),
                      style: AppTheme.subTitleStyle.copyWith(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Play button
              Positioned(
                bottom: 10,
                right: 10,
                child: _playWidget(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _playWidget(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Icon(
        Icons.play_arrow,
        color: Theme.of(context).colorScheme.onSurface,
        size: 28,
      ),
    );
  }

  Widget _body(
    BuildContext context,
    List<Article> list, {
    required String type,
  }) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            '${type.toUpperCase()} NEWS',
            style: AppTheme.h2Style.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          pinned: true,
          floating: true,
          elevation: 3,
        ),
        // Top featured carousel
        SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: PageView.builder(
              itemCount: list.length < 5 ? list.length : 5,
              itemBuilder: (context, index) =>
                  _headerNews(context, list[index]),
            ),
          ),
        ),
        // List of news articles
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => NewsCard(
              article: list[index],
              isVideoNews: true,
              type: type.toUpperCase(),
            ),
            childCount: list.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is Failure) {
              return const Center(child: Text('Something went wrong'));
            } else if (state is Loaded) {
              if (state.items.isEmpty) {
                return const Center(child: Text('No content available'));
              }
              return _body(context, state.items, type: state.type);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
