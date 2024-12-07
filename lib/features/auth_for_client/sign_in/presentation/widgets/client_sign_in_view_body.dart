import 'package:betak/core/widgets/custom_text_field.dart';
import 'package:betak/core/widgets/custom_title_text.dart';
import 'package:betak/features/auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
import 'package:betak/generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/password_text_field.dart';

class ClientSignInViewBody extends StatefulWidget {
  const ClientSignInViewBody({super.key});

  @override
  State<ClientSignInViewBody> createState() => _ClientSignInViewBodyState();
}
//
// class _ClientSignInViewBodyState extends State<ClientSignInViewBody> {
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 45,
//           ),
//           Row(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   onPressed: () {
//                         Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back,
//                     color: Color(0xFF455A64),
//                     size: 22,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Center(child: SvgPicture.asset(Assets.imagesLogo1)),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               CustomTitleText(
//               text:  'مرحبا بك في ',
//                 style: Styles.styleSemiBoldInter30
//                     .copyWith(color: Styles.flyByNight),
//               ),
//               CustomTitleText(
//               text:   'بيتك',
//                 style:
//                     Styles.styleSemiBoldInter30.copyWith(color: Styles.blueSky),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 31),
//             child: Row(
//               children: [
//                 const Expanded(
//                   child: Divider(
//                     thickness: .5,
//                     color: Color(0xFF5D5E61),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 CustomTitleText(
//                 text:   'سجل دخولك عبر البريد الالكتروني',
//                   style: Styles.styleRegularInter16
//                       .copyWith(color: const Color(0xFF5D5E61)),
//                 ),
//                 const SizedBox(
//                   width: 13,
//                 ),
//                 const Expanded(
//                   child: Divider(
//                     thickness: .5,
//                     color: Color(0xFF5D5E61),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: CustomTitleText(
//              text:  'عنوان البريد الالكتروني',
//
//               style: Styles.styleSemiBoldInter20
//                   .copyWith(color: Styles.flyByNight),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Container(
//             height: 65,
//             width: screenWidth * 9,
//             decoration: BoxDecoration(
//               color: const Color(0xFFE0E3E8),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Center(
//               child: CustomTextField(
//                 screenWidth: screenWidth,
//
//
//                   hint: 'قم بادخال بريدك الالكتروني',
//                 ),
//               ),
//             ),
//
//           const SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: CustomTitleText(
//               text: 'كلمة المرور',
//               style: Styles.styleSemiBoldInter20
//                   .copyWith(color: Styles.flyByNight),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           PasswordTextField(
//             borderRadius: 12,
//             hint: 'قم بادخال كلمة المرور',
//             checkVisibility: true,
//             screenWidth: screenWidth,
//           ),
//                const SizedBox(height: 5,),
//
//           Row(mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               InkWell(onTap: () {
//
//               },
//                 child: const Text("هل نسيت كلمة السر؟"),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row( mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomTitleText(
//                 text: "ليس لديك حساب؟ ",
//                 style: Styles.styleSemiBoldInter20
//                     .copyWith(color: Styles.flyByNight),
//               ),
//               InkWell(
//                 onTap: () {
//                       Navigator.pushReplacementNamed(context, Routes.clientSignUpRoute);
//                 },
//                 child: CustomTitleText(
//                  text:  "إنشاء حساب",
//                   style: Styles.styleSemiBoldInter20
//                       .copyWith(color: Styles.blueSky),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: screenHeight > 892 ? 40 : 30,
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 30),
//             child: CustomButton1(
//               backgroundColor: Styles.blueSky,
//               onPressed: () {},
//               text: 'تسجيل دخول',
//               textStyle:
//                   Styles.styleSemiBoldInter18.copyWith(color: Colors.white),
//               buttonWidth: screenWidth * 0.9,
//               buttonHeight: screenHeight * .08,
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class _ClientSignInViewBodyState extends State<ClientSignInViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<CustomerLoginCubit, CustomerLoginState>(
      listener: (context, state) {
        if (state is LoggedIn) {
          // Navigate to the home page or another page
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        } else if (state is LoginError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              // UI code unchanged above this point

              Align(
                alignment: Alignment.topRight,
                child: CustomTitleText(
                  text: 'عنوان البريد الالكتروني',
                  style: Styles.styleSemiBoldInter20.copyWith(color: Styles.flyByNight),
                ),
              ),
              const SizedBox(height: 5),
              CustomTextField(
                screenWidth: screenWidth,
                hint: 'قم بادخال بريدك الالكتروني',
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: CustomTitleText(
                  text: 'كلمة المرور',
                  style: Styles.styleSemiBoldInter20.copyWith(color: Styles.flyByNight),
                ),
              ),
              const SizedBox(height: 5),
              PasswordTextField(
                borderRadius: 12,
                hint: 'قم بادخال كلمة المرور',
                checkVisibility: true,
                screenWidth: screenWidth,
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              if (state is Loading) const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomButton1(
                  backgroundColor: Styles.blueSky,
                  onPressed: () {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    if (email.isNotEmpty && password.isNotEmpty) {
                      context.read<CustomerLoginCubit>().login(email, password);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill in all fields')),
                      );
                    }
                  },
                  text: 'تسجيل دخول',
                  textStyle: Styles.styleSemiBoldInter18.copyWith(color: Colors.white),
                  buttonWidth: screenWidth * 0.9,
                  buttonHeight: screenHeight * .08,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
