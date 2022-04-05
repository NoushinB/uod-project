import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/use_cases/attendance/confirm_attendance_use_case.dart';
import 'package:uod/presentation/bloc/attendance/confirm_attendance_event.dart';
import 'package:uod/presentation/bloc/attendance/confirm_attendance_state.dart';

class ConfirmAttendanceBloc extends Bloc<ConfirmAttendanceEvent, ConfirmAttendanceState> {
  final ConfirmAttendanceUseCase confirmAttendanceUseCase;

  ConfirmAttendanceBloc({required this.confirmAttendanceUseCase})
      : super(const ConfirmAttendanceState(
          status: BlocStatus.uninitialized,
        )) {
    on<DoAttendance>(_doAttendance);
  }

  Future<void> _doAttendance(DoAttendance event, Emitter<ConfirmAttendanceState> emit) async {
    emit(state.copyWith(newStatus: BlocStatus.loading));
    var result = await confirmAttendanceUseCase.call(event.eventCode);
    if (result.isSuccess()) {
      emit(state.copyWith(newStatus: BlocStatus.loaded));
    } else {
      emit(state.copyWith(newStatus: BlocStatus.error, newFailure: result.getError()));
    }
  }
}
