import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/one_item_of_clinic_list.dart';
import 'package:flutter/material.dart';

class ListOfClinic extends StatelessWidget {
  const ListOfClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return OneItemOfClinicList(
            name: 'Clinic ${index + 1}',
            category: 'clinic',
          );
        },
      ),
    );
  }
}
