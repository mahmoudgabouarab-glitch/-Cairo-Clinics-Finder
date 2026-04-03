import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class ClinicModel extends Equatable {
  final String id;
  final String name;
  final String category;
  final double lat;
  final double lng;
  final String phone;
  final String address;
  final double rating;
  final int reviewCount;
  final bool isOpen;
  final String hours;

  const ClinicModel({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.isOpen,
    required this.hours,
  });

  LatLng get latLng => LatLng(lat, lng);

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    category: json['category'] as String? ?? 'clinic',
    lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
    lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
    phone: json['phone'] as String? ?? '',
    address: json['address'] as String? ?? '',
    rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    reviewCount: json['reviewCount'] as int? ?? 0,
    isOpen: json['isOpen'] as bool? ?? false,
    hours: json['hours'] as String? ?? '',
  );

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    lat,
    lng,
    phone,
    address,
    rating,
    isOpen,
  ];
}
