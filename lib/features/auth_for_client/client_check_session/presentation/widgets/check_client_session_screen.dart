import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/widgets/error_dialog.dart';
import '../../../../../core/widgets/loading_dialog.dart';
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
            if (state is ClientCheckSessionLoading) {
              return const LoadingDialog();
            } else if (state is ClientCheckSessionSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.homeClientRoute,
                  (route) => false,
                );
              });
            } else if (state is ClientCheckSessionNetworkFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ErrorDialog.show(
                  context: context,
                  message: state.message,
                  onPressed: () {
                    exit(0);
                  },
                );
              });
            } else if (state is ClientCheckSessionFailure) {
              context.read<ClientCheckSessionCubit>().clearLocalStorage();

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
