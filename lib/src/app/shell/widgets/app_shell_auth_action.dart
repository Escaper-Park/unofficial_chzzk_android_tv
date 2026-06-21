import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/bloc/auth_session_bloc.dart';
import '../../bloc/app_shell_user_cubit.dart';
import '../../router/app_routes.dart';
import 'app_shell_destination.dart';
import 'app_shell_profile_button.dart';
import 'app_shell_tab.dart';

class AppShellAuthAction extends StatelessWidget {
  const AppShellAuthAction({
    super.key,
    required this.selectedRoute,
    required this.onLogoutRequested,
  });

  final AppRoute selectedRoute;
  final VoidCallback onLogoutRequested;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthSessionBloc, AuthSessionState, bool>(
      selector: (state) => state.hasRequiredCookies,
      builder: (context, hasRequiredCookies) {
        if (!hasRequiredCookies) {
          return AppShellTab(
            destination: appShellAuthDestination,
            selectedRoute: selectedRoute,
          );
        }

        return BlocBuilder<AppShellUserCubit, String?>(
          builder: (context, profileImageUrl) {
            return AppShellProfileButton(
              imageUrl: profileImageUrl,
              onPressed: onLogoutRequested,
            );
          },
        );
      },
    );
  }
}
