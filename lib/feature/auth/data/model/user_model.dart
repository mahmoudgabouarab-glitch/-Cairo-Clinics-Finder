import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String phone;
  final String name;

  const UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      name: json['name'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    "phone": phone,
    'name': name,
    'uid': uid,
  };

  @override
  List<Object?> get props => [uid, email, phone, name];
}
