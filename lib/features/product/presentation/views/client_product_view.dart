// ignore_for_file: library_private_types_in_public_api

import 'package:betak/core/utils/routes_manager.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/core/widgets/error_dialog.dart';
import 'package:betak/features/add_like/presentation/cubit/add_like_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../injection_container.dart';
import '../../../auth_for_client/sign_in/data/models/customer_login_response_model.dart';
import '../../../auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
import '../../../category_products/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'widgets/product_view_body.dart';

class ClientProductView extends StatefulWidget {
  final ProductsModel productsModel;
  const ClientProductView({super.key, required this.productsModel});

  @override
  _ClientProductViewState createState() => _ClientProductViewState();
}

class _ClientProductViewState extends State<ClientProductView> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double paddingLeft = width * 0.05;
    double buttonHeight = height * 0.06;
    double iconSize = width * 0.1;
    CustomerLoginResponseModel? clientData;

    return BlocProvider(
      create: (context) => sl<CustomerLoginCubit>(),
      child: BlocBuilder<CustomerLoginCubit, CustomerLoginState>(
        builder: (context, state) {
          context.read<CustomerLoginCubit>().checkAuthStatus();

          if (state is LoggedIn) {
            clientData = state.customerInfo;
          } else if (state is LoggedOut) {
            // Handle logout scenario
            ErrorDialog.show(
              context: context,
              message: AppStrings.errorSignUpAgain,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.chooseUserType,
                  (route) => false,
                );
              },
            );
            return const SizedBox();
          }

          if (clientData == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Styles.blueSky,
              ),
            );
          }

          return BlocProvider(
            create: (context) => sl<AddLikeCubit>()
              ..checkLike(clientData!.CustomerID!, widget.productsModel.id!),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Styles.flyByNight,
                title: Text(
                  widget.productsModel.pname!,
                  style: Styles.styleBoldIrinaSans20
                      .copyWith(color: ColorManager.lightGrey, fontSize: width * 0.05),
                ),
              ),
              backgroundColor: ColorManager.white,
              body: ProductViewBody(
                productsModel: widget.productsModel,
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingLeft, vertical: height * 0.02),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.18,
                      height: buttonHeight,
                      child: Center(
                        child: BlocBuilder<AddLikeCubit, AddLikeState>(
                          builder: (context, state) {
                            if (state is CheckLikeSuccess) {
                              // This checks if the response is Liked from the server
                              isLiked = state.checkLikeResponse[0]
                                      ['response'] ==
                                  'Liked';
                            }
                            return IconButton(
                              icon: Icon(
                                size: iconSize,
                                isLiked
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_outlined,
                                color: isLiked
                                    ? ColorManager.blue
                                    : ColorManager.grey,
                              ),
                              onPressed: () {
                                context.read<AddLikeCubit>().addLike(
                                      clientData!.CustomerID!,
                                      widget.productsModel.id!,
                                    );
                                setState(() {
                                  isLiked = !isLiked;
                                });

                                if (isLiked) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('تم اضافة اعجاب للمنتج',
                                          style: Styles.styleSemiBoldInter18
                                              .copyWith(
                                                  fontSize: width * 0.045,
                                                  color: ColorManager.white)),
                                      duration: const Duration(seconds: 1),
                                      backgroundColor: ColorManager.green,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await launchUrl(Uri.parse(
                            widget.productsModel.seller!.facebookUrl!));
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.7, buttonHeight),
                        backgroundColor: Styles.blueSky,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: const Icon(
                        Icons.facebook,
                        color: ColorManager.white,
                        size: 30,
                      ),
                      label: Center(
                        child: Text(
                          'التواصل عبر الفيسبوك',
                          style: Styles.styleBoldIrinaSans20
                              .copyWith(color: ColorManager.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
