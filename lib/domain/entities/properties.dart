import 'package:equatable/equatable.dart';

class Properties extends Equatable{
  final String name;
  final String title;
  final String value;

  const Properties({required this.name, required this.title, required this.value});

  @override
  List<Object?> get props => [name,title,value];
}