import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../injection_container.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_cleint_view_body.dart';

class HomeCleintView extends StatefulWidget {
  const HomeCleintView({super.key});

  @override
  State<HomeCleintView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeCleintView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: const Scaffold(
        backgroundColor: ColorManager.white,
        body: HomeCleintViewBody(),
      ),
    );
  }
}
