import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({Key? key, required this.serviceModel})
      : super(key: key);

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          serviceModel.name ?? 'Empty',
        ),
        Text(
          serviceModel.specialty ?? 'NA',
        ),
        Text(
          '${serviceModel.sessionPrice ?? 'NA'}',
        ),
        Text(
          '${serviceModel.experienceYears ?? 'NA'}',
        ),
        Text(
          serviceModel.languages?.join(', ') ?? 'Empty',
        ),
        Text(
          serviceModel.fields?.join(', ') ?? 'Empty',
        ),
      ],
    );
  }
}
