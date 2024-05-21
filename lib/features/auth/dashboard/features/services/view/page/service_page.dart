import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_cubit.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/controller/cubit/service_state.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/view/component/service_widget.dart';

class ServicePage extends StatelessWidget {
  ServicePage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceCubit.instance,
      child: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (context, state) {
          final ServiceCubit controller = context.read<ServiceCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFF8F6E3),
              title: const Text(
                'Services',
                style: TextStyle(
                  color: Color(0xFF684E39),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Implement the notification functionality
                  },
                  icon: const Icon(CupertinoIcons.bell),
                ),
                IconButton(
                  onPressed: () async {
                    final firebaseRepo = FirebaseRepo();
                    await firebaseRepo.signOut(context);
                  },
                  icon: Icon(Icons.exit_to_app),
                  iconSize: 25,
                  color: Colors.brown,
                )
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color((0xFFF8F6E3)),
                          ),
                          onChanged: (value) {
                            controller.searchServices(value);
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          // Implement filter functionality
                        },
                        icon: const Icon(CupertinoIcons.slider_horizontal_3),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'add_doctor');
                        },
                        icon: const Icon(CupertinoIcons.plus),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Therapists',
                        style: TextStyle(
                          color: Color(0xFF684E39),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: state is ServiceEmpty
                      ? const Center(child: Icon(Icons.delete))
                      : state is ServiceLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemBuilder: (_, int index) => ServiceItemWidget(
                                serviceModel:
                                    controller.filteredServices[index],
                                controller: controller,
                              ),
                              itemCount: controller.filteredServices.length,
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
