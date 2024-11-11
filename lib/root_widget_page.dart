import 'package:flutter/material.dart';
import 'package:flutter_animations/custom_painter_anime_one.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAnime(),
    );
  }
}
