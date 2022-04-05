import 'package:equatable/equatable.dart';
import 'package:uod/domain/entities/apply_detail.dart';
import 'package:uod/domain/entities/properties.dart';

class EventDetail extends Equatable {
  final int activityType;
  final List<Properties>? properties;
   final ApplyDetail? applyDetail;

  const EventDetail({required this.activityType, this.properties, this.applyDetail});

  @override
  List<Object?> get props => [activityType, properties, applyDetail];
}



