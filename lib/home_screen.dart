import 'package:flutter/material.dart';
import 'package:minimal_movie_ui/widgets/movie_card.dart';
import 'data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  var pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: pageIndex,
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/netflix_logo1.png',
          width: 150,
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieCard(movie: movies[index]),
      ),
    );
  }
}
