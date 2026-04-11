import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String name;
  final String email;
  final String phone;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  @override
  List<Object?> get props => [name, email, phone];
}
