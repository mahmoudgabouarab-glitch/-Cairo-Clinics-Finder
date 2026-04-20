import 'dart:io';
import 'package:cairo_clinics_finder/core/network/location_helper.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/data/repo/add_clinic_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

part 'add_clinic_state.dart';

class AddClinicCubit extends Cubit<AddClinicState> {
  AddClinicCubit(this._repo) : super(AddClinicState());
  final AddClinicRepo _repo;
  final MapController mapController = MapController();

  final TextEditingController doctorNameController = .new();
  final TextEditingController selectedCategory = .new();
  final TextEditingController phoneController = .new();
  final TextEditingController addressController = .new();
  final TextEditingController openingController = .new();
  final TextEditingController closingController = .new();
  final TextEditingController breakTimeController = .new();
  final TextEditingController bookingController = .new();
  final TextEditingController priceController = .new();
  final TextEditingController degreeController = .new();
  final GlobalKey<FormState> formKey = .new();

  LatLng? selectedLocation;
  File? imageFile;
  void pickImage(File image) {
    imageFile = image;
    emit(state.copyWith(imageFile: image));
  }

  Future<void> loadUserLocation() async {
    final location = await LocationHelper.getUserLocation();
    selectedLocation = location;
    emit(state.copyWith(location: location, isUserSelection: false));
  }

  void goToMyLocation() {
    if (selectedLocation != null) {
      mapController.move(selectedLocation!, 14);
    }
  }

  void onMapTap(LatLng location) {
    selectedLocation = location;
    emit(state.copyWith(location: location, isUserSelection: true));
  }

  Future<void> addClinic() async {
    if (selectedLocation == null) return;
    emit(state.copyWith(isLoading: true));
    final result = await _repo.addClinic(
      name: doctorNameController.text,
      phone: phoneController.text,
      address: addressController.text,
      category: selectedCategory.text,
      lat: selectedLocation!.latitude,
      lng: selectedLocation!.longitude,
      rating: 0,
      reviewCount: 0,
      hours: '${openingController.text} - ${closingController.text}',
      breakTime: breakTimeController.text,
      booking: bookingController.text,
      price: priceController.text,
      degree: degreeController.text,
      imageUrl: imageFile,
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(error: failure.message, isLoading: false)),
      (_) => emit(state.copyWith(isLoading: false)),
    );
  }

  @override
  Future<void> close() {
    doctorNameController.dispose();
    selectedCategory.dispose();
    phoneController.dispose();
    addressController.dispose();
    mapController.dispose();
    openingController.dispose();
    closingController.dispose();
    breakTimeController.dispose();
    bookingController.dispose();
    priceController.dispose();
    degreeController.dispose();
    return super.close();
  }
}
