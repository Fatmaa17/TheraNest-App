import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({Key? key, required this.serviceModel})
      : super(key: key);

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black54, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the image if available
              if (serviceModel.image != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.memory(
                    serviceModel.image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display the specialty
                    Text(
                      'Specialty: ${serviceModel.specialty ?? 'Empty'}',
                    ),
                    Text(
                      'Name: ${serviceModel.name ?? 'Empty'}',
                    ),
                    Text(
                      'Session Price: ${serviceModel.sessionPrice ?? 'NA'}',
                    ),
                    Text(
                      'Experience Years: ${serviceModel.experienceYears ?? 'NA'}',
                    ),
                    Text(
                      'Languages: ${serviceModel.languages?.join(', ') ?? 'Empty'}',
                    ),
                    Text(
                      'Fields: ${serviceModel.fields?.join(', ') ?? 'Empty'}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
