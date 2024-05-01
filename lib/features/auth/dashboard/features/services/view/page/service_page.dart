import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_cubit.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (context, state) {
          final ServiceCubit controller = context.read<ServiceCubit>();
          return Scaffold(
              body: state is ServiceLoading
                  ? const CircularProgressIndicator()
                  : state is ServiceEmpty
                      ? const Center(child: Icon(CupertinoIcons.delete))
                      : ListView.builder(
                          itemCount: controller.services.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                                controller.services[index].name ?? 'XXX');
                          }));
          // : GridView.builder(
          //     itemBuilder: (_, index) {
          //       final service = controller.services[index];
          //       return Text(service.name ??
          //           ''); // Display service name if not null, otherwise display empty string
          //     },
          //     itemCount: controller.services.length,
          //     gridDelegate:
          //         const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2),
          //   ));
        },
      ),
    );
  }
}
