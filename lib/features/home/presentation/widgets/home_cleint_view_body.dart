import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/loading_error.dart';
import '../cubit/home_cubit.dart';
import 'categories.dart';
import 'categories_title.dart';
import 'home_logo.dart';

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

    return Column(
      children: [
        FadeInDown(child: HomeLogo(height: height)),
        FadeInRight(child: CategoriesTitle(width: width, height: height)),
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                context.read<HomeCubit>().getDepartments();
              }

              return state is HomeDepartmentsLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Styles.blueSky,
                      ),
                    )
                  : state is HomeDepartmentsSuccess
                      ? FadeInUp(
                          child: Categories(
                              width: width,
                              height: height,
                              departmentInfo: state.departmentInfo),
                        )
                      : state is HomeDepartmentsError
                          ? Center(
                              child: FadeInLeft(
                                child: LoadingError(
                                    text: AppStrings.categoriesError,
                                    onPressed: () {
                                      context
                                          .read<HomeCubit>()
                                          .getDepartments();
                                    }),
                              ),
                            )
                          : const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
