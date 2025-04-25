import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/onboarding/widgets/image_logo_container.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class OnboardingTopBar extends StatelessWidget {
  const OnboardingTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageLogoContainer(imagePath: "assets/images/app-logo.png"),
            ImageLogoContainer(imagePath: "assets/images/unesa-logo.png"),
          ],
        ),
        ChangeLocalButton()
      ],
    );
  }
}
