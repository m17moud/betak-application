

import 'package:betak/core/utils/routes_manager.dart';
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import 'package:betak/features/merchant_%20products/presentation/cubit/merchant_products_cubit.dart';
import 'package:betak/features/merchant_%20products/presentation/views/merchant_products_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../injection_container.dart';
import '../cubit/home_cubit.dart';
import '../widgets/home_merchant_view_body.dart';


class HomeMerchantView extends StatefulWidget {
  const HomeMerchantView({super.key});

  @override
  State<HomeMerchantView> createState() => _HomeMerchantViewState();
}

class _HomeMerchantViewState extends State<HomeMerchantView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeMerchantViewBody(),
    MerchantProductsViewBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()),
        BlocProvider(create: (context) => sl<MerchantLoginCubit>()),
        BlocProvider(create: (context) => sl<MerchantProductsCubit>()),
      ],
      child: BlocListener<MerchantLoginCubit, MerchantLoginState>(
        listener: (context, state) {
          if (state is LoggedOut) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.chooseUserType,
                  (route) => false,
            );
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              content: Text(AppStrings.logoutError.tr()),
            ));
          }
        },
        child: BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, state) {
            return Scaffold(
              floatingActionButton: _buildFloatingActionButton(context),
              floatingActionButtonLocation: _selectedIndex == 1
                  ? FloatingActionButtonLocation.startFloat
                  : FloatingActionButtonLocation.endFloat,
              backgroundColor: ColorManager.white,
              body: IndexedStack(
                index: _selectedIndex,
                children: _screens,
              ),
              bottomNavigationBar: _buildBottomNavigationBar(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Styles.blueSky,
      label: Text(
        _selectedIndex == 0 ? AppStrings.logout.tr() : AppStrings.addProduct.tr(),
        style: const TextStyle(
            color: ColorManager.white, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        _selectedIndex == 0 ? Icons.logout : Icons.add,
        color: ColorManager.white,
      ),
      onPressed: () async {
        if (_selectedIndex == 0) {
          await context.read<MerchantLoginCubit>().logoutUser();
        } else {
          Navigator.pushNamed(context, Routes.addProductRoute);
        }
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: ColorManager.lightGrey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Styles.blueSky,
      selectedFontSize: 16,
      unselectedFontSize: 14,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        _buildNavItem(FontAwesomeIcons.houseChimney, AppStrings.mainPage.tr(), 0),
        _buildNavItem(Icons.category_outlined, AppStrings.myProducts.tr(), 1),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: _selectedIndex == index ? 34 : 26,
        color: _selectedIndex == index ? Styles.blueSky : Styles.flyByNight,
      ),
      label: label,
    );
  }
}
