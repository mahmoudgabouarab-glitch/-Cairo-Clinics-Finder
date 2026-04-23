import 'dart:io';
import 'package:cairo_clinics_finder/core/network/location_helper.dart';
import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/data/repo/my_clinic_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

part 'clinic_form_state.dart';

class ClinicFormCubit extends Cubit<ClinicFormState> {
  ClinicFormCubit(this._repo, {ClinicModel? clinic})
    : _clinic = clinic,
      mode = clinic == null ? Request.add : Request.edit,
      super(ClinicFormState()) {
    _preFill();
  }

  final MyClinicRepo _repo;
  final ClinicModel? _clinic;
  final Request mode;
  final MapController mapController = MapController();
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController selectedCategory = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController openingController = TextEditingController();
  final TextEditingController closingController = TextEditingController();
  final TextEditingController breakTimeController = TextEditingController();
  final TextEditingController bookingController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? oldImageUrl;
  LatLng? selectedLocation;
  File? imageFile;
  // ================= INIT =================

  void _preFill() {
    if (mode == Request.add || _clinic == null) return;
    doctorNameController.text = _clinic.name;
    selectedCategory.text = _clinic.category;
    phoneController.text = _clinic.phone;
    addressController.text = _clinic.address;
    final hours = _clinic.hours.split(' - ');
    openingController.text = hours.first;
    closingController.text = hours.last;
    breakTimeController.text = _clinic.breakTime;
    bookingController.text = _clinic.booking;
    priceController.text = _clinic.price;
    degreeController.text = _clinic.degree;
    oldImageUrl = _clinic.imageUrl;
  }

  // ================= IMAGE =================

  void pickImage(File image) {
    imageFile = image;
    emit(state.copyWith(imageFile: image));
  }

  // ================= LOCATION (ADD ONLY) =================

  Future<void> loadUserLocation() async {
    if (mode == Request.edit) return;

    final location = await LocationHelper.getUserLocation();
    selectedLocation = location;
    emit(state.copyWith(location: location, isUserSelection: false));
  }

  void goToMyLocation() {
    if (mode == Request.edit) return;

    if (selectedLocation != null) {
      mapController.move(selectedLocation!, 14);
    }
  }

  void onMapTap(LatLng location) {
    if (mode == Request.edit) return;

    selectedLocation = location;
    emit(state.copyWith(location: location, isUserSelection: true));
  }

  // ================= SUBMIT =================

  Future<void> submit() async {
    if (mode == Request.add && selectedLocation == null) return;
    emit(state.copyWith(isLoading: true));
    final result = mode == Request.add
        ? await _repo.addClinic(
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
          )
        : await _repo.editMyClinic(
            id: _clinic!.id,
            name: doctorNameController.text,
            phone: phoneController.text,
            address: addressController.text,
            category: selectedCategory.text,
            hours: '${openingController.text} - ${closingController.text}',
            breakTime: breakTimeController.text,
            booking: bookingController.text,
            price: priceController.text,
            degree: degreeController.text,
            imageUrl: imageFile,
            oldImageUrl: oldImageUrl,
          );

    result.fold(
      (failure) =>
          emit(state.copyWith(error: failure.message, isLoading: false)),
      (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }

  @override
  Future<void> close() {
    doctorNameController.dispose();
    selectedCategory.dispose();
    phoneController.dispose();
    addressController.dispose();
    openingController.dispose();
    closingController.dispose();
    breakTimeController.dispose();
    bookingController.dispose();
    priceController.dispose();
    degreeController.dispose();
    mapController.dispose();
    return super.close();
  }
}

enum Request { add, edit }
