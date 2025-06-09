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
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
            leading: CircleAvatar(
              maxRadius: 16,
              backgroundColor: theme.colorScheme.primary,
              child: Icon(
                Icons.task_rounded,
                color: Colors.white,
              ),
            ),
            title: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    maxLines: 1,
                    item.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(64),
                  ),
                  child: Text(
                    parseUnixDatetime(int.parse(item.lastUpdatedAt!)) ?? "",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              maxLines: 2,
              item.description ?? "",
            ),
          ),
        ),
      ),
    );
  }
}
