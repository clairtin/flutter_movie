import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({Key? key, required this.movie, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          movie.poster,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(movie.title),
        subtitle: Text(movie.year),
        onTap: onTap,
      ),
    );
  }
}
