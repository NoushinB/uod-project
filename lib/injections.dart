import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uod/data/data.dart';
import 'package:uod/data/data_sources/remote/event_source.dart';
import 'package:uod/data/repositories/event/event_detail_repository_impl.dart';
import 'package:uod/domain/domain.dart';
import 'package:uod/domain/repositories/event/event_detail_repository.dart';
import 'package:uod/domain/use_cases/event/get_event.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_bloc.dart';

import 'core/core.dart';
import 'presentation/presentation.dart';

final getIt = GetIt.instance;

/// This is IoC container for register dependencies for dependency injection
Future<void> init() async {
  // Register (init) Blocs
  getIt.registerFactory(() => LoginBloc(tokenUseCase: getIt()));
  getIt.registerFactory(() => EmployeeDetailBloc(getDetailsUseCase: getIt()));
  getIt.registerFactory(() => ConfirmAttendanceBloc(confirmAttendanceUseCase: getIt()));
  getIt.registerFactory(() => EventDetailBloc(getEventUseCase: getIt()));

  // Register (init) SERVICES
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  getIt.registerLazySingleton<InternetInfoService>(() => InternetInfoImpl(checker: getIt()));
  getIt.registerLazySingleton<AttendanceSource>(() => AttendanceSourceImpl(dio: getIt()));
  getIt.registerLazySingleton<EmployeeSource>(() => EmployeeSourceImpl(dio: getIt()));
  getIt.registerLazySingleton<LoginRemoteSource>(() => LoginRemoteSourceImpl(dio: getIt()));
  getIt.registerLazySingleton<EventSource>(() => EventSourceImpl(dio: getIt()));

  // Register (init) REPOSITORIES
  getIt.registerLazySingleton<AttendanceRepository>(() => AttendanceRepositoryImpl(internetInfoService: getIt(), attendanceSource: getIt()));
  getIt.registerLazySingleton<EmployeeRepository>(() => EmployeeRepositoryImpl(employeeSource: getIt(), internetInfoService: getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginRemoteSource: getIt(), internetInfoService: getIt()));
  getIt.registerLazySingleton<EventDetailRepository>(() => EventDetailRepositoryImpl(eventSource: getIt(), internetInfoService: getIt()));

  // Register (init) UseCases
  getIt.registerLazySingleton<ConfirmAttendanceUseCase>(() => ConfirmAttendanceUseCase(attendanceRepository: getIt<AttendanceRepository>()));
  getIt.registerLazySingleton<GetDetailsUseCase>(() => GetDetailsUseCase(employeeRepository: getIt<EmployeeRepository>()));
  getIt.registerLazySingleton<GetTokenUseCase>(() => GetTokenUseCase(loginRepository: getIt<LoginRepository>()));
  getIt.registerLazySingleton<GetEventUseCase>(() => GetEventUseCase(eventDetailRepository: getIt<EventDetailRepository>()));

  // Register (init) OTHERS
  getIt.registerLazySingleton<Dio>(() => getDioClient());
}
