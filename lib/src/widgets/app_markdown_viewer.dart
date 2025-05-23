import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:misterblast_flutter/src/utils/clean_text.dart';

class AppMarkdownViewer extends StatelessWidget {
  const AppMarkdownViewer({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return GptMarkdown(
      cleanText(content),
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
