import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_question.dart';
import 'package:misterblast_flutter/src/widgets/app_markdown_viewer.dart';

class QuizDisplay extends StatefulWidget {
  const QuizDisplay({
    super.key,
    this.selectedAnswer,
    required this.question,
    this.onSelect,
  });

  final QuizQuestion question;
  final Function(String?)? onSelect;
  final String? selectedAnswer;

  @override
  State<QuizDisplay> createState() => _QuizDisplayState();
}

class _QuizDisplayState extends State<QuizDisplay> {
  String? _selectedAnswer;
  final ScrollController scrollController = ScrollController();

  void onSelect(String? value) {
    setState(() {
      _selectedAnswer = value;
    });
    if (widget.onSelect != null) {
      widget.onSelect!(value);
    }
  }

  @override
  void initState() {
    _selectedAnswer = widget.selectedAnswer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Expanded(
          child: Scrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: AppMarkdownViewer(content: widget.question.content),
            ),
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.secondary),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.question.answers?.length,
          itemBuilder: (context, index) {
            final answer = widget.question.answers?[index];
            final isSelected = _selectedAnswer == answer?.code;
            return Card(
              elevation: 0,
              color: isSelected
                  ? Theme.of(context).colorScheme.secondary.withAlpha(75)
                  : null,
              shape: isSelected
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : null,
              child: RadioListTile(
                groupValue: _selectedAnswer,
                title: Text(answer!.content),
                activeColor: Theme.of(context).colorScheme.primary,
                subtitle: answer.img_url != null
                    ? Image.network(answer.img_url!)
                    : null,
                selected: _selectedAnswer == answer.code,
                value: answer.code,
                onChanged: (value) {
                  onSelect(value);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
