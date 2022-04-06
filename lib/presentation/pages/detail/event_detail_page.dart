import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/injections.dart';
import 'package:uod/presentation/bloc/attendance/confirm_attendance_bloc.dart';
import 'package:uod/presentation/bloc/attendance/confirm_attendance_event.dart';
import 'package:uod/presentation/bloc/attendance/confirm_attendance_state.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_bloc.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_event.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_state.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/pages/successful_page.dart';

class EventDetailPage extends StatelessWidget {
  final String eventCode;

  const EventDetailPage({Key? key, required this.eventCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<EventDetailBloc>()..add(FetchEventDetail(eventCode: eventCode))),
          BlocProvider(create: (context) => getIt<ConfirmAttendanceBloc>()),
        ],
        child: EventDetailView(eventCode: eventCode),
      ),
    );
  }
}

class EventDetailView extends StatefulWidget {
  final String eventCode;

  const EventDetailView({Key? key, required this.eventCode}) : super(key: key);

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<EventDetailBloc>(),
      builder: (context, EventDetailState state) {
        if (state.blocStatus == BlocStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.blocStatus == BlocStatus.loaded) {
          var eventDetail = state.eventDetail;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [Text(eventDetail?.activityType.toString() ?? "")],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocListener(
                    bloc: context.read<ConfirmAttendanceBloc>(),
                    listener: (context, ConfirmAttendanceState confirmState) {
                      if (confirmState.status == BlocStatus.loaded) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessfulPage()));
                      }
                    },
                    child: BlocBuilder(
                      bloc: context.read<ConfirmAttendanceBloc>(),
                      builder: (context, ConfirmAttendanceState confirmState) {
                        return MyButton(
                          onPressed: () {
                            context.read<ConfirmAttendanceBloc>().add(DoAttendance(eventCode: widget.eventCode));
                          },
                          title: "Confirm Attendance",
                          isBusy: confirmState.status == BlocStatus.loading,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (state.blocStatus == BlocStatus.error) {
          return const Center(child: Text("Error Occurred"));
        }

        return const SizedBox();
      },
    );
  }
}
