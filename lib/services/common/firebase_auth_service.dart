import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppUser {
  const AppUser({
    required this.uid,
    required this.email,
    required this.photoURL,
    required this.displayName,
  });

  final String uid;
  final String? email;
  final String? photoURL;
  final String? displayName;

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }

  @override
  String toString() =>
      'uid: $uid, email: $email, photoUrl: $photoURL, displayName: $displayName';
}

class AuthParams {
  final String phone;
  final String code;
  final String country;
  AuthParams({required this.phone, required this.code, required this.country});
  String get phoneNo {
    return '$code${phone.startsWith('0') ? phone.substring(1) : phone}';
  }
}

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<AppUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(
        (User? user) => user == null ? null : AppUser.fromFirebaseUser(user));
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber,
      void Function(PhoneAuthCredential) onVerified,
      void Function(FirebaseAuthException) verificationFailed,
      ValueSetter<String> verification) async {
    void autoRetrieval(String verId) => verification(verId);
    void smsCodeSent(String verId, [int? forceCodeResend]) =>
        verification(verId);

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeAutoRetrievalTimeout: autoRetrieval,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 120),
        verificationCompleted: onVerified,
        verificationFailed: verificationFailed);
    log(phoneNumber, name: "end");
  }

  Future<AppUser?> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode));

    return userCredential.user == null
        ? null
        : AppUser.fromFirebaseUser(userCredential.user!);
  }

  Future<AppUser?> signInWithPhoneAuthCredential(
      PhoneAuthCredential credential) async {
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user == null
        ? null
        : AppUser.fromFirebaseUser(userCredential.user!);
  }

  Future<AppUser?> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user == null
        ? null
        : AppUser.fromFirebaseUser(userCredential.user!);
  }

  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential =
        await _firebaseAuth.signInWithCredential(EmailAuthProvider.credential(
      email: email,
      password: password,
    ));
    return userCredential.user == null
        ? null
        : AppUser.fromFirebaseUser(userCredential.user!);
  }

  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user == null
        ? null
        : AppUser.fromFirebaseUser(userCredential.user!);
  }

  Future<void> sendPasswordResetEmail(
    String email,
  ) async {
    await _firebaseAuth.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: ActionCodeSettings(
            url: 'https://www.atlantatreatmentcenter.com/verify-email',
            dynamicLinkDomain: 'atlantatc.page.link',
            handleCodeInApp: true,
            androidPackageName: 'com.atlantatc.app',
            androidInstallApp: true,
            androidMinimumVersion: '12'));
  }

  AppUser? get currentUser => _firebaseAuth.currentUser == null
      ? null
      : AppUser.fromFirebaseUser(_firebaseAuth.currentUser!);

  User? get currentUserRaw => _firebaseAuth.currentUser;

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
