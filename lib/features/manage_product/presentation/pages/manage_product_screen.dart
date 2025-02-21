// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:betak/core/widgets/error_dialog.dart';
import 'package:betak/core/widgets/loading_dialog.dart';
import 'package:betak/core/widgets/success_dialog.dart';
import 'package:betak/features/categorie_products/data/models/products_model.dart';
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
import '../cubit/manage_product_cubit.dart';

class ManageProductScreen extends StatefulWidget {
final  ProductsModel product ;
  const ManageProductScreen({super.key,required this.product});

  @override
  _ManageProductScreen createState() => _ManageProductScreen();
}


class _ManageProductScreen extends State<ManageProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  final ImagePicker _picker = ImagePicker();
  List<XFile> images = [];
  List<String> existingImages = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing product data
    _nameController = TextEditingController(text: widget.product.pname);
    _priceController =
        TextEditingController(text: widget.product.pPrice?.toString() ?? '');
    _descriptionController =
        TextEditingController(text: widget.product.pdescribtion);

    // Load existing images
    if (widget.product.images != null) {
      existingImages = List.from(widget.product.images!);
    }
  }

  Future<void> _pickImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      images.addAll(pickedFiles);
    });
  }

  void _removeImage(int index, {bool isExisting = false}) {
    setState(() {
      if (isExisting) {
        existingImages.removeAt(index);
      } else {
        images.removeAt(index);
      }
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
              widget.product.pname!,
              style: const TextStyle(color: ColorManager.white),
            ),
          ),
          backgroundColor: Styles.flyByNight,
        ),
        body: BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, state) {
            if (state is LoggedIn) {
              var sellerData = state.merchantInfo;

              return BlocProvider(
                create: (context) => sl<ManageProductCubit>(),
                child: BlocBuilder<ManageProductCubit, ManageProductState>(
                  builder: (context, state) {
                    if (state is UpdateProductLoading) {
                      return const LoadingDialog();
                    }
                    if (state is UpdateProductError) {
                      ErrorDialog.show(
                        context: context,
                        message: AppStrings.errorUpdateProduct,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.homeMerchantRoute,
                                (route) => false,
                          );
                        },
                      );
                    }
                    if (state is UpdateProductSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        SuccessDialog.show(
                          context: context,
                          message: AppStrings.successUpdateProduct,
                          onPressed: () {
                            images.clear();
                            existingImages.clear();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.homeMerchantRoute,
                                  (route) => false,
                            );
                          },
                        );
                      });
                    }  if (state is DeleteProductLoading) {
                      return const LoadingDialog();
                    }
                    if (state is DeleteProductError) {
                      ErrorDialog.show(
                        context: context,
                        message: AppStrings.errorDeleteProduct,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.homeMerchantRoute,
                                (route) => false,
                          );
                        },
                      );
                    }
                    if (state is DeleteProductSuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        SuccessDialog.show(
                          context: context,
                          message: AppStrings.successDeleteProduct,
                          onPressed: () {
                            images.clear();
                            existingImages.clear();
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

                                // Display existing images
                                if (existingImages.isNotEmpty)
                                  SizedBox(
                                    height: screenHeight * 0.10,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: existingImages.length,
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: screenWidth * 0.10,
                                              backgroundImage:
                                              NetworkImage(existingImages[index]),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    _removeImage(index, isExisting: true),
                                                child: CircleAvatar(
                                                  radius: screenWidth * 0.04,
                                                  backgroundColor:
                                                  ColorManager.error,
                                                  child: Icon(
                                                    Icons.close,
                                                    size: screenWidth * 0.05,
                                                    color: ColorManager.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),

                                // Display newly added images
                                if (images.isNotEmpty)
                                  SizedBox(
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
                                                onTap: () => _removeImage(index),
                                                child: CircleAvatar(
                                                  radius: screenWidth * 0.04,
                                                  backgroundColor:
                                                  ColorManager.error,
                                                  child: Icon(
                                                    Icons.close,
                                                    size: screenWidth * 0.05,
                                                    color: ColorManager.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),

                                CustomTitleText(text: AppStrings.productName.tr()),
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

                                CustomTitleText(text: AppStrings.description.tr()),
                                CustomTextField(
                                  controller: _descriptionController,
                                  maxLines: 4,
                                  hint: AppStrings.enterProductDescription.tr(),
                                  validator: validateProductDescription,
                                ),

                                SizedBox(height: screenHeight * 0.03),

                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Update Button
                                      CustomButton1(
                                        backgroundColor: Styles.blueSky,
                                        onPressed: () {
                                          if (images.isEmpty && existingImages.isEmpty) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(AppStrings.mustAddImage.tr()),
                                                backgroundColor: ColorManager.error,
                                              ),
                                            );
                                            return;
                                          }

                                          final name = _nameController.text;
                                          final price = _priceController.text.trim();
                                          final description = _descriptionController.text;

                                          if (_formKey.currentState?.validate() ?? false) {
                                            context.read<ManageProductCubit>().updateProduct(
                                              widget.product.id!,
                                              name,
                                              price,
                                              sellerData.SellerID!,
                                              description,
                                              images,
                                            );
                                          }
                                        },
                                        text: AppStrings.updateProduct.tr(),
                                        textStyle: Styles.styleSemiBoldInter22.copyWith(color: ColorManager.white),
                                        buttonWidth: screenWidth * 0.4,
                                        buttonHeight: screenHeight * 0.08,
                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                      CustomButton1(
                                        backgroundColor: ColorManager.error,
                                        onPressed: () {
                                          final parentContext=context;

                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(AppStrings.confirm.tr()),
                                              content: Text(AppStrings.deleteWarning.tr()),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  child: Text(AppStrings.cancel.tr()),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);

                                                    parentContext.read<ManageProductCubit>().deleteProduct(
                                                      widget.product.id!,
                                                      sellerData.SellerID!,
                                                    );
                                                  },
                                                  child: Text(
                                                    AppStrings.deleteProduct.tr(),
                                                    style: TextStyle(color: ColorManager.error,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        text: AppStrings.deleteProduct.tr(),
                                        textStyle: Styles.styleSemiBoldInter22.copyWith(color: ColorManager.white),
                                        buttonWidth: screenWidth * 0.4,
                                        buttonHeight: screenHeight * 0.08,
                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                    ],
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
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
