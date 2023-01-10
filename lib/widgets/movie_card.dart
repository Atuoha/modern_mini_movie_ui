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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(
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
              const SizedBox(height: 10),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                movie.subTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              genreContainer(),
              const SizedBox(height: 10),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          movie.rating,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        ratingStar()
      ],
    );
  }

  // for rating star
  Wrap ratingStar() {
    return Wrap(
      children: const [
        Icon(Icons.star, color: Colors.orange, size: 18),
        Icon(Icons.star, color: Colors.orange, size: 18),
        Icon(Icons.star, color: Colors.orange, size: 18),
        Icon(Icons.star, color: Colors.orange, size: 18),
        Icon(Icons.star, color: Colors.orange, size: 18),
      ],
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
