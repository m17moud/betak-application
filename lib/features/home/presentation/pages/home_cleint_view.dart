import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/styles.dart';
import '../../../../injection_container.dart';
import '../../../auth_for_client/sign_in/presentation/cubit/customer_login_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()),
        BlocProvider(create: (context) => sl<CustomerLoginCubit>()),
  
      ],
      child: BlocListener<CustomerLoginCubit, CustomerLoginState>(
        listener: (context, state) {
          if (state is LoggedOut) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.chooseUserType,
              (route) => false,
            );
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(AppStrings.logoutError.tr()),
            ));
          }
        },
        child: BlocBuilder<CustomerLoginCubit, CustomerLoginState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: ColorManager.white,
              body: const HomeCleintViewBody(),
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
                      Icons.exit_to_app,
                      color: ColorManager.white,
                    ),
                    label: AppStrings.logout.tr(),
                    labelStyle: Styles.styleBoldInriaSans16,
                    backgroundColor: ColorManager.error,
                    onTap: () async {
                      await context.read<CustomerLoginCubit>().logoutUser();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
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
