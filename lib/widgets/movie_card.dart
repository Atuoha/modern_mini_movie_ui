import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: const BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              buildImage(),
              const SizedBox(height: 5),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                movie.subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              genreContainer(),
              const SizedBox(height: 5),
              ratingRow()
            ],
          ),
        ),
      ),
    );
  }

  // for displaying genres
  Row genreContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: movie.genres
          .map(
            (genre) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade600),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  genre,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  // for rating row
  Row ratingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          movie.rating.toStringAsFixed(1),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 20),
        ...ratedStars(),
        ...notRatedStars(),
      ],
    );
  }

  // shows stars based on number of rating
  List<Widget> ratedStars() {
    return List.generate(
      movie.rating,
      (index) => const Icon(
        Icons.star,
        color: Colors.orange,
        size: 18,
      ),
    );
  }

  // shows stars based on 5 minus number of rating (the left from the rating out of 5)
  List<Widget> notRatedStars() {
    return List.generate(
      5 - movie.rating,
      (index) => const Icon(
        Icons.star,
        color: Colors.grey,
        size: 18,
      ),
    );
  }

  // for displaying image
  Container buildImage() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          movie.imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
