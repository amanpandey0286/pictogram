import 'dart:typed_data';

class UserModel {
  final String email;
  final String uid;
  final String username;
  final String photoUrl;
  final String bio;
  final List followers;
  final List following;

  UserModel(
      {required this.email,
      required this.uid,
      required this.username,
      required this.photoUrl,
      required this.bio,
      required this.followers,
      required this.following});

  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'username': username,
        'imageUrl': photoUrl,
        'bio': bio,
        'followers': followers,
        'following': following,
      };
}
