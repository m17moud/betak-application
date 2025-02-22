// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/features/category_products/presentation/cubit/category_products_cubit.dart';
import 'package:betak/features/home/data/models/home_department_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import 'widgets/category_products_body.dart';

class CategoryProductsView extends StatelessWidget {
  HomeDepartmentResponseModel departmentResponseModel;

  CategoryProductsView({
    super.key,
    required this.departmentResponseModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryProductsCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: CategoryProductsViewBody(departmentResponseModel),
      ),
    );
  }
}
