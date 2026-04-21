import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_loading.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_snack_bar.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view/widget/one_item_of_my_clinic.dart';
import 'package:cairo_clinics_finder/feature/my_clinics/presentation/view_model/my_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyClinicBody extends StatelessWidget {
  const MyClinicBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyClinicCubit, MyClinicState>(
      listener: (context, state) {
        if (state is MyClinicDeleteSuccess) {
          return CustomSnackBar.show(
            context,
            message: 'Clinic deleted successfully',
            type: SnackBarType.success,
          );
        }
      },
      builder: (context, state) {
        return state is MyClinicSuccess
            ? ListView.separated(
                padding: EdgeInsets.all(16.r),
                itemCount: state.clinics.length,
                separatorBuilder: (_, _) => spaceH(12),
                itemBuilder: (_, index) =>
                    OneItemOfMyClinic(clinic: state.clinics[index]),
              )
            : CustomLoading.cupertinoLoading(color: AppColor.primary);
      },
    );
  }
}
