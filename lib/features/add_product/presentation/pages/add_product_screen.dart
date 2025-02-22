// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:betak/core/widgets/error_dialog.dart';
import 'package:betak/core/widgets/loading_dialog.dart';
import 'package:betak/core/widgets/success_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_title_text.dart';
import '../../../../core/widgets/text_form_validation.dart';
import '../../../../injection_container.dart';
import '../../../auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import '../cubit/add_product_cubit.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _picker = ImagePicker();
  List<XFile> images = [];
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      images.addAll(pickedFiles);
    });
    }

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => sl<MerchantLoginCubit>()..checkAuthStatus(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            AppStrings.addNewProduct.tr(),
            style: const TextStyle(color: ColorManager.white),
          )),
          backgroundColor: Styles.flyByNight,
        ),
        body: BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, state) {
            if (state is LoggedIn) {
              var sellerData = state.merchantInfo;

              return BlocProvider(
                create: (context) => sl<AddProductCubit>(),
                child: BlocBuilder<AddProductCubit, AddProductState>(
                  builder: (context, state) {
                    if (state is AddProductLoading) {
                      return const LoadingDialog();
                    }
                    if (state is AddProductError) {
                      ErrorDialog.show(
                          context: context,
                          message: AppStrings.errorAddProduct,
                          onPressed: () {
                               Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.homeMerchantRoute,
                              (route) => false,
                            );
                          });
                    }
                    if (state is AddProductSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        SuccessDialog.show(
                          context: context,
                          message: AppStrings.successAddProduct,
                          onPressed: () {
                            images.clear();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.homeMerchantRoute,
                              (route) => false,
                            );
                          },
                        );
                      });
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: _pickImages,
                                    child: CircleAvatar(
                                      radius: screenWidth * 0.2,
                                      backgroundColor:
                                          ColorManager.textFormFillColor,
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 80,
                                        color: ColorManager.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                images.isNotEmpty
                                    ? SizedBox(
                                        height: screenHeight * 0.10,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: images.length,
                                          itemBuilder: (context, index) {
                                            return Stack(
                                              children: [
                                                CircleAvatar(
                                                  radius: screenWidth * 0.10,
                                                  backgroundImage: FileImage(
                                                    File(images[index].path),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: GestureDetector(
                                                    onTap: () =>
                                                        _removeImage(index),
                                                    child: CircleAvatar(
                                                      radius:
                                                          screenWidth * 0.04,
                                                      backgroundColor:
                                                          ColorManager.error,
                                                      child: Icon(
                                                        Icons.close,
                                                        size:
                                                            screenWidth * 0.05,
                                                        color: ColorManager.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    : const SizedBox(),
                                CustomTitleText(
                                    text: AppStrings.productName.tr()),
                                CustomTextField(
                                  controller: _nameController,
                                  hint: AppStrings.enterProductName.tr(),
                                  validator: validateProductName,
                                  icon: Icons.shopping_bag_outlined,

                                ),
                                CustomTitleText(text: AppStrings.price.tr()),
                                CustomTextField(
                                  controller: _priceController,
                                  hint: AppStrings.enterProductPrice.tr(),
                                  validator: validateProductPrice,
                                  icon: Icons.attach_money,
                                ),
                                CustomTitleText(
                                    text: AppStrings.description.tr()),
                                CustomTextField(
                                  controller: _descriptionController,
                                  maxLines: 4,
                                  hint: AppStrings.enterProductDescription.tr(),
                                  validator: validateProductDescription,
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                Center(
                                  child: CustomButton1(
                                    backgroundColor: Styles.blueSky,
                                    onPressed: () {
                                      if (images.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(AppStrings.mustAddImage.tr()),
                                            backgroundColor: ColorManager.error,
                                          ),
                                        );
                                        return;
                                      }

                                      final name = _nameController.text;
                                      final price =
                                          _priceController.text.trim();
                                      final description =
                                          _descriptionController.text;
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        context
                                            .read<AddProductCubit>()
                                            .addProduct(
                                                sellerData.SellerDepartment!,
                                                name,
                                                price,
                                                sellerData.SellerID!,
                                                description,
                                                images);
                                      }
                                    },
                                    text: AppStrings.confirm.tr(),
                                    textStyle: Styles.styleSemiBoldInter22
                                        .copyWith(color: ColorManager.white),
                                    buttonWidth: screenWidth * 0.6,
                                    buttonHeight: screenHeight * 0.08,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              );
            }
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Styles.blueSky,
                ),
              );
            } else {
              return Center(
                child: Text(AppStrings.errorSignUpAgain.tr()),
              );
            }
          },
        ),
      ),
    );
  }
}
