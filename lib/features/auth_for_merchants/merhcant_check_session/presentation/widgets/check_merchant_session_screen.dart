import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/widgets/error_dialog.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/warning_dialog.dart';
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
            if (state is MerchantCheckSessionLoading ||
                state is MerchantPaymentLoading) {
              // Show loading dialog
              return const LoadingDialog();
            } else if (state is MerchantCheckSessionSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.homeMerchantRoute,
                  (route) => false,
                );
              });
            } else if (state is MerchantCheckSessionNetworkFailure ||
                state is MerchantPaymentNetworkFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ErrorDialog.show(
                  context: context,
                  message: (state as dynamic).message,
                  onPressed: () {
                    exit(0);
                  },
                );
              });
            } else if (state is MerchantPaymentRequiredFailure) {
              context.read<MerchantCheckSessionCubit>().clearLocalStorage();

              WidgetsBinding.instance.addPostFrameCallback((_) {
                WarningDialog.show(
                  context: context,
                  message: state.message.tr(),
                  onPressed: () {
                    context.read<MerchantCheckSessionCubit>().merchantPayment();
                  },
                );
              });
            } else if (state is MerchantPaymentSuccess) {
              context.read<MerchantCheckSessionCubit>().clearLocalStorage();

              launchUrl(Uri.parse(state.paymentURL.payurl!));
            } else if (state is MerchantCheckSessionFailure ||
                state is MerchantPaymentFailure) {
              context.read<MerchantCheckSessionCubit>().clearLocalStorage();

              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.chooseUserType,
                  (route) => true,
                );
                ErrorDialog.show(
                  context: context,
                  message: (state as dynamic).message,
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
