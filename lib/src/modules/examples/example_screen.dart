import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misterblast_flutter/src/config/logger.dart';
import 'package:misterblast_flutter/src/providers/resources.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';
import 'package:misterblast_flutter/src/widgets/select_class_dialog.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class ExampleScreen extends ConsumerWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => ref.invalidate(lessonsProvider),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Opacity(
                opacity: 0.5,
                child: Image.asset("assets/images/conso-icon.png"),
              ),
              Opacity(
                opacity: 0.5,
                child: Image.asset('assets/images/home_decor.png'),
              ),
              Column(
                spacing: 60,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Positioned(
                            right: -120,
                            bottom: -120,
                            child: Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                "assets/images/conso-icon.png",
                                scale: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              spacing: 24,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(),
                                InkWell(
                                  onTap: () =>
                                      context.push('/examples/search-examples'),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      spacing: 12,
                                      children: [
                                        Icon(Icons.search,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        Text(
                                          context.tr("examples.search-hint"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.grey.shade500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SubjectList(),
                              ],
                            ),
                          ),
                        ],
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

class SubjectList extends ConsumerWidget {
  const SubjectList({super.key});

  static List<Map<String, dynamic>> items = [
    {"icon": "math-icon.png", "title": "mathematics"},
    {"icon": "pancasila-icon.png", "title": "civics"},
    {"icon": "bindo-icon.png", "title": "indonesian"},
    {"icon": "ipas-icon.png", "title": "science"},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(lessonsProvider);
    return Column(
      spacing: 16,
      children: [
        Row(
          spacing: 12,
          children: [
            Icon(
              Icons.label_important_sharp,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              context.tr("common.subject"),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        subjects.when(
          data: (subjects) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: subjects.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = subjects[index];
                final icon = items.firstWhere(
                  (subject) => subject['title'] == item.code,
                )['icon'] as String;
                return InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => SelectClassDialog(
                      subjectName: item.name,
                      subjectCode: item.code ?? '',
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(65),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/$icon",
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.tr(
                                  "subjects.${item.code}",
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              AutoSizeText(
                                context.tr(
                                  "examples.subject-card-description",
                                ),
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (err, _) {
            logger.e("Error loading subjects: $err");
            return Center(
              child: Text(
                context.tr("common.error"),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
          loading: () => Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => ShimmerContainer(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                size: const Size(double.infinity, 75),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
