import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/task_detail_notifier.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_loading.dart';
import 'package:misterblast_flutter/src/widgets/app_markdown_viewer.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';

class TaskDetailScreen extends ConsumerStatefulWidget {
  const TaskDetailScreen({super.key, required this.taskId});

  final int taskId;
  @override
  ConsumerState<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends ConsumerState<TaskDetailScreen> {
  final _answerController = TextEditingController();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskDetailNotifier = ref.watch(
      taskDetailNotifierProvider(widget.taskId),
    );

    final theme = Theme.of(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        bottomNavigationBar: taskDetailNotifier.whenOrNull(
          data: (data) => Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Kumpulkan Tugas",
              ),
            ),
          ),
        ),
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
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBackButton(
                          backgroundColor: theme.colorScheme.secondary,
                        ),
                        taskDetailNotifier.maybeWhen(
                          orElse: () => const SizedBox.shrink(),
                          data: (data) => InkWell(
                            onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                      width: double.maxFinite,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          spacing: 16,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Informasi Tugas",
                                              style:
                                                  theme.textTheme.headlineSmall,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Judul",
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                                Text(
                                                  data.title ?? "",
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Deskripsi",
                                                  style: theme
                                                      .textTheme.headlineSmall,
                                                ),
                                                Text(
                                                  data.description ?? "",
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                            child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: theme.colorScheme.secondary,
                              ),
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: taskDetailNotifier.when(
                          data: (task) => Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Soal",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: double.maxFinite,
                                      minHeight: 250,
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                    ),
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: theme.colorScheme.primary,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Scrollbar(
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: AppMarkdownViewer(
                                              content: task.content ?? "",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppTextFormField(
                                maxLines: 4,
                                controller: _answerController,
                                label: "Jawaban",
                                hintText: "Tulis jawabanmu di sini...",
                              ),
                            ],
                          ),
                          error: (error, stackTrace) => Center(
                            child: Text(
                              "Error: $error",
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          loading: () => Center(child: AppLoading()),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
