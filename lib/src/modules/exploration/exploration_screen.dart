import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:misterblast_flutter/src/modules/exploration/data/exploration_repo.dart';
import 'package:misterblast_flutter/src/modules/exploration/models/exploration.dart';
import 'package:misterblast_flutter/src/modules/exploration/widgets/exploration_card.dart';
import 'package:misterblast_flutter/src/widgets/app_loading.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class ExplorationScreen extends StatelessWidget {
  const ExplorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Icon(
                      Icons.explore,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: ChangeLocalButton(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: _ExplorationList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExplorationList extends ConsumerStatefulWidget {
  const _ExplorationList();

  @override
  ConsumerState<_ExplorationList> createState() => __ExplorationListState();
}

class __ExplorationListState extends ConsumerState<_ExplorationList> {
  Timer? _debounce;
  final _searchController = TextEditingController();
  late final _pagingController = PagingController<int, Exploration>(
    fetchPage: _onPageRequest,
    getNextPageKey: (state) =>
        state.hasNextPage ? (state.keys?.last ?? 0) + 1 : null,
  );

  Future<List<Exploration>> _onPageRequest(int pageKey) async {
    if (!_pagingController.hasNextPage) return [];
    final repo = await ref.read(explorationRepositoryProvider.future);
    final response = await repo.fetchExplorations(
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
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _pagingController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'bottombar.exploration'.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: _searchController,
                hintText: context.tr("common.search-placeholder"),
                prefixIcon: Icon(Icons.search, size: 20),
                textPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                textStyle: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
          ],
        ),
        Expanded(
            child: PagingListener(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) =>
              PagedListView<int, Exploration>(
            shrinkWrap: true,
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<Exploration>(
              animateTransitions: true,
              newPageProgressIndicatorBuilder: (context) => const AppLoading(),
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
              itemBuilder: (context, item, index) =>
                  ExplorationCard(exploration: item),
            ),
          ),
        ))
      ],
    );
  }
}
