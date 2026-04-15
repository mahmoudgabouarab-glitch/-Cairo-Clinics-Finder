import 'package:cairo_clinics_finder/core/network/location_helper.dart';
import 'package:cairo_clinics_finder/feature/add_clinic/data/repo/add_clinic_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

part 'add_clinic_state.dart';

class AddClinicCubit extends Cubit<AddClinicState> {
  AddClinicCubit(this._repo) : super(AddClinicInitial());
  final AddClinicRepo _repo;
  final MapController mapController = MapController();

  final TextEditingController doctorNameController = .new();
  final TextEditingController selectedCategory = .new();
  final TextEditingController phoneController = .new();
  final TextEditingController addressController = .new();
  final TextEditingController openingController = .new();
  final TextEditingController closingController = .new();
  final GlobalKey<FormState> formKey = .new();

  LatLng? selectedLocation;

  Future<void> loadUserLocation() async {
    final location = await LocationHelper.getUserLocation();
    selectedLocation = location;
    emit(AddClinicLocationLoaded(location, isUserSelection: false));
  }

  void goToMyLocation() {
    if (selectedLocation != null) {
      mapController.move(selectedLocation!, 14);
    }
  }

  void onMapTap(LatLng location) {
    selectedLocation = location;
    emit(AddClinicLocationLoaded(location, isUserSelection: true));
  }

  Future<void> addClinic() async {
    if (selectedLocation == null) return;
    emit(AddClinicLoading());
    final result = await _repo.addClinic(
      name: doctorNameController.text,
      phone: phoneController.text,
      address: addressController.text,
      category: selectedCategory.text,
      lat: selectedLocation!.latitude,
      lng: selectedLocation!.longitude,
      rating: 0,
      reviewCount: 0,
      isOpen: true,
      hours: '${openingController.text}-${closingController.text}',
    );
    result.fold(
      (failure) => emit(AddClinicFailure(failure.message)),
      (_) => emit(AddClinicSuccess()),
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
    return super.close();
  }
}
