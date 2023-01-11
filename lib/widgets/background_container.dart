import 'package:flutter/material.dart';

import '../data/data.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({Key? key, required this.controller})
      : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) => Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(movies[index].imgUrl, fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.15, 0.76],
                colors: [
                  Colors.white.withOpacity(0.0001),
                  Colors.white,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
