import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/src/providers/news_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _initializeApp();
    _controller.forward();
  }

  Future<void> _initializeApp() async {
    context.read<NewsProvider>().fetchNews(
          showLoading: false,
        );
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.pushReplacementNamed('home');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeof = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background/splashBG5.jpg',
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment(
                    0.4,
                    -0.2,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: size.width * 0.6,
                height: size.height,
                decoration: BoxDecoration(
                  color: themeof.colorScheme.primary.withAlpha(
                    100,
                  ),
                ),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'N O W A',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                            shadows: [
                              Shadow(
                                color: themeof.colorScheme.secondary,
                                offset: const Offset(2, 2),
                                blurRadius: 2,
                              ),
                            ],
                            color: themeof.colorScheme.surface,
                          ),
                        ),
                        Text(
                          'maded as tech task',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                            shadows: [
                              Shadow(
                                color: themeof.colorScheme.inversePrimary,
                                offset: const Offset(2, 2),
                                blurRadius: 2,
                              ),
                            ],
                            color: themeof.colorScheme.surface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
