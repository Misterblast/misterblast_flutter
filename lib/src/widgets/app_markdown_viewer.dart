import 'package:flutter/material.dart';
import 'package:gpt_markdown/custom_widgets/markdown_config.dart';
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
      style: TextStyle(),
      components: [
        CodeBlockMd(),
        NewLines(),
        BlockQuote(),
        ImageMd(),
        ATagMd(),
        CustomTableMd(),
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
        CustomTableMd(),
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

class CustomTableMd extends BlockMd {
  @override
  String get expString =>
      (r"(((\|[^\n\|]+\|)((([^\n\|]+\|)+)?)\ *)(\n\ *(((\|[^\n\|]+\|)(([^\n\|]+\|)+)?))\ *)+)$");
  @override
  Widget build(
    BuildContext context,
    String text,
    final GptMarkdownConfig config,
  ) {
    final lines = text.trim().split('\n');
    final hasAlignment = lines.length >= 2 &&
        lines[1]
            .trim()
            .split('|')
            .where((e) => e.trim().isNotEmpty)
            .every((e) => RegExp(r"^:?-+:?$").hasMatch(e.trim()));

    final List<Map<int, String>> rows = lines
        .map((line) => line
            .trim()
            .split('|')
            .where((cell) => cell.trim().isNotEmpty)
            .toList()
            .asMap())
        .toList();

    final int maxCol =
        rows.fold<int>(0, (max, row) => row.length > max ? row.length : max);

    if (maxCol == 0) {
      return Text("", style: config.style, textAlign: TextAlign.start);
    }

    List<TextAlign> alignments = List.generate(maxCol, (_) => TextAlign.start);

    if (hasAlignment) {
      final alignmentRow = rows[1];
      for (int i = 0; i < maxCol; i++) {
        final raw = alignmentRow[i]?.trim() ?? '';
        if (raw.startsWith(':') && raw.endsWith(':')) {
          alignments[i] = TextAlign.center;
        } else if (raw.startsWith(':')) {
          alignments[i] = TextAlign.start;
        } else if (raw.endsWith(':')) {
          alignments[i] = TextAlign.end;
        } else {
          alignments[i] = TextAlign.start;
        }
      }

      rows.removeAt(1);
    }

    final controller = ScrollController();

    return Scrollbar(
      controller: controller,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        child: Table(
          textDirection: config.textDirection,
          defaultColumnWidth: CustomTableColumnWidth(),
          border: TableBorder.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          children: rows.asMap().entries.map<TableRow>((entry) {
            final rowIndex = entry.key;
            final row = entry.value;
            final isHeader = rowIndex == 0;

            return TableRow(
              decoration: isHeader
                  ? BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    )
                  : null,
              children: List.generate(maxCol, (colIndex) {
                final text = row[colIndex]?.trim() ?? "";

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Align(
                    alignment: switch (alignments[colIndex]) {
                      TextAlign.center => Alignment.center,
                      TextAlign.end => Alignment.centerRight,
                      _ => Alignment.centerLeft,
                    },
                    child: MdWidget(
                      context,
                      text,
                      false,
                      config: config,
                    ),
                  ),
                );
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}
