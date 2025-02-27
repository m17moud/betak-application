import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/styles.dart';
import '../../../auth_for_merchants/sign_in/presentation/cubit/merchant_login_cubit.dart';
import '../../../merchant_%20products/presentation/cubit/merchant_products_cubit.dart';
import '../../../merchant_%20products/presentation/views/merchant_products_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
          if (state is MerchantLoggedOut) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.chooseUserType,
              (route) => false,
            );
          } else if (state is MerchantLoginError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(AppStrings.logoutError.tr()),
            ));
          }
        },
        child: BlocBuilder<MerchantLoginCubit, MerchantLoginState>(
          builder: (context, state) {
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: SpeedDial(
                switchLabelPosition: false,
                backgroundColor: Styles.blueSky,
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme:
                    const IconThemeData(color: ColorManager.white),
                overlayColor: ColorManager.black,
                direction: SpeedDialDirection.right,
                overlayOpacity: 0.4,
                spaceBetweenChildren: 5,
                children: [
                  SpeedDialChild(
                    child: const Icon(
                      Icons.add,
                      color: ColorManager.white,
                    ),
                    label: AppStrings.addProduct.tr(),
                    labelStyle: Styles.styleBoldInriaSans16,
                    backgroundColor: ColorManager.green,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addProductRoute);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  SpeedDialChild(
                    child: const Icon(
                      Icons.exit_to_app,
                      color: ColorManager.white,
                    ),
                    label: AppStrings.logout.tr(),
                    labelStyle: Styles.styleBoldInriaSans16,
                    backgroundColor: ColorManager.error,
                    onTap: () async {
                      await context.read<MerchantLoginCubit>().logoutUser();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ],
              ),
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
        _buildNavItem(
            FontAwesomeIcons.houseChimney, AppStrings.mainPage.tr(), 0),
        _buildNavItem(Icons.category_outlined, AppStrings.myProducts.tr(), 1),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
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
