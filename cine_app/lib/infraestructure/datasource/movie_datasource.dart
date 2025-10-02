import 'package:cine_app/domain/datasources/movie_data.dart';
import 'package:cine_app/domain/entities/movie.dart';
import 'package:dio/dio.dart';
import 'package:cine_app/config/constants/env.dart';
import 'package:cine_app/infraestructure/models/moviebd/movie_response.dart';
import 'package:cine_app/infraestructure/mappers/movie_mapper.dart';
import 'package:flutter/material.dart';

class MovieDatasource extends MovieData {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {"api_key": Env.apiKey, "language": "es-MX"},
    ),
  );

  List<Movie> _jsontoMovie(Map<String, dynamic> json) {
    final movieresponse = MovieResponse.fromJson(json);

    final List<Movie> movies = movieresponse.results
        .map((movie) => MovieMapper.movieResponseToMovie(movie))
        .toList();
    debugPrint(movies.toString());
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlayMovies({int page = 1}) async {
    final response = await dio.get(
      "/movie/now_playing",
      queryParameters: {"page": page},
    );
    final movies = _jsontoMovie(response.data);
    return movies;
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await dio.get(
      "/movie/popular",
      queryParameters: {"page": page},
    );
    final movies = _jsontoMovie(response.data);
    return movies;
  }

  @override
  Future<List<Movie>> getUpcomingMovies({int page = 1}) async {
    final response = await dio.get(
      "/movie/upcoming",
      queryParameters: {"page": page},
    );
    final movies = _jsontoMovie(response.data);
    return movies;
  }
}
