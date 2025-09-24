import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cine_app/domain/entities/movie.dart';

class MoviesCardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const MoviesCardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Swiper(
        loop: true,
        autoplay: true,
        duration: 3000,
        itemCount: movies.length,
        itemWidth: 200,
        viewportFraction: 0.7,
        scale: 0.9,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(movies[index].backdropPath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
        ),
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.bottomCenter,
          builder: SwiperPagination.dots,
        ),
      ),
    );
  }
}
