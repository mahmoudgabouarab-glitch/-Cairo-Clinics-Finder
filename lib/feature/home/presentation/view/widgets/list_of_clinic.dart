import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/one_item_of_clinic_list.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view_model/cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfClinic extends StatelessWidget {
  const ListOfClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state is MapSuccess) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.clinics.length,
            itemBuilder: (context, index) {
              return OneItemOfClinicList(clinic: state.filteredClinics[index]);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
