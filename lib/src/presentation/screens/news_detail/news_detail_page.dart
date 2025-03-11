import 'package:flutter/material.dart';
import 'package:newsapp/src/presentation/screens/news_detail/separated_widgets/id_info_card.dart';
import '../../../domain/models/news_model.dart';
import 'separated_widgets/sliver_app_bar.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel news;

  const NewsDetailPage({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarForNews(
            id: news.id.toString(),
            title: news.title,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IdInfoCard(
                    id: news.id.toString(),
                    userId: news.userId.toString(),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news.body,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
