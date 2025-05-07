import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: AppColors.grey,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                maxRadius: 60,
                backgroundColor: Theme.of(context).colorScheme.primary,
                onBackgroundImageError: (exception, stackTrace) =>
                    const Icon(Icons.error),
                backgroundImage: NetworkImage(
                  "https://picsum.photos/id/237/200/300",
                ),
              ),
            ),
            const Text(
              "Eka Robyanto",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
