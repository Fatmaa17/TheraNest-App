import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/controller/cubit/dashboard_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/activity/view/page/activity_page.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/view/page/service_page.dart';
import 'package:therapy_app/features/auth/dashboard/features/home/view/home_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          final cubit =
              context.read<DashboardCubit>(); // Accessing the cubit instance
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){
                   Navigator.pushNamed(context, 'add_doctor');
                  }, icon: Icon(CupertinoIcons.plus))
                ],
              ),
              body: PageView(
                controller: cubit.pageController,
                onPageChanged: cubit.onChangeTab,
                children: const [
                  HomeView(),
                  Text('Activity'),
                  ServicePage(),
                  Text('More'),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black, // Selected item color
                unselectedItemColor: Colors.grey, // Unselected item color
                currentIndex: cubit.currentIndex,
                onTap: cubit.onChangeTab,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.calendar),
                    label: "Activity",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.plus_rectangle),
                    label: "Services",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz),
                    label: "More",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
