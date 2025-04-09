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
import '../cubit/client_check_session_cubit.dart';

class CheckClientSessionScreen extends StatelessWidget {
  const CheckClientSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ClientCheckSessionCubit>()..checkSession(),
      child: Scaffold(
        body: BlocBuilder<ClientCheckSessionCubit, ClientCheckSessionState>(
          builder: (context, state) {
            if (state is ClientCheckSessionLoading || state is ClientPaymentLoading) {
              return const LoadingDialog();
            } else if (state is ClientCheckSessionSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.homeClientRoute,
                  (route) => false,
                );
              });
            } else if (state is ClientCheckSessionNetworkFailure|| state is ClientPaymentNetworkFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ErrorDialog.show(
                  context: context,
                  message: (state as dynamic).message,
                  onPressed: () {
                    exit(0);
                  },
                );
              });
            }
            else if (state is ClientPaymentRequiredFailure ) {
              WidgetsBinding.instance.addPostFrameCallback((_){
                WarningDialog.show(
                  context: context,
                  message: state.message.tr(),
                  onPressed: () {
                    context.read<ClientCheckSessionCubit>().clientPayment();
                  },
                );});
            }
    else if (state is ClientPaymentSuccess) {
              context.read<ClientCheckSessionCubit>().clearLocalStorage();

              launchUrl(Uri.parse(state.paymentURL.payurl!));
              }

            else if (state is ClientCheckSessionFailure || state is ClientPaymentFailure) {
              context.read<ClientCheckSessionCubit>().clearLocalStorage();

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
