import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String password;
  final String firstName;
  final String lastName;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.uid,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        firstName: snapshot['firstName'],
        lastName: snapshot['lastname'],
        email: snapshot['email'],
        password: snapshot['password'],
        uid: snapshot['uid']);
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "uid": uid,
      };
}
