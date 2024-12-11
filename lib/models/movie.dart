class Movie {
  final String title;
  final String poster;
  final String year;
  final String imdbId;
  final String rating; 
  final List<String> genres; 
  final String description; 

  Movie({
    required this.title,
    required this.poster,
    required this.year,
    required this.imdbId,
    required this.rating,
    required this.genres,
    required this.description,
  });

 
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? 'No title',
      poster: json['Poster'] ?? '',
      year: json['Year'] ?? 'N/A',
      imdbId: json['imdbID'] ?? 'N/A',
      rating: json['imdbRating'] ?? 'N/A', 
      genres: List<String>.from(json['Genre']?.split(', ') ?? []), 
      description: json['Plot'] ?? 'No description', 
    );
  }
}

