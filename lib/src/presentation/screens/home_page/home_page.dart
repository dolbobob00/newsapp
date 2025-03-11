import 'package:flutter/material.dart';
import 'package:newsapp/src/presentation/screens/home_page/separated_widgets/home_page_content.dart';
import 'package:provider/provider.dart';

import '../../../providers/news_provider.dart';
import '../../../providers/theme_provider.dart';
import '../../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Home Page'),
            Row(
              children: [
                const Text('Change theme to:'),
                Consumer<ThemeProvider>(
                  builder: (context, provider, child) {
                    return IconButton(
                      icon: Icon(
                        provider.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      onPressed: () => provider.toggleTheme(),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SearchField(),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () => context.read<NewsProvider>().fetchNews(),
              child: const HomePageContent(),
            ),
          ),
        ],
      ),
    );
  }
}
