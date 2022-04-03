import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/injections.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_bloc.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_event.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_state.dart';
import 'package:uod/presentation/components/my_button.dart';

class EmployeeDetailPage extends StatelessWidget {
  const EmployeeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<EmployeeDetailBloc>()..add(const FetchEmployeeDetail(id: "0317730a-7087-442c-879b-b0ec3684a886")),
        child: const EmployeeDetailView(),
      ),
    );
  }
}

class EmployeeDetailView extends StatefulWidget {
  const EmployeeDetailView({Key? key}) : super(key: key);

  @override
  State<EmployeeDetailView> createState() => _EmployeeDetailViewState();
}

class _EmployeeDetailViewState extends State<EmployeeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder(
                bloc: context.read<EmployeeDetailBloc>(),
                builder: (BuildContext context, EmployeeDetailState state) {
                  // Loading
                  if (state.status == BlocStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Success (Loaded)
                  if (state.status == BlocStatus.loaded) {
                    var details = state.details;
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Ink(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(details?.image ?? ""),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(1.5, 1.5),
                              child: MaterialButton(
                                minWidth: 0,
                                onPressed: () {},
                                child: const Icon(Icons.camera_alt),
                                color: AppColors.lightPrimaryColor,
                                elevation: 0,
                                shape: const CircleBorder(),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Name:",
                              style: TextStyle(fontSize: 32, color: AppColors.black),
                            ),
                            Text(details?.fullName ?? ""),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            const Text(
                              "positionTitle:",
                              style: TextStyle(fontSize: 32, color: AppColors.black),
                            ),
                            Text(details?.positionTitle ?? ""),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            const Text(
                              "EmployeeId:",
                              style: TextStyle(fontSize: 32, color: AppColors.black),
                            ),
                            Text(details?.employeeId ?? ""),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            const Text(
                              "EmployeeCode:",
                              style: TextStyle(fontSize: 32, color: AppColors.black),
                            ),
                            Text(details?.employeeCode ?? ""),
                          ],
                        ),
                      ],
                    );
                  }

                  // Error
                  if (state.status == BlocStatus.error) {
                    return const Center(child: Text("Error Occurred"));
                  }

                  return const SizedBox();
                },
              ),
            ),
            MyButton(onPressed: () {}, textName: "Scan")
          ],
        ));
  }
}
