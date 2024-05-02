// service_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/view/component/service_widget.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key});

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
              : state is ServiceLoading 
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (_, int index) => ServiceItemWidget(
                        serviceModel: controller.services[index],
                      ),
                      itemCount: controller.services.length,
                    ),
        );
      },
    ),
  );
}
}