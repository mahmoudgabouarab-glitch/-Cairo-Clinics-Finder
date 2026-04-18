import 'package:cairo_clinics_finder/core/utils/clinic_hours_helper.dart';
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
  final String hours;
  final String breakTime;
  final String booking;
  final String price;
  final String degree;
  final RatingStats ratingStats;

  const ClinicModel({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.address,
    required this.hours,
    required this.ratingStats,
    required this.breakTime,
    required this.booking,
    required this.price,
    required this.degree,
  });

  LatLng get latLng => LatLng(lat, lng);
  bool get isOpen => ClinicHoursHelper.isOpenNow(hours, breakTime);
  double get rating => ratingStats.average;
  int get reviewCount => ratingStats.count;

  factory ClinicModel.fromJson(Map<String, dynamic> map, String id) {
    return ClinicModel(
      id: id,
      name: map['name'] as String? ?? '',
      category: map['category'] as String? ?? 'clinic',
      lat: (map['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (map['lng'] as num?)?.toDouble() ?? 0.0,
      phone: map['phone'] as String? ?? '',
      address: map['address'] as String? ?? '',
      hours: map['hours'] as String? ?? '',
      breakTime: map['breakTime'] as String? ?? '',
      booking: map['booking'] as String? ?? '',
      price: map['price'] as String? ?? '',
      degree: map['degree'] as String? ?? '',
      ratingStats: RatingStats.fromJson(
        map['ratingStats'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'category': category,
    'lat': lat,
    'lng': lng,
    'phone': phone,
    'address': address,
    'hours': hours,
    'breakTime': breakTime,
    'booking': booking,
    'price': price,
    'degree': degree,
    'ratingStats': ratingStats.toMap(),
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
    hours,
    ratingStats,
    breakTime,
    booking,
    price,
    degree
  ];
}

class RatingStats extends Equatable {
  final double total;
  final int count;

  const RatingStats({required this.total, required this.count});

  double get average => count == 0 ? 0.0 : total / count;

  factory RatingStats.fromJson(Map<String, dynamic> map) {
    return RatingStats(
      total: (map['total'] as num?)?.toDouble() ?? 0.0,
      count: map['count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {'total': total, 'count': count};

  @override
  List<Object?> get props => [total, count];
}

class RatingUser extends Equatable {
  final String id;
  final double rating;
  final DateTime updatedAt;

  const RatingUser({
    required this.id,
    required this.rating,
    required this.updatedAt,
  });

  factory RatingUser.fromJson(Map<String, dynamic>? json, String id) {
    return RatingUser(
      id: id,
      rating: (json?['rating'] as num?)?.toDouble() ?? 0.0,
      updatedAt: (json?['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [id, rating, updatedAt];
}
