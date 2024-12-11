import 'package:flutter/material.dart';
import 'package:flutter_movie/services/service.dart';
import 'package:flutter_movie/models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final String imdbId;

 
  MovieDetailScreen({required this.imdbId});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Movie _movie;

  @override
  void initState() {
    super.initState();
    _loadMovieDetails(widget.imdbId); 
  }

  void _loadMovieDetails(String imdbId) async {
    try {
      final movie = await ApiService().getMovieDetails(imdbId); 
      setState(() {
        _movie = movie; 
      });
    } catch (e) {
      print('Error loading movie details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_movie.title),
      ),
      body: Column(
        children: [
          Image.network(_movie.poster),
          Text('Title: ${_movie.title}'),
          Text('Year: ${_movie.year}'),
          Text('Rating: ${_movie.rating}'),
          Text('Genres: ${_movie.genres.join(', ')}'),
          Text('Description: ${_movie.description}'),
        ],
      ),
    );
  }
}
