// ignore_for_file: use_build_context_synchronously

import 'package:betak/core/utils/routes_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
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
  State<HomeMerchantView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeMerchantView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth > 400 ? 30 : 22;
    double labelFontSize = screenWidth > 400 ? 18 : 16;

    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: BlocProvider(
        create: (context) => sl<MerchantLoginCubit>(),
        child: BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, state) {
            return Scaffold(
              floatingActionButton: _selectedIndex == 0
                  ? FloatingActionButton.extended(
                      backgroundColor: Styles.blueSky,
                      label: const Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                            color: ColorManager.white,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(
                        Icons.logout,
                        color: ColorManager.white,
                      ),
                      onPressed: () async {
                        await context.read<MerchantLoginCubit>().logoutUser();
                        if (state is LoggedOut) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.chooseUserType,
                            (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "خطأ في تسجيل الخروج يرجى المحاولة مرة أخرى")));
                        }
                      },
                    )
                  : FloatingActionButton.extended(
                      backgroundColor: Styles.blueSky,
                      label: const Text(
                        'إضافة منتج',
                        style: TextStyle(
                            color: ColorManager.white,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(
                        Icons.add,
                        color: ColorManager.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.addProductRoute);
                      },
                    ),
              floatingActionButtonLocation: _selectedIndex == 1
                  ? FloatingActionButtonLocation.startFloat
                  : FloatingActionButtonLocation.endFloat,
              backgroundColor: ColorManager.white,
              body: _selectedIndex == 0
                  ? const HomeMerchantViewBody()
                  : const ProductsScreen(),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: ColorManager.lightGrey,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedItemColor: Styles.blueSky,
                selectedFontSize: labelFontSize,
                unselectedFontSize: labelFontSize - 2,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.houseChimney,
                      size: _selectedIndex == 0 ? iconSize + 4 : iconSize,
                      color: _selectedIndex == 0
                          ? Styles.blueSky
                          : Styles.flyByNight,
                    ),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category_outlined,
                      size: _selectedIndex == 1 ? iconSize + 4 : iconSize,
                      color: _selectedIndex == 1
                          ? Styles.blueSky
                          : Styles.flyByNight,
                    ),
                    label: 'منتجاتي',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Products Screen'),
    );
  }
}
