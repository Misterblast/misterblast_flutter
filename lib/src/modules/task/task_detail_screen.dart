import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/overlays/loading_overlay.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/submit_task_notifier.dart';
import 'package:misterblast_flutter/src/modules/task/notifiers/task_detail_notifier.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_document_field.dart';
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
  FilePickerResult? _filePickerResult;
  final _answerController = TextEditingController();
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  void initState() {
    ref.listenManual(submitTaskNotifierProvider, (_, state) {
      state.whenOrNull(
        error: (error, stackTrace) {
          _loadingOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                context.tr("exceptions.unknown-error"),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          );
        },
        loading: () => _loadingOverlay.show(context),
        data: (data) {
          _loadingOverlay.hide();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(context.tr("task.submit-success")),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/home_decor.png"),
                      Image.asset(
                        "assets/images/celebrate.png",
                        width: 225,
                      ),
                    ],
                  ),
                  Text(
                    context.tr("task.submit-success-desc"),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actionsOverflowButtonSpacing: 8,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    context.pop();
                  },
                  child: Text(context.tr("common.back")),
                ),
              ],
            ),
          );
        },
      );
    });
    super.initState();
  }

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
              onPressed: () => ref
                  .read(submitTaskNotifierProvider.notifier)
                  .submitTask(widget.taskId, _answerController.text, null),
              child: Text(
                context.tr("task.submit-task"),
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
                                              context.tr("task.info"),
                                              style:
                                                  theme.textTheme.headlineSmall,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  context.tr("common.title"),
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
                                                  context.tr("common.desc"),
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
                              AppDocumentField(
                                label: context.tr("common.opt-attachment"),
                                filePickerResult: _filePickerResult,
                                onFileSelected: (file) =>
                                    setState(() => _filePickerResult = file),
                              ),
                              AppTextFormField(
                                maxLines: 4,
                                controller: _answerController,
                                label: context.tr("common.answer"),
                                hintText:
                                    context.tr("common.answer-placeholder"),
                              ),
                            ],
                          ),
                          error: (error, stackTrace) => Center(
                            child: Text(
                              context.tr("exceptions.unknown-error"),
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
