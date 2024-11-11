import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animations/utils/my_custom_painter.dart';

class CustomAnime extends StatefulWidget {
  const CustomAnime({super.key});

  @override
  State<CustomAnime> createState() => _CustomAnimeState();
}

class _CustomAnimeState extends State<CustomAnime> {
  int count = 1;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 5),
      (timer) {
        setState(() {
          count++;
        });
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(300, 300),
              painter: MyCustomPainter(color: const Color.fromARGB(255, 255, 201, 4), count: count, radius: 160,width: 1.85),
            )
          ],
        ),
      ),
    );
  }


}
