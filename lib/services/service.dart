// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/movie.dart';

// class MovieService {
//   static const String _baseUrl = 'http://www.omdbapi.com'; 
//   static const String _apiKey = '84ec0337'; 



// static Future <List<Movie>> searchMovies(String query) async {
//   final response = await http.get(
//     Uri.parse('https://www.omdbapi.com/?apikey=$_apiKey&s=$query&type=movie'),
//   );

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     if (data['Response'] == 'True') {
//       return (data['Search'] as List)
//           .map((movie) => Movie.fromJson(movie))
//           .toList();
//     } else {
//       
//       return [];
//     }
//   } else {
//     throw Exception('Failed to load movies');
//   }
// }

//   static Future<Movie> getMovieDetails(String imdbId) async {
//     final url = '$_baseUrl/?apikey=$_apiKey&i=$imdbId'; 
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body); 

     
//       if (data['Error'] != null) {
//         throw Exception(data['Error']);
//       }

      
//       return Movie.fromJson(data);
//     } else {
     
//       throw Exception('Failed to load movie details');
//     }
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_movie/models/movie.dart'; 

class ApiService {
  final String apiKey = '84ec0337'; 

 
  Future<Movie> getMovieDetails(String imdbId) async {
    final url = Uri.parse('http://www.omdbapi.com/?i=$imdbId&apikey=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Movie.fromJson(data); 
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  
  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.parse('http://www.omdbapi.com/?s=$query&apikey=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Search'] != null) {
        return (data['Search'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

