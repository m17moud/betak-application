import 'package:image_picker/image_picker.dart';

class UpdateProductEntity {
  final String pkey;
  final String tp;
  final String pid;
  final String name;
  final String price;
  final String sid;
  final String description;
  final List<XFile> image;
  UpdateProductEntity({
    required this.pkey,
    required this.tp,
    required this.pid,
    required this.name,
    required this.price,
    required this.description,
    required this.sid,
    required this.image,
  });
}
