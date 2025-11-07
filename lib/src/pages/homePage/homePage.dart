import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';
import 'package:flutter_news_app/src/pages/newsDetail/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'bloc/bloc.dart';
import 'widget/newsCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// 📰 Header news (top big image + title)
  Widget _headerNews(Article article) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            context.read<DetailBloc>().add(SelectNewsForDetail(article: article));
            Navigator.pushNamed(context, '/detail');
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Hero(
                tag: 'headerImage',
                child: customImage(article.urlToImage ?? ''),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 10, bottom: 20, top: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.title ?? '',
                      style: AppTheme.h4Style.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      article.getTime(),
                      style: AppTheme.subTitleStyle.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// 🧱 Main body with Slivers
  Widget _body(
    BuildContext context,
    List<Article> list, {
    required String type,
  }) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          pinned: true,
          title: Text(
            '${type.toUpperCase()} NEWS',
            style: AppTheme.h2Style.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        SliverToBoxAdapter(
          child: _headerNews(list.first),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => NewsCard(
              article: list[index],
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            Theme.of(context).colorScheme.background,
        statusBarColor:
            Theme.of(context).colorScheme.background,
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is Failure) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }

            if (state is Loaded) {
              if (state.items.isEmpty) {
                return const Center(child: Text('No content available'));
              } else {
                return _body(
                  context,
                  state.items,
                  type: state.type,
                );
              }
            }

            // Default loading state
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
