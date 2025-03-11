import 'package:flutter/material.dart';
import 'package:newsapp/src/presentation/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../providers/news_provider.dart';
import '../../../widgets/my_loading_circle.dart';
import '../../../widgets/share_button.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CustomLoadingCircle());
        }
        if (provider.error != null) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Error: ${provider.error}',
                ),
                ElevatedButton(
                  onPressed: () => provider.fetchNews(),
                  child: Text(
                    'Retry?',
                  ),
                ),
              ],
            ),
          );
        }
        
        final news = provider.filteredNews;
        if (news == null || news.isEmpty) {
          return const Center(
            child: Text('No news found'),
          );
        }

        return ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) => CustomListTile(
            onTap: () {
              context.pushNamed(
                'news_detail',
                extra: news[index],
              );
            },
            trailing: ShareButton(
              idOfNews: news[index].id.toString(),
            ),
            title: news[index].title,
            subtitle: news[index].body.isNotEmpty
                ? Text(
                    news[index].body.length > 100
                        ? '${news[index].body.substring(0, 100)}...'
                        : news[index].body,
                  )
                : null,
          ),
        );
      },
    );
  }
}
