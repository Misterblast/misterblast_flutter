import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:misterblast_flutter/src/modules/task/models/task_submission.dart';
import 'package:misterblast_flutter/src/modules/task/repository/task_repository.dart';
import 'package:misterblast_flutter/src/modules/task/widgets/task_submission_tile.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_loading.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/default_error_widget.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class TaskSubmissionList extends ConsumerStatefulWidget {
  const TaskSubmissionList({super.key});

  @override
  ConsumerState<TaskSubmissionList> createState() => _TaskSubmissionListState();
}

class _TaskSubmissionListState extends ConsumerState<TaskSubmissionList> {
  late final PagingController<int, TaskSubmission> _pagingController =
      PagingController(
    getNextPageKey: (state) =>
        state.hasNextPage ? (state.keys?.last ?? 0) + 1 : null,
    fetchPage: _fetchPage,
  );

  Future<List<TaskSubmission>> _fetchPage(int pageKey) async {
    if (!_pagingController.hasNextPage) return [];
    final repo = await ref.read(taskRepositoryProvider.future);
    final response = await repo.fetchSubmissions(
      limit: 10,
      page: pageKey,
    );
    final total = response.total;
    final itemsFetched =
        [...(_pagingController.items ?? []), ...response.data].length;

    if (itemsFetched >= total) {
      _pagingController.value =
          _pagingController.value.copyWith(hasNextPage: false);
    }

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: PagingListener(
                      controller: _pagingController,
                      builder: (context, state, fetchNextPage) =>
                          PagedListView<int, TaskSubmission>(
                        shrinkWrap: true,
                        state: state,
                        fetchNextPage: fetchNextPage,
                        builderDelegate:
                            PagedChildBuilderDelegate<TaskSubmission>(
                          animateTransitions: true,
                          newPageProgressIndicatorBuilder: (context) =>
                              const AppLoading(),
                          noItemsFoundIndicatorBuilder: (context) => Center(
                            child: Text(
                              context.tr("common.no-data-found"),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          firstPageErrorIndicatorBuilder: (context) =>
                              DefaultErrorWidget(),
                          firstPageProgressIndicatorBuilder: (context) =>
                              Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                spacing: 8,
                                children: List.generate(
                                  5,
                                  (index) => ShimmerContainer(
                                    size: const Size(double.maxFinite, 80),
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemBuilder: (context, item, index) =>
                              TaskSubmissionTile(taskSubmission: item),
                        ),
                      ),
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
