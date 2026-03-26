class UserModel {
  final String? image;
  final String? surname;
  final List<String>? permissions;

  UserModel({this.image, this.surname, this.permissions});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      image: json['image'] ?? '',
      surname: json['surname'] ?? '',
      permissions: List<String>.from(json['permissions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'surname': surname, 'permissions': permissions};
  }

  UserModel copyWith({
    String? image,
    String? surname,
    List<String>? permissions,
  }) {
    return UserModel(
      image: image ?? this.image,
      surname: surname ?? this.surname,
      permissions: permissions ?? this.permissions,
    );
  }
}
