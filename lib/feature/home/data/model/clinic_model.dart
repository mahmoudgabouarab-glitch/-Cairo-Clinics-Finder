import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory ClinicModel.fromJson(Map<String, dynamic> map, String id) =>
      ClinicModel(
        id: id,
        name: map['name'] as String? ?? '',
        category: map['category'] as String? ?? 'clinic',
        lat: (map['lat'] as num?)?.toDouble() ?? 0.0,
        lng: (map['lng'] as num?)?.toDouble() ?? 0.0,
        phone: map['phone'] as String? ?? '',
        address: map['address'] as String? ?? '',
        rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
        reviewCount: map['reviewCount'] as int? ?? 0,
        isOpen: map['isOpen'] as bool? ?? false,
        hours: map['hours'] as String? ?? '',
      );

  Map<String, dynamic> toMap() => {
    'name': name,
    'category': category,
    'lat': lat,
    'lng': lng,
    'phone': phone,
    'address': address,
    'rating': rating,
    'reviewCount': reviewCount,
    'isOpen': isOpen,
    'hours': hours,
  };

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
    reviewCount,
    hours,
  ];
}
