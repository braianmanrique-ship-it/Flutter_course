import 'package:cine_app/domain/entities/actor.dart';

abstract class ActorData {

  Future<List<Actor>> getActorByMovieId({required String movieId});
}