import 'package:equatable/equatable.dart';

abstract class EmployeeDetailEvent extends Equatable {
  const EmployeeDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchEmployeeDetail extends EmployeeDetailEvent {
  final String id;

  const FetchEmployeeDetail({required this.id});

  @override
  List<Object> get props => [id];
}
