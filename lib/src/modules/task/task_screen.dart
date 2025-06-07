import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/task_list_notifier.dart';
import 'package:misterblast_flutter/src/modules/task/widgets/task_tile.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.asset(
                "assets/images/home_decor.png",
              ),
            ),
            Positioned(
              top: 25,
              child: Opacity(
                opacity: 0.4,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.asset(
                    "assets/images/tugas-icon.png",
                    scale: 2,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            Column(
              spacing: 16,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBackButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      ChangeLocalButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          spacing: 16,
                          children: [
                            _TaskList(),
                            _TaskSubmissionList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _TaskSubmissionList extends StatelessWidget {
  const _TaskSubmissionList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12,
              children: [
                Icon(
                  Icons.label_important_sharp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  context.tr("task.task-submissions"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            TextButton(
              onPressed: () => context.push("/task/task-list"),
              child: Text(
                context.tr(
                  "common.show-all",
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _TaskList extends ConsumerWidget {
  const _TaskList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListNotifier = ref.watch(taskListNotifierProvider(limit: 2));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12,
              children: [
                Icon(
                  Icons.label_important_sharp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  context.tr("task.do-task"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            TextButton(
              onPressed: () => context.push("/task/task-list"),
              child: Text(
                context.tr(
                  "common.show-all",
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            )
          ],
        ),
        if (taskListNotifier.isInitialLoading)
          Column(
            spacing: 4,
            children: List.generate(
              2,
              (index) => ShimmerContainer(
                size: const Size(double.maxFinite, 80),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            ),
          )
        else if (taskListNotifier.isError)
          Center(
            child: Text(
              textAlign: TextAlign.center,
              context.tr("exceptions.unknown-error"),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        else if (taskListNotifier.tasks.isEmpty)
          Center(
            child: Text(
              textAlign: TextAlign.center,
              context.tr("task.no-task"),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        else if (taskListNotifier.tasks.isNotEmpty)
          Column(
            children: taskListNotifier.tasks
                .map((task) => TaskTile(item: task))
                .toList(),
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}
