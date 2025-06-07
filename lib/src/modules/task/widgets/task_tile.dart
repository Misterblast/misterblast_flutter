import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/task/models/task.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.item});

  final Task item;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      type: MaterialType.transparency,
      child: Card(
        child: ListTile(
          leading: Icon(Icons.task_alt, color: theme.colorScheme.primary),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  item.title ?? "",
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              Text(
                parseUnixDatetime(
                      locale: context.locale.countryCode,
                      int.parse(
                        item.lastUpdatedAt ?? "0",
                      ),
                    ) ??
                    "",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          subtitle: Text(item.description ?? ""),
        ),
      ),
    );
  }
}
