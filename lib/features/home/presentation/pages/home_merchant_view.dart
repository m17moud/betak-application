import '../../../../core/utils/color_manager.dart';
import '../widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../../../../injection_container.dart';

import '../widgets/home_merchant_view_body.dart';

class HomeMerchantView extends StatefulWidget {
  const HomeMerchantView({super.key});

  @override
  State<HomeMerchantView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeMerchantView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child:  Scaffold(
        backgroundColor: ColorManager.white,
        body: const HomeMerchantViewBody(),
        bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 0, onTap:(p0) {
          
        },),
      ),
    );
  }
}
