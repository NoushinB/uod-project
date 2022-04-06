import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/injections.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_bloc.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_event.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_state.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/components/not_connected_view.dart';

class EmployeeDetailPage extends StatelessWidget {
  const EmployeeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<EmployeeDetailBloc>()..add(const FetchEmployeeDetail()),
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
  String _scanBarcode = 'Unknown';

  /*Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      barcodeScanRes = "5436noh3uz";
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailPage(eventCode: barcodeScanRes)));
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<EmployeeDetailBloc>(),
      builder: (BuildContext context, EmployeeDetailState state) {
        // Loading
        if (state.status == BlocStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Success (Loaded)
        if (state.status == BlocStatus.loaded) {
          var details = state.details;
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: Stack(
                      children: [
                        Ink(
                          decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(details?.image ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(1.2, 1.2),
                          child: MaterialButton(
                            minWidth: 0,
                            onPressed: () {},
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.white,
                            ),
                            color: AppColors.primaryColor.withOpacity(0.5),
                            elevation: 0,
                            shape: const CircleBorder(),
                          ),
                        )
                      ],
                    ),
                    width: 120,
                    height: 120),
                const SizedBox(height: 40),
                Text(
                  details?.fullName ?? "",
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "positionTitle:  ",
                            style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Text(details?.positionTitle ?? ""),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text(
                            "EmployeeId:    ",
                            style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Text(details?.employeeId ?? "")),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text(
                            "EmployeeCode: ",
                            style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(details?.employeeCode ?? ""),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MyButton(
                    onPressed: () {
                      //scanQR();
                    },
                    title: "Scan",
                  ),
                ),
              ],
            ),
          );
        }

        // Error
        if (state.status == BlocStatus.error) {
          if (state.failure is NotConnectedFailure) {
            return const NotConnectedView();
          }
          return const Center(child: Text("Error Occurred"));
        }

        return const SizedBox();
      },
    );
  }
}
