// ignore_for_file: unused_local_variable, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/controller/cubit/dashboard_controller_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/view/page/service_page.dart';

class dashboardPage extends StatelessWidget {
  List<String> titles = ['Home', 'Users', 'Services'];

  dashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DashboardControllerCubit(),
        child: BlocBuilder<DashboardControllerCubit, DashboardControllerState>(
            builder: (context, state) {
          DashboardControllerCubit controller =
              context.read<DashboardControllerCubit>();
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black12,
                title: Text(titles[controller.selectedTapIndex]),
                
              ),
              body: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onChangeTapIndex,
                children: const [Text('Home'), Text('Users'), ServicePage()],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.selectedTapIndex,
                onTap: controller.onChangeTapIndex,
                showSelectedLabels: true,
                unselectedItemColor: Colors.black,
                unselectedLabelStyle:
                    const TextStyle(fontSize: 15, color: Colors.red),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "users"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: "Services"),
                ],
              ));
        }));
  }
}
