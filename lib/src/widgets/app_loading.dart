import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      itemBuilder: (context, index) => DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index.isEven
              ? Theme.of(context).colorScheme.primary
              : AppColors.softYellow,
        ),
      ),
    );
  }
}
