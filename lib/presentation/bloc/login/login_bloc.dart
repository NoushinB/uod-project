import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/use_cases/login/get_token.dart';
import 'package:uod/presentation/bloc/login/login_event.dart';
import 'package:uod/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetTokenUseCase tokenUseCase;

  LoginBloc({required this.tokenUseCase}) : super(const LoginState(status: BlocStatus.uninitialized)) {
    on<GetToken>(_onGetToken);
  }

  Future<void> _onGetToken(GetToken event, Emitter<LoginState> emit) async {
    emit(state.copyWith(newStatus: BlocStatus.loading));
    var result = await tokenUseCase.call(TokenInput(userName: event.username, password: event.password));
    if (result.isSuccess()) {
      emit(state.copyWith(newStatus: BlocStatus.loaded, newToken: result.getSuccess()));
    } else {
      emit(state.copyWith(newStatus: BlocStatus.error, newFailure: result.getError()));
    }
  }
}
