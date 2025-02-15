import 'package:image_picker/image_picker.dart';

class AddProductEntity {
  final String pkey;
  final String did;
  final String name;
  final String price;
  final String sid;
  final String description;
  final List<XFile> image;
  AddProductEntity({
    required this.pkey,
    required this.did,
    required this.name,
    required this.price,
    required this.description,
    required this.sid,
    required this.image,
  });
}
