import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class KaraokayKaraokeSongChoiceHelperFirebaseUser {
  KaraokayKaraokeSongChoiceHelperFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

KaraokayKaraokeSongChoiceHelperFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KaraokayKaraokeSongChoiceHelperFirebaseUser>
    karaokayKaraokeSongChoiceHelperFirebaseUserStream() => FirebaseAuth.instance
            .authStateChanges()
            .debounce((user) => user == null && !loggedIn
                ? TimerStream(true, const Duration(seconds: 1))
                : Stream.value(user))
            .map<KaraokayKaraokeSongChoiceHelperFirebaseUser>(
          (user) {
            currentUser = KaraokayKaraokeSongChoiceHelperFirebaseUser(user);
            return currentUser!;
          },
        );
