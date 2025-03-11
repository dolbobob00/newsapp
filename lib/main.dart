import 'package:flutter/material.dart';
import 'package:newsapp/src/repositories/news_repository.dart';
import 'package:newsapp/src/routes/routes.dart';
import 'package:provider/provider.dart';

import 'src/providers/news_provider.dart';
import 'src/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsProvider(
            NewsRepository(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Builder(
        builder: (context) => MaterialApp.router(
          routerConfig: mainRouter,
          title: 'N O W A',
          theme: context.watch<ThemeProvider>().currentTheme,
        ),
      ),
    );
  }
}
