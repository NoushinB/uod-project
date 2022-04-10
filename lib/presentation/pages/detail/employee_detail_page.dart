import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/data/data_sources/local/shared_prefs/local_storage_service.dart';
import 'package:uod/domain/entities/employee_details.dart';
import 'package:uod/injections.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_bloc.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_event.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_state.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/components/not_connected_view.dart';
import 'package:uod/presentation/pages/detail/event_detail_page.dart';

class EmployeeDetailPage extends StatelessWidget {
  const EmployeeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<EmployeeDetailBloc>()..add(const FetchEmployeeDetail()),
          child: const EmployeeDetailView(),
        ),
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

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if (barcodeScanRes != "-1") {
        barcodeScanRes = "5436noh3uz";
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailPage(eventCode: barcodeScanRes)));
      } else {
        Fluttertoast.showToast(msg: "QR Code Not Found");
      }
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
  }

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
          var avatarUrl = (details?.image != null && details?.image != "") ? details?.image : NetworkPath.defaultAvatarUrl;
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ProfileHeader(
                          avatar: NetworkImage(avatarUrl ?? ""),
                          coverImage: NetworkImage(avatarUrl ?? ""),
                          title: details?.fullName ?? "",
                          subtitle: details?.positionTitle,
                          actions: const <Widget>[],
                        ),
                        UserInfo(details: details),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 32),
                  child: MyButton(
                    onPressed: () {
                      scanQR();
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
            return NotConnectedView(
              tryAgain: () {
                context.read<EmployeeDetailBloc>().add(const FetchEmployeeDetail());
              },
            );
          }
          return const Center(child: Text("Error Occurred"));
        }

        return const SizedBox();
      },
    );
  }
}

class UserInfo extends StatelessWidget {
  final EmployeeDetails? details;

  const UserInfo({Key? key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            leading: const Icon(Icons.info_sharp),
                            title: const Text("Code"),
                            subtitle: Text(details?.employeeCode ?? ""),
                          ),
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: const Text("Email"),
                            subtitle: Text(details?.personalEmail ?? ""),
                          ),
                          const ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("99--99876-56"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.person),
                            title: Text("About Me"),
                            subtitle: Text("This is a about me link and you can khow about me in this section."),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.logout,
                              color: AppColors.errorColor,
                            ),
                            title: const Text("Logout"),
                            subtitle: const Text("You can logout from here."),
                            onTap: () async {
                              var _storage = await LocalStorageService.getInstance();
                              _storage?.token = "";
                              Navigator.pop(context);
                              exit(0);
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  const ProfileHeader({Key? key, required this.coverImage, required this.avatar, required this.title, this.subtitle, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 80,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 0.0,
              ),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 24)),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(subtitle!, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.gray, fontSize: 14)),
              ],
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color? backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar({Key? key, required this.image, this.borderColor = Colors.grey, this.backgroundColor, this.radius = 30, this.borderWidth = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image as ImageProvider<Object>?,
        ),
      ),
    );
  }
}
