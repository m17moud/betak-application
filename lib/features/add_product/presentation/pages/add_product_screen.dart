
import 'dart:io';

import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/custom_text_field.dart';
import 'package:betak/core/widgets/custom_title_text.dart';
import 'package:betak/core/widgets/text_form_validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _picker = ImagePicker();
  XFile? _image;

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
           AppStrings.addNewProduct.tr(),
          style: const TextStyle(color: ColorManager.white),
        )),
        backgroundColor: Styles.flyByNight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundColor: ColorManager.textFormFillColor,
                      child: _image != null
                          ? ClipOval(
                              child: Image.file(
                                File(_image!.path),
                                width: 180,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(
                              Icons.camera_alt,
                              size: 80,
                              color: ColorManager.white,
                            ),
                    ),
                  ),
                ),
                CustomTitleText(text: AppStrings.productName.tr()),
                CustomTextField(
                  controller: _nameController,
                  hint: AppStrings.enterProductName.tr(),
                  validator: validateProductName,
                  icon: Icons.shopping_bag_outlined,
                ),
                CustomTitleText(text:  AppStrings.price.tr()),
                CustomTextField(
                  controller: _priceController,
                  hint:  AppStrings.enterProductPrice.tr(),
                  validator: validateProductPrice,
                  icon: Icons.attach_money,
                ),
                CustomTitleText(text:  AppStrings.description.tr()),
                CustomTextField( 
                  controller: _descriptionController,
                  maxLines: 4,
                  hint:  AppStrings.enterProductDescription.tr(),
                  validator: validateProductDescription,
                  
                ),
                SizedBox(
                    height: screenHeight *
                        0.03), 
                Center(
                  child: CustomButton1(
                    backgroundColor: Styles.blueSky,
                    onPressed: () {
                      final name = _nameController.text;
                      final price = _priceController.text.trim();
                      final description = _descriptionController.text;

                      if (_formKey.currentState?.validate() ?? false) {}
                    },
                    text: AppStrings.confirm.tr(),
                    textStyle: Styles.styleSemiBoldInter22
                        .copyWith(color: Colors.white),
                    buttonWidth: screenWidth * 0.5,
                    buttonHeight: screenHeight * 0.07,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
