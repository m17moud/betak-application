import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class HomeDepartmentEntity extends Equatable {
  String id;
  String name;
  String description;
  String image;

  HomeDepartmentEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });
  @override
  List<Object?> get props => [id, name, description, image];
}
