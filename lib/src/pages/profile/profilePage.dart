import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/customWidget.dart';
import 'package:flutter_news_app/src/theme/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget _headerWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: customAdvanceNetworkImage(
                  'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg',
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'TheAlphamerc',
                    style:
                        AppTheme.h2Style.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text('Loyal Reader', style: AppTheme.h5Style),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: <Widget>[
              _estimateWidget('Followers', '826'),
              _estimateWidget('Following', '251'),
              _estimateWidget('News Read', '81K'),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
        ],
      ),
    );
  }

  static Widget _estimateWidget(String text, String count) {
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              count,
              style: AppTheme.h4Style.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(text, style: AppTheme.h5Style),
          ],
        ),
      ),
    );
  }

  Widget _settingRow(
    BuildContext context,
    IconData icon,
    String text,
    bool isEnabled, {
    int index = 0,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: isEnabled
          ? Theme.of(context).primaryColor.withAlpha(50)
          : Theme.of(context).colorScheme.background,
      child: Row(
        children: <Widget>[
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTheme.h4Style.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Switch(
            activeColor: Theme.of(context).primaryColor,
            inactiveTrackColor: Theme.of(context).disabledColor,
            value: isEnabled,
            onChanged: (value) {
              if (index == 1) {
                BlocProvider.of<ThemeBloc>(context).add(
                  value ? LightMode() : DarkMode(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _logout(BuildContext context, IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTheme.h3Style.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          bool isLightTheme = true;
          if (state is SelectedTheme) {
            isLightTheme = state.themeType == ThemeType.Light;
          }

          return SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(child: _headerWidget(context)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _settingRow(
                          context,
                          Icons.lightbulb_outline,
                          'Night Mode',
                          !isLightTheme,
                          index: 1,
                        ),
                        _settingRow(
                          context,
                          Icons.notifications,
                          'Notifications',
                          false,
                        ),
                        _settingRow(
                          context,
                          Icons.share,
                          'Social Media',
                          false,
                        ),
                        const SizedBox(height: 5),
                        const Divider(indent: 20, endIndent: 20, height: 0),
                        const SizedBox(height: 5),
                        _logout(context, Icons.exit_to_app, 'Logout'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
