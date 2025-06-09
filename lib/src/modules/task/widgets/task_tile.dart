import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/modules/task/models/task.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.item});

  final Task item;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.push("/task/${item.id}"),
      child: Material(
        type: MaterialType.transparency,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.task_sharp,
                      color: theme.colorScheme.primary,
                    ),
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        item.title ?? "",
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                    Text(
                      parseUnixDatetime(int.parse(item.lastUpdatedAt!)) ?? "",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Text(
                  maxLines: 2,
                  item.description ?? "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
