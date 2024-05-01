import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/serviceModel.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({Key? key, required this.serviceModel})
      : super(key: key);

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ID: ${serviceModel.id ?? 'N/A'}',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
        Text(
          'Name: ${serviceModel.name ?? 'N/A'}',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
        Text(
          'Specialty: ${serviceModel.specialty ?? 'N/A'}',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
        Text(
          'Session Price: ${serviceModel.sessionPrice ?? 'N/A'}',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
        Text(
          'Experience Years: ${serviceModel.experienceYears ?? 'N/A'}',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
        Text(
          'Languages: ${serviceModel.languages?.join(', ') ?? 'N/A'}',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
        Text(
          'Fields: ${serviceModel.fields?.join(', ') ?? 'N/A'}',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
      ],
    );
  }
}
