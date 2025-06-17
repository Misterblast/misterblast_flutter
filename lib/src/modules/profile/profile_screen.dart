import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/constants/available_locales.dart';
import 'package:misterblast_flutter/src/modules/profile/widgets/profile_header.dart';
import 'package:misterblast_flutter/src/providers/auth.dart';
import 'package:misterblast_flutter/src/widgets/select_locale_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/home_decor.png",
            ),
            Column(
              spacing: 14,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox.shrink(),
                ProfileHeader(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 8,
                        children: [
                          Card(
                            child: Material(
                              type: MaterialType.transparency,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withAlpha(75),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.settings,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                title: Text(
                                  context.tr("profile.profile"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                subtitle: Text(
                                  context.tr(
                                    "profile.profile-description",
                                  ),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                onTap: () => context.push(
                                  '/profile/update-profile',
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Material(
                              type: MaterialType.transparency,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withAlpha(75),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.language,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                title: Text(
                                  context
                                      .tr("settings.language.update-language"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                subtitle: Text(
                                  context.tr(
                                    context.tr(
                                      "settings.language.${context.locale.toString()}",
                                    ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (context) => SelectLocaleDialog(
                                    locales: AVAILABLE_LOCALES,
                                    currentLocale: context.locale.toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Material(
                              type: MaterialType.transparency,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                leading: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .error
                                        .withAlpha(75),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.exit_to_app,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                                title: Text(
                                  context.tr("profile.logout"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                ),
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (context) =>
                                      LogoutConfirmationAlertDialog(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutConfirmationAlertDialog extends ConsumerWidget {
  const LogoutConfirmationAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(
        context.tr("profile.logout"),
      ),
      content: Text(
        context.tr("profile.logout-confirmation"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            context.tr(
              "common.cancel",
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            ref.read(authNotifierProvider.notifier).logout();
            context.go("/onboarding");
          },
          child: Text(
            context.tr(
              "common.confirm",
            ),
          ),
        ),
      ],
    );
  }
}
