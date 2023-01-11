import 'package:flutter/material.dart';
import 'package:minimal_movie_ui/widgets/background_container.dart';
import 'package:minimal_movie_ui/widgets/movie_card.dart';
import 'constants/color.dart';
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index, i) =>
                      MovieCard(movie: movies[index]),
                  options: CarouselOptions(
                    // autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.easeIn,
                    scrollDirection: Axis.horizontal,
                    height: MediaQuery.of(context).size.height * 0.7,
                    viewportFraction: 0.6,
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
                streamButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // button for start streaming
  Padding streamButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          elevation: 3,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
        ),
        onPressed: () {},
        child: Wrap(
          children: [
            Image.asset('assets/images/netflix_logo0.png', width: 15),
            const SizedBox(width: 5),
            const Text(
              'Start Streaming Now',
              style: TextStyle(
                color: netflixColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
