import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/modules/examples/provider/seach_question_notifier.dart';
import 'package:misterblast_flutter/src/modules/examples/widgets/search_question_tile.dart';
import 'package:misterblast_flutter/src/modules/quiz/widgets/filter_result_sheet.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class SearchExampleScreen extends StatefulWidget {
  const SearchExampleScreen({super.key});

  @override
  State<SearchExampleScreen> createState() => _SearchExampleScreenState();
}

class _SearchExampleScreenState extends State<SearchExampleScreen> {
  final _focusNode = FocusNode();
  final _searchController = TextEditingController();

  final Map<String, dynamic> _filter = {};

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _focusNode.requestFocus());
    super.initState();
  }

  onFilter((String?, String?)? filter) {
    if (filter != null) {
      setState(() {
        _filter["class"] = filter.$2;
        _filter["subject"] = filter.$1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBackButton(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    ChangeLocalButton(),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                focusNode: _focusNode,
                                controller: _searchController,
                                hintText:
                                    context.tr("examples.search-placeholder"),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                textPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium!,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                _focusNode.unfocus();
                                (String?, String?)? filter =
                                    await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => FilterResultSheet(
                                    selectedClass: _filter["class"],
                                    selectedSubject: _filter["subject"],
                                  ),
                                );
                                onFilter(filter);
                              },
                              child: Chip(
                                label: Row(
                                  spacing: 6,
                                  children: [
                                    Icon(
                                      size: 16,
                                      Icons.filter_list,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Filter",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          children: _filter.entries.map((entry) {
                            if (entry.value == null) return const SizedBox();

                            String value = entry.value;
                            if (entry.key == "subject") {
                              value = context.tr("subjects.$value");
                            }
                            return Chip(
                              color: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.secondary,
                              ),
                              label: Text(
                                "${context.tr("common.${entry.key}")} : $value",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              deleteIconColor: Colors.white,
                              onDeleted: () => setState(() {
                                _filter.remove(entry.key);
                              }),
                            );
                          }).toList(),
                        ),
                        SearchQuestionList(
                          filter: _filter,
                          searchController: _searchController,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchQuestionList extends ConsumerStatefulWidget {
  const SearchQuestionList({
    super.key,
    required Map<String, dynamic> filter,
    required TextEditingController searchController,
  })  : _filter = filter,
        _searchController = searchController;

  final Map<String, dynamic> _filter;
  final TextEditingController _searchController;

  @override
  ConsumerState<SearchQuestionList> createState() => _SearchQuestionListState();
}

class _SearchQuestionListState extends ConsumerState<SearchQuestionList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final questions = ref.watch(
            searchQuestionNotifierProvider(
              className: widget._filter["class"],
              subjectCode: widget._filter["subject"],
              search: widget._searchController.text,
            ),
          );

          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollController.addListener(() {
              if (_scrollController.position.pixels ==
                  _scrollController.position.maxScrollExtent) {
                ref
                    .read(searchQuestionNotifierProvider(
                      className: widget._filter["class"],
                      subjectCode: widget._filter["subject"],
                      search: widget._searchController.text,
                    ).notifier)
                    .fetchMoreQuestions();
              }
            });
          });

          if (questions.isError) {
            return Center(
              child: Text(
                questions.errorMessage,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.red,
                    ),
              ),
            );
          }
          if (questions.isInitialLoading) {
            return ListView.separated(
              itemCount: 8,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => ShimmerContainer(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                size: const Size(double.infinity, 80),
              ),
            );
          }

          // ignore: no_leading_underscores_for_local_identifiers
          final _questions = questions.questions;
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _questions.length,
                  controller: _scrollController,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) => SearchQuestionTile(
                    question: _questions[index],
                  ),
                ),
              ),
              if (questions.isFetchingMore)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
