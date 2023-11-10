import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviesapp/models/fav_movie.dart';

class FirebaseFunction {
  static CollectionReference<FavMovie> getMovie() {
    return FirebaseFirestore.instance
        .collection("movie")
        .withConverter<FavMovie>(
      fromFirestore: (snapshot, _) {
        return FavMovie.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static void addMovie(FavMovie favMovie) {
    var collection = getMovie();
    var docRef = collection.doc();
    favMovie.id = docRef.id;
    docRef.set(favMovie);
  }
}
