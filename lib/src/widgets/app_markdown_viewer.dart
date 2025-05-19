import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class AppMarkdownViewer extends StatelessWidget {
  const AppMarkdownViewer({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return GptMarkdown(
      content,
      imageBuilder: (context, imageUrl) {
        print("Image URL: $imageUrl");
        return Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
        );
      },
      components: [
        CodeBlockMd(),
        NewLines(),
        BlockQuote(),
        ImageMd(),
        ATagMd(),
        TableMd(),
        HTag(),
        UnOrderedList(),
        OrderedList(),
        RadioButtonMd(),
        CheckBoxMd(),
        HrLine(),
        StrikeMd(),
        BoldMd(),
        ItalicMd(),
        LatexMath(),
        LatexMathMultiLine(),
        HighlightedText(),
        SourceTag(),
        IndentMd(),
      ],
      inlineComponents: [
        ImageMd(),
        ATagMd(),
        TableMd(),
        StrikeMd(),
        BoldMd(),
        ItalicMd(),
        LatexMath(),
        LatexMathMultiLine(),
        HighlightedText(),
        SourceTag(),
      ],
    );
  }
}
