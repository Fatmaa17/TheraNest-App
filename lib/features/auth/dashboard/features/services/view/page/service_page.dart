// service_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/local_db_data.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  void initState() {
    super.initState();
    _addNewService();
  }

  Future<void> _addNewService() async {
    final dbRepo = await DBRepo.instance;
    await dbRepo?.create(
      name: 'Dr.Ahmed Mahmoud',
      specialty: 'Depression',
      sessionPrice: 1200,
      experienceYears: 5,
      languages: ['English', 'Spanish'],
      fields: ['Anxiety', 'Stress'],
    );

    context.read<ServiceCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (context, state) {
          final ServiceCubit controller = context.read<ServiceCubit>();
          return Scaffold(
            body: state is ServiceEmpty
                ? const Center(child: Icon(Icons.delete))
                : state is ServiceLoaded
                    ? ListView.builder(
                        itemCount: controller.services.length,
                        itemBuilder: (BuildContext context, int index) {
                          final service = controller.services[index];
                          return ListTile(
                            title: Text(service.name ?? 'XXX'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Specialty: ${service.specialty ?? 'Not Available'}'),
                                Text(
                                    'Session Price: \$${service.sessionPrice?.toStringAsFixed(2) ?? 'Not Available'}'),
                                Text(
                                    'Experience Years: ${service.experienceYears ?? 'Not Available'}'),
                                Text(
                                    'Languages: ${service.languages?.join(', ') ?? 'Not Available'}'),
                                Text(
                                    'Fields: ${service.fields?.join(', ') ?? 'Not Available'}'),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
