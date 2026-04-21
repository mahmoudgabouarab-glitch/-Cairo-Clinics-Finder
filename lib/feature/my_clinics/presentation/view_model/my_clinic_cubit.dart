import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/data/repo/my_clinic_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_clinic_state.dart';

class MyClinicCubit extends Cubit<MyClinicState> {
  MyClinicCubit(this._myClinicRepo) : super(MyClinicInitial());
  final MyClinicRepo _myClinicRepo;
  Future<void> getMyClinics() async {
    emit(MyClinicLoading());
    final result = await _myClinicRepo.getMyClinics();
    result.fold(
      (failure) => emit(MyClinicFailure(failure.message)),
      (success) => emit(MyClinicSuccess(success)),
    );
  }

  Future<void> deleteMyClinic(ClinicModel clinic) async {
    emit(MyClinicLoading());
    final result = await _myClinicRepo.deleteMyClinic(clinic);
    result.fold((failure) => emit(MyClinicFailure(failure.message)), (success) {
      emit(MyClinicDeleteSuccess());
      getMyClinics();
    });
  }
}
