import 'package:flutter/material.dart';

class QuizNavigationSheet extends StatelessWidget {
  const QuizNavigationSheet({
    super.key,
    this.onSelect,
    required this.currentIndex,
    required this.selectedAnswer,
  });

  final Map<String, dynamic> selectedAnswer;
  final Function(int index)? onSelect;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final List<String> answers = selectedAnswer.keys.toList();
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(
          answers.length,
          (index) {
            final isCurrentIndex = index == currentIndex;
            return InkWell(
              onTap: () {
                if (onSelect != null) {
                  onSelect!(index);
                }
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCurrentIndex
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary.withAlpha(75),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("${int.parse(answers[index]) + 1}",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: isCurrentIndex ? Colors.white : Colors.black,
                        )),
              ),
            );
          },
        ),
      ),
    );
  }
}
