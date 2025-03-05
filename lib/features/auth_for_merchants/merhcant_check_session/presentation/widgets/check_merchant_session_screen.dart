import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/widgets/error_dialog.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../injection_container.dart';
import '../cubit/merhcant_check_session_cubit.dart';
import '../cubit/merhcant_check_session_state.dart';

class CheckMerchantSessionScreen extends StatelessWidget {
  const CheckMerchantSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MerchantCheckSessionCubit>()..checkSession(),
      child: Scaffold(
        body: BlocBuilder<MerchantCheckSessionCubit, MerchantCheckSessionState>(
          builder: (context, state) {
            if (state is MerchantCheckSessionLoading) {
              // Show loading dialog
              return const LoadingDialog();
            } else if (state is MerchantCheckSessionSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.homeMerchantRoute,
                  (route) => false,
                );
              });
            } 
            else if (state is MerchantCheckSessionNetworkFailure) {
               WidgetsBinding.instance.addPostFrameCallback((_){
              ErrorDialog.show(
                context: context,
                message: state.message,
                onPressed: () {
                  exit(0);
                },
              );});
            }
            
            else if (state is MerchantCheckSessionFailure) {
              context.read<MerchantCheckSessionCubit>().clearLocalStorage();

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.chooseUserType,
                  (route) => true,
                );
                ErrorDialog.show(
                  context: context,
                  message: state.message,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              });
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
