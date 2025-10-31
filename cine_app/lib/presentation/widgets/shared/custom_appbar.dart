import 'package:flutter/material.dart';
import 'package:cine_app/presentation/delegates/search_movie_delegate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final delegate = SearchMovieDelegate();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.movie_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Cine App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: delegate);
                },
                icon: const Icon(Icons.search, size: 30, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
