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

  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LatLng? selectedLocation;
  String? selectedCategory;
  TimeOfDay? openingTime;
  TimeOfDay? closingTime;

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

  void selectCategory(String category) {
    selectedCategory = category;
  }

  void setOpeningTime(TimeOfDay time) {
    openingTime = time;
  }

  void setClosingTime(TimeOfDay time) {
    closingTime = time;
  }

  Future<void> addClinic() async {
    if (selectedLocation == null) return;
    if (selectedCategory == null) return;
    emit(AddClinicLoading());
    final result = await _repo.addClinic(
      name: clinicNameController.text,
      phone: phoneController.text,
      address: addressController.text,
      category: selectedCategory!,
      lat: selectedLocation!.latitude,
      lng: selectedLocation!.longitude,
      rating: 0,
      reviewCount: 0,
      isOpen: true,
      hours: openingTime != null && closingTime != null
          ? '${openingTime!.hour}-${closingTime!.hour}'
          : '',
    );
    result.fold(
      (failure) => emit(AddClinicFailure(failure.message)),
      (_) => emit(AddClinicSuccess()),
    );
  }

  @override
  Future<void> close() {
    clinicNameController.dispose();
    doctorNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    mapController.dispose();
    return super.close();
  }
}
