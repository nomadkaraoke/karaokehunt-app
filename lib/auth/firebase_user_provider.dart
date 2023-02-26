import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class KaraokeHuntFirebaseUser {
  KaraokeHuntFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

KaraokeHuntFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KaraokeHuntFirebaseUser> karaokeHuntFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<KaraokeHuntFirebaseUser>(
      (user) {
        currentUser = KaraokeHuntFirebaseUser(user);
        return currentUser!;
      },
    );
