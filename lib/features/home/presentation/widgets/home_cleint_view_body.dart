import 'categories.dart';
import 'categories_title.dart';
import 'home_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../cubit/home_cubit.dart';

class HomeCleintViewBody extends StatefulWidget {
  const HomeCleintViewBody({super.key});

  @override
  State<HomeCleintViewBody> createState() => _HomeCleintViewBodyState();
}

class _HomeCleintViewBodyState extends State<HomeCleintViewBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          context.read<HomeCubit>().getDepartments();
        }

        if (state is HomeDepartmentsLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: Styles.blueSky,
              ),
            ),
          );
        }

        if (state is HomeDepartmentsSuccess) {
          List departmentInfo = state.departmentInfo;
          return Column(
            children: [
              HomeLogo(height: height),
              CategoriesTitle(width: width, height: height),
              Expanded(
                child: Categories(
                    width: width,
                    height: height,
                    departmentInfo: departmentInfo),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
