// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/features/auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import 'package:betak/features/category_products/presentation/cubit/category_products_cubit.dart';
import 'package:betak/features/home/data/models/home_department_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import 'widgets/category_products_body.dart';

// ignore: must_be_immutable
class CategoryProductsView extends StatelessWidget {
  HomeDepartmentResponseModel departmentResponseModel;

  CategoryProductsView({
    super.key,
    required this.departmentResponseModel,
  });

  @override
  Widget build(BuildContext context) {
    bool isMerchant = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CategoryProductsCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<MerchantLoginCubit>()..checkAuthStatus(),
        ),
      ],
      child: BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
        builder: (context, state) {
          if (state is MerchantLoggedIn) {
            isMerchant = true;

          }
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: CategoryProductsViewBody(
              departmentResponseModel: departmentResponseModel,
              isMerchant: isMerchant,
            ),
          );
        },
      ),
    );
  }
}
