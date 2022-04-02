import 'package:equatable/equatable.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';

class ConfirmAttendanceState extends Equatable {
  final BlocStatus status;
  final Failure? failure;

  const ConfirmAttendanceState({
    required this.status,
    this.failure,
  });

  @override
  List<Object?> get props => [status, failure];

  ConfirmAttendanceState copyWith({BlocStatus? newStatus, Failure? newFailure}) {
    return ConfirmAttendanceState(
      status: newStatus ?? status,
      failure: newFailure ?? failure,
    );
  }
}
