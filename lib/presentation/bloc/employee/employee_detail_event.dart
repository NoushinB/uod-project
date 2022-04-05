import 'package:equatable/equatable.dart';

abstract class EmployeeDetailEvent extends Equatable {
  const EmployeeDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchEmployeeDetail extends EmployeeDetailEvent {


  const FetchEmployeeDetail();

  @override
  List<Object> get props => [];
}
