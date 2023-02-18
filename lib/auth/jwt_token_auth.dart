import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_util.dart';

Future<User?> signInWithJwtToken(BuildContext context, String jwtToken) =>
    signInOrCreateAccount(context,
        () => FirebaseAuth.instance.signInWithCustomToken(jwtToken), 'JWT');
