import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.uid,
      this.name,
      this.email,
      this.dob,
      this.gender,
      this.profilePic});
  final String uid;
  final String? name;
  final String? email;
  final String? dob;
  final String? gender;
  final String? profilePic;

  @override
  List<Object?> get props => [uid, name, email, dob, gender, profilePic];

  @override
  bool get stringify => true;

  factory User.fromMap(Map<String, dynamic>? data, String documentId) {
    if (data == null) {
      throw StateError('missing data for userId: $documentId');
    }
    final name = data['name'] as String?;
    final email = data['email'] as String?;
    final gender = data['gender'] as String?;
    final profilePic = data['profilePic'] as String?;
    final dob = data['dob'] as String?;

    return User(
        uid: documentId,
        name: name,
        email: email,
        dob: dob,
        gender: gender,
        profilePic: profilePic);
  }

  Map<String, dynamic> toMap() {
    Map<String, String?> data = {
      'name': name,
      'email': email,
      'gender': gender,
      'profilePic': profilePic,
      'dob': dob,
      'uid': uid
    };
    data.removeWhere((key, value) => value == null || value.isEmpty);
    return data;
  }
}
