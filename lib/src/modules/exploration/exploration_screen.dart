import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class ExplorationScreen extends StatelessWidget {
  const ExplorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Icon(
                      Icons.explore,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: ChangeLocalButton(),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: double.maxFinite,
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height * 0.85,
                        ),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'bottombar.exploration'.tr(),
                              style: TextStyle(
                                fontSize: AppFontSizes.xl,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SearchBar(
                              constraints: const BoxConstraints(
                                maxHeight: 200,
                              ),
                              padding: WidgetStatePropertyAll(
                                const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 12,
                                ),
                              ),
                              textStyle: WidgetStatePropertyAll(
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.grey,
                                    ),
                              ),
                              leading: const Icon(Icons.search,
                                  color: AppColors.grey),
                              side: WidgetStatePropertyAll(
                                BorderSide(
                                  color: AppColors.grey,
                                ),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              elevation: WidgetStateProperty.all(1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
