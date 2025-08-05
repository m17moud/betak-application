import 'policy_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_title_text.dart';
import '../../../../../core/widgets/error_dialog.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/loading_error.dart';
import '../../../../../core/widgets/password_text_field.dart';
import '../../../../../core/widgets/phone_text_field.dart';
import '../../../../../core/widgets/success_dialog.dart';
import '../../../../../core/widgets/text_form_validation.dart';
import '../../../../../generated/assets.dart';
import '../../../../home/presentation/cubit/home_cubit.dart';
import '../cubit/merchant_sign_up_cubit.dart';
import 'category_list.dart';

class MerchantSignUpViewBody extends StatefulWidget {
  const MerchantSignUpViewBody({super.key});

  @override
  State<MerchantSignUpViewBody> createState() => _MerchantSignUpViewBodyState();
}

class _MerchantSignUpViewBodyState extends State<MerchantSignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _facebookUrlController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _shopController = TextEditingController();
  String? productsType;
  String? departmentId;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getDepartments();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<MerchantSignUpCubit, MerchantSignUpState>(
      listener: (context, state) {
        if (state is MerchantSignUpLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const LoadingDialog();
            },
          );
        } else if (state is MerchantSignUpSuccess) {
          Navigator.of(context).pop(); // Hide loading dialog
          SuccessDialog.show(
            context: context,
            message: AppStrings.verifyEmailMessage,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.merchantSignInRoute,
                (route) => false,
              );
            },
          );
        } else if (state is MerchantSignUpError) {
          Navigator.of(context).pop(); // Hide loading dialog
          ErrorDialog.show(
            context: context,
            message: state.message,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Center(
                    child: SvgPicture.asset(
                  Assets.imagesLogo1,
                  height: 70,
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.createNewAccount.tr(),
                  style: Styles.styleSemiBoldInter30
                      .copyWith(color: Styles.blueSky),
                ),
                CustomTitleText(text: AppStrings.username.tr()),
                CustomTextField(
                  controller: _nameController,
                  icon: Icons.person,
                  validator: validateUsername,
                  hint: AppStrings.enterYourName.tr(),
                ),
                CustomTitleText(
                  text: AppStrings.email.tr(),
                ),
                CustomTextField(
                  controller: _emailController,
                  icon: Icons.email,
                  validator: validateEmail,
                  hint: AppStrings.enterYourEmail.tr(),
                ),
                CustomTitleText(
                  text: AppStrings.shop.tr(),
                ),
                CustomTextField(
                  controller: _shopController,
                  icon: Icons.store,
                  validator: validateShop,
                  hint: AppStrings.enterYourShop.tr(),
                ),
                CustomTitleText(
                  text: AppStrings.address.tr(),
                ),
                CustomTextField(
                  controller: _addressController,
                  icon: Icons.edit_road_rounded,
                  validator: validateAddress,
                  hint: AppStrings.enterYourAddress.tr(),
                ),
                CustomTitleText(
                  text: AppStrings.phoneNumber.tr(),
                ),
                PhoneTextField(
                  controller: _phoneController,
                  icon: Icons.phone,
                  validator: validatePhoneNumber,
                  screenWidth: screenWidth,
                ),
                CustomTitleText(
                  text: AppStrings.productsType.tr(),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeDepartmentsLoading) {
                      return const CircularProgressIndicator(
                        color: Styles.blueSky,
                      );
                    }
                    if (state is HomeDepartmentsSuccess) {
                      final departments = state.departmentInfo
                          .map((departmentInfo) => Category(
                              id: departmentInfo.id!,
                              name: departmentInfo.name!))
                          .toList();
                      return CategoryList(
                        departments: departments,
                        onChanged: (Category selectedCategory) {
                          productsType = selectedCategory.name;
                          departmentId = selectedCategory.id;
                        },
                      );
                    }
                    if (state is HomeDepartmentsError) {
                      return LoadingError(
                          text: AppStrings.categoriesError,
                          onPressed: () {
                            context.read<HomeCubit>().getDepartments();
                          });
                    }
                    return const SizedBox();
                  },
                ),
                CustomTitleText(
                  text: AppStrings.facebookAccount.tr(),
                ),
                CustomTextField(
                  controller: _facebookUrlController,
                  icon: Icons.facebook,
                  validator: validateFacebookLink,
                  hint: AppStrings.enterYourFacebook.tr(),
                ),
                CustomTitleText(
                  text: AppStrings.password.tr(),
                ),
                PasswordTextField(
                  controller: _passwordController,
                  validator: validatePassword,
                  hintColor: Styles.flyByNight,
                  borderRadius: 12,
                  hint: AppStrings.createYourPassword.tr(),
                  checkVisibility: false,
                  screenWidth: screenWidth,
                ),
               const PolicyText(),
               
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 5),
                  child: CustomButton1(
                    backgroundColor: Styles.blueSky,
                    onPressed: () {
                      if (productsType == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppStrings.mustChooseCategory.tr(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                        return;
                      }
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();
                      final name = _nameController.text.trim();
                      final phone = _phoneController.text.trim();
                      final address = _addressController.text.trim();
                      final facebookUrl = _facebookUrlController.text.trim();
                      final shop = _shopController.text.trim();
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<MerchantSignUpCubit>().signup(
                              name,
                              email,
                              password,
                              phone,
                              address,
                              productsType!,
                              shop,
                              departmentId!,
                              facebookUrl,
                            );
                      }
                    },
                    text: AppStrings.signUp.tr(),
                    textStyle: Styles.styleSemiBoldInter18
                        .copyWith(color: Colors.white),
                    buttonWidth: screenWidth * 0.9,
                    buttonHeight: screenHeight * .08,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alreadyHaveAcount.tr(),
                      style: Styles.styleSemiBoldInter20
                          .copyWith(color: Styles.flyByNight),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.merchantSignInRoute);
                      },
                      child: Text(
                        AppStrings.login.tr(),
                        style: Styles.styleSemiBoldInter20
                            .copyWith(color: Styles.blueSky),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
