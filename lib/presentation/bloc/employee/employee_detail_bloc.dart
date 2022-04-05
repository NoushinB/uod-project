import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/use_cases/employee/get_details.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_event.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_state.dart';

class EmployeeDetailBloc extends Bloc<EmployeeDetailEvent, EmployeeDetailState> {
  final GetDetailsUseCase getDetailsUseCase;

  EmployeeDetailBloc({required this.getDetailsUseCase}) : super(const EmployeeDetailState(status: BlocStatus.uninitialized)) {
    on<FetchEmployeeDetail>(_onFetchEmployeeDetail);
  }

  Future<void> _onFetchEmployeeDetail(FetchEmployeeDetail event, Emitter<EmployeeDetailState> emit) async {
    emit(state.copyWith(newStatus: BlocStatus.loading));
    var result = await getDetailsUseCase.call(NoInput());
    if (result.isSuccess()) {
      emit(state.copyWith(newStatus: BlocStatus.loaded, newDetails: result.getSuccess()));
    } else {
      emit(state.copyWith(newStatus: BlocStatus.error, newFailure: result.getError()));
    }
  }
}
