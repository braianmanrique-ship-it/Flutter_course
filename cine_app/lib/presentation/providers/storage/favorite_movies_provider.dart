import 'package:cine_app/domain/entities/movie.dart';
import 'package:cine_app/domain/repositories/local_storage_repository.dart';
import 'package:cine_app/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final favoriteMoviesProvider = StateNotifierProvider((ref) {
  final LocalStorageRepository localStorageRepository = ref.watch(
    localStorageRepositoryProvider,
  );
  return StorageMovieNotifier(
    {},
    localStorageRepository: localStorageRepository,
  );
});

class StorageMovieNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;

  final LocalStorageRepository localStorageRepository;

  StorageMovieNotifier(super.state, {required this.localStorageRepository});
}
