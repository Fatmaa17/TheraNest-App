import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/service_model/serviceModel.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    Key? key,
    required this.serviceModel,
    required this.controller,
  }) : super(key: key);

  final ServiceModel serviceModel;
  final ServiceCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        color: Color(0xFFF8F6E3),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the image if available
              if (serviceModel.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.memory(
                    serviceModel.image!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceModel.name ?? 'Empty',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      serviceModel.specialty ?? 'Empty',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 4, 4, 4),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${serviceModel.sessionPrice?.toStringAsFixed(2) ?? 'NA'} EGP',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF684E39),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.briefcase, size: 16.0),
                        const SizedBox(width: 4.0),
                        Text(
                          '${serviceModel.experienceYears ?? 'NA'} yr',
                          style: TextStyle(
                              fontWeight: FontWeight
                                  .bold), // Apply font weight to the Text widget
                        ),
                        const SizedBox(width: 16.0),
                        const Icon(CupertinoIcons.globe, size: 16.0),
                        const SizedBox(width: 4.0),
                        Text(
                          serviceModel.languages?.join(', ') ?? 'Empty',
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      serviceModel.fields?.join(', ') ?? 'Empty',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Available today at 8:00 pm', // Example availability
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF684E39),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: serviceModel.activity == 1
                    ? const Icon(
                        CupertinoIcons.calendar_circle_fill,
                        color: Colors.brown,
                      )
                    : const Icon(
                        CupertinoIcons.calendar,
                        color: Colors.brown,
                      ),
                onPressed: () {
                  if (serviceModel.activity == 1) {
                    controller.addItemToActivity(serviceModel.id ?? 0, 0);
                  } else {
                    controller.addItemToActivity(serviceModel.id ?? 0, 1);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
