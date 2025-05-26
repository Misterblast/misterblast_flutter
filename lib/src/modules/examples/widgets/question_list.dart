import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/modules/examples/provider/question.dart';
import 'package:misterblast_flutter/src/modules/examples/widgets/question_tile.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class QuestionList extends ConsumerWidget {
  const QuestionList({
    super.key,
    required this.setName,
  });

  final String setName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionProvider(setName));
    return questions.when(
      data: (questions) => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: questions.length,
          itemBuilder: (context, index) => QuestionTile(
            question: questions[index],
          ),
        ),
      ),
      loading: () => Expanded(
        child: ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) => ShimmerContainer(
            size: const Size(double.maxFinite, 80),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
          ),
        ),
      ),
      error: (err, stack) => Expanded(
        child: Center(
          child: Text(
            err.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
