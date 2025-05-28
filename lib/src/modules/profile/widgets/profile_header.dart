import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/providers/user.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.select((value) => value.value));
    final isLoading =
        ref.watch(userProvider.select((value) => value.isLoading));

    return Column(
      spacing: 8,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: isLoading
              ? ShimmerContainer(
                  size: const Size(120, 120),
                  borderRadius: BorderRadius.circular(120),
                )
              : CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  onBackgroundImageError: (exception, stackTrace) =>
                      const Icon(Icons.error),
                  backgroundImage: NetworkImage(user?.imgUrl ?? ''),
                ),
        ),
        Column(
          children: isLoading
              ? [
                  ShimmerContainer(
                    size: const Size(120, 20),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(height: 8),
                  ShimmerContainer(
                    size: const Size(150, 20),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ]
              : [
                  Text(
                    "${user?.name}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    "${user?.email}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
        ),
      ],
    );
  }
}
