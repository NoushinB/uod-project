import 'package:equatable/equatable.dart';

class Plan extends Equatable {
  final String icon;
  final String title;

  const Plan(this.icon, this.title);

  @override
  List<Object> get props => [icon, title];
}
