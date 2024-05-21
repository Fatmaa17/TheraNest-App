// service_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/activity/controller/cubit/activity_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/activity/controller/cubit/activity_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/activity/view/component/activity_widget.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';

class activityPage extends StatelessWidget {
  const activityPage({Key? key});

  @override
Widget build(BuildContext context) {
  return BlocProvider(
    create: (context) => activityCubit(),
    child: BlocBuilder<activityCubit, activityState>(
      builder: (context, state) {
        final activityCubit controller = context.read<activityCubit>();
        return Scaffold(
          appBar: AppBar( actions: [
                  IconButton(
                    onPressed: () async {
              final firebaseRepo = FirebaseRepo();
              await firebaseRepo.signOut(context);
            },
                    icon: Icon(Icons.exit_to_app),
                    iconSize: 25,
                   color: Colors.brown,
                  )
                ],),
          body: state is ServiceEmpty
              ? const Center(child: Icon(Icons.delete))
              : state is ServiceLoading 
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (_, int index) => activityItemWidget(
                        serviceModel: controller.services[index],
                        controller:controller ,
                      ),
                      itemCount: controller.services.length,
                    ),
        );
      },
    ),
  );
}
}