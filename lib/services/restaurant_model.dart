class Restaurant {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String? phoneNumber;
  final String? websiteUrl;
  final double? rating;
  final int? totalReviews;
  final String? cuisine;
  final String? openingHours;
  final List<String>? amenities;
  final bool? isOpenNow;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.phoneNumber,
    this.websiteUrl,
    this.rating,
    this.totalReviews,
    this.cuisine,
    this.openingHours,
    this.amenities,
    this.isOpenNow,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      phoneNumber: json['phoneNumber'],
      websiteUrl: json['websiteUrl'],
      rating: (json['rating'] as num?)?.toDouble(),
      totalReviews: json['totalReviews'],
      cuisine: json['cuisine'],
      openingHours: json['openingHours'],
      amenities: List<String>.from(json['amenities'] ?? []),
      isOpenNow: json['isOpenNow'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'phoneNumber': phoneNumber,
      'websiteUrl': websiteUrl,
      'rating': rating,
      'totalReviews': totalReviews,
      'cuisine': cuisine,
      'openingHours': openingHours,
      'amenities': amenities,
      'isOpenNow': isOpenNow,
    };
  }
}

class User {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final DateTime createdAt;

  User({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
