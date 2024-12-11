import 'package:flutter/material.dart';
import 'package:flutter_movie/screens/movie_detail.dart'; 
import 'package:flutter_movie/services/service.dart'; 
import 'package:flutter_movie/models/movie.dart'; 

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> _movies = [];

  
  void _searchMovies(String query) async {
    try {
      final movies = await ApiService().searchMovies(query);
      setState(() {
        _movies = movies;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _searchMovies, 
              decoration: InputDecoration(
                labelText: 'Search Movies',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return ListTile(
                  leading: Image.network(movie.poster),
                  title: Text(movie.title),
                  subtitle: Text(movie.year),
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(imdbId: movie.imdbId), 
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
