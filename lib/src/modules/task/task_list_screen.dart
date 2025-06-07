import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:misterblast_flutter/src/modules/task/models/task.dart';
import 'package:misterblast_flutter/src/modules/task/repository/task_repository.dart';
import 'package:misterblast_flutter/src/modules/task/widgets/task_tile.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_loading.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
                          backgroundColor: theme.colorScheme.secondary,
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
                      child: _TaskList(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskList extends ConsumerStatefulWidget {
  const _TaskList();

  @override
  ConsumerState<_TaskList> createState() => __TaskListState();
}

class __TaskListState extends ConsumerState<_TaskList> {
  Timer? _debounce;
  final _searchController = TextEditingController();
  late final _pagingController = PagingController<int, Task>(
    fetchPage: _onPageRequest,
    getNextPageKey: (state) =>
        state.hasNextPage ? (state.keys?.last ?? 0) + 1 : null,
  );

  Future<List<Task>> _onPageRequest(int pageKey) async {
    if (!_pagingController.hasNextPage) return [];
    final repo = await ref.read(taskRepositoryProvider.future);
    final response = await repo.fetchTasks(
      limit: 10,
      page: pageKey,
      search: _searchController.text,
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

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        if (!mounted) return;
        _pagingController.refresh();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 8,
      children: [
        AppTextFormField(
          controller: _searchController,
          hintText: context.tr("common.search-placeholder"),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          textPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          textStyle: Theme.of(context).textTheme.bodyMedium!,
        ),
        Expanded(
          child: PagingListener(
            controller: _pagingController,
            builder: (context, state, fetchNextPage) =>
                PagedListView<int, Task>(
              shrinkWrap: true,
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<Task>(
                animateTransitions: true,
                newPageProgressIndicatorBuilder: (context) =>
                    const AppLoading(),
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Text(
                    context.tr("common.no-data-found"),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                firstPageErrorIndicatorBuilder: (context) => Center(
                  child: Text(
                    context.tr("common.error-fetching-data"),
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                firstPageProgressIndicatorBuilder: (context) => Expanded(
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
                itemBuilder: (context, item, index) => TaskTile(item: item),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
