
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animations/utils/my_custom_painter.dart';

class IndianFlag extends StatefulWidget {
  const IndianFlag({super.key});

  @override
  State<IndianFlag> createState() => _IndianFlagState();
}

class _IndianFlagState extends State<IndianFlag> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                flagStick(size),
                Flag(size: size, count: count),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

  Container flagStick(Size size) {
    return Container(
      height: size.height / 2,
      width: 10,
      decoration: BoxDecoration(
        gradient: commonGradient(),
        boxShadow: commonShadow(),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
    );
  }

  BoxDecoration commonDecoration({BoxShape shape = BoxShape.rectangle}) {
    return BoxDecoration(
      shape: shape,
      gradient: commonGradient(),
      boxShadow: commonShadow(),
      border: Border.all(
        color: Colors.grey[400]!,
        width: 1,
      ),
    );
  }

  LinearGradient commonGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.grey[300]!, // Light silver
        Colors.grey[400]!, // Mid silver
        Colors.grey[600]!, // Darker silver
        Colors.grey[500]!, // Mid-dark silver
      ],
      stops: const [0.1, 0.4, 0.7, 0.9],
    );
  }
class Flag extends StatelessWidget {
  const Flag({
    super.key,
    required this.size,
    required this.count,
  });

  final Size size;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: Column(
          children: [
            Container(
              height: 60,
              width: size.width,
              color: Colors.orange,
            ),
            Container(
              height: 60,
              width: size.width,
              color: Colors.white,
              child: Center(
                child: CustomPaint(
                  size: const Size(100, 100),
                  painter: MyCustomPainter(
                      count: count,
                      color: const Color.fromARGB(255, 43, 24, 250)),
                ),
              ),
            ),
            Container(
              height: 60,
              width: size.width,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

List<BoxShadow> commonShadow() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: const Offset(2, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
    // Inner highlight
    BoxShadow(
      color: Colors.white.withOpacity(0.6),
      offset: const Offset(-2, -2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];
}
