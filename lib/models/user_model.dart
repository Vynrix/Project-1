// User Model for Firestore
class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String? photoUrl;
  final List<String> favourites;
  final List<String> bookmarks;
  final List<String> tripHistory;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.favourites = const [],
    this.bookmarks = const [],
    this.tripHistory = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
      favourites: List<String>.from(map['favourites'] ?? []),
      bookmarks: List<String>.from(map['bookmarks'] ?? []),
      tripHistory: List<String>.from(map['tripHistory'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'favourites': favourites,
      'bookmarks': bookmarks,
      'tripHistory': tripHistory,
    };
  }
}
