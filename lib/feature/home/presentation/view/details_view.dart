import 'package:cairo_clinics_finder/feature/home/data/model/clinic_model.dart';
import 'package:cairo_clinics_finder/feature/home/presentation/view/widgets/details/details_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final ClinicModel clinic;
  const DetailsView({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailsBody(clinic: clinic));
  }
}
