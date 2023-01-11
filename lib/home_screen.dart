import 'package:flutter/material.dart';
import 'package:minimal_movie_ui/widgets/background_container.dart';
import 'package:minimal_movie_ui/widgets/movie_card.dart';
import 'data/data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Image.asset(
      //     'assets/images/netflix_logo1.png',
      //     width: 150,
      //   ),
      //   centerTitle: true,
      // ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundContainer(controller: controller),
          Align(
            alignment: Alignment.bottomCenter,
            child: CarouselSlider.builder(
              itemCount: movies.length,
              itemBuilder: (context, index, i) =>
                  MovieCard(movie: movies[index]),
              options: CarouselOptions(
                // autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                autoPlayCurve: Curves.easeIn,
                scrollDirection: Axis.horizontal,
                height: MediaQuery.of(context).size.height * 0.74,
                viewportFraction: 0.80,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, _) {
                  controller.animateToPage(index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);

                  // setState(() {
                  //   currentPageIndex = index;
                  // });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
