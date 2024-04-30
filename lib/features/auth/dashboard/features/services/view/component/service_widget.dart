import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/serviceModel.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({super.key, required this.serviceModel});
  final ServiceModel serviceModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          serviceModel.name ?? 'XXX',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
        Text(
          serviceModel.address ?? 'XXX',
          style: const TextStyle(fontFamily: 'Pacifico'),
        ),
      ],
    );
  }
}
