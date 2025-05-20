import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_answer.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_question.dart';
import 'package:misterblast_flutter/src/modules/quiz/widgets/quiz_display.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/linear_timer.dart';

class OnQuizScreen extends StatefulWidget {
  const OnQuizScreen({
    super.key,
    required this.subject,
    required this.className,
  });

  final String subject;
  final String className;

  @override
  State<OnQuizScreen> createState() => _OnQuizScreenState();
}

class _OnQuizScreenState extends State<OnQuizScreen>
    with TickerProviderStateMixin {
  bool showSubmitButton = false;
  bool showBackButton = false;
  Map<String, dynamic> selectedAnswer = {};
  final PageController _pageController = PageController();
  final GlobalKey<LinearTimerState> _timerKey = GlobalKey();

  final List<QuizQuestion> questions = List.generate(
    10,
    (index) => QuizQuestion(
      id: index,
      content: r'''
This is a sample markdown document.

* **bold**
* *italic*
* **_bold and italic_**
* ~~strikethrough~~
* `code`
* [link](https://www.google.com) ![image](https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png)


```markdown
# Complex Markdown Document for Testing

This document is designed to **challenge** your `gpt_markdown` package by incorporating a wide variety of Markdown components including headers, lists, tables, code blocks, blockquotes, footnotes, and LaTeX math expressions.

---

## Table of Contents
1. [Headers and Emphasis](#headers-and-emphasis)
2. [Lists](#lists)
3. [Code Blocks and Inline Code](#code-blocks-and-inline-code)
4. [Tables](#tables)
5. [Blockquotes and Nested Elements](#blockquotes-and-nested-elements)
6. [Mathematical Expressions](#mathematical-expressions)
7. [Links and Images](#links-and-images)
8. [Footnotes](#footnotes)
9. [Horizontal Rules and Miscellaneous](#horizontal-rules-and-miscellaneous)

---

## Headers and Emphasis

### Header Levels
Markdown supports multiple header levels:
- `# Header 1`
- `## Header 2`
- `### Header 3`
- `#### Header 4`
- `##### Header 5`
- `###### Header 6`

### Emphasis Examples
- *Italicized text* using single asterisks or underscores.
- **Bold text** using double asterisks or underscores.
- ***Bold and italic*** by combining them.
- ~~Strikethrough~~ text using two tildes.

---

## Lists

### Unordered List
- Item 1
  - Nested Item 1.1
  - Nested Item 1.2
    - Deeply Nested Item 1.2.1
- Item 2
  - [ ] Task not completed
  - [x] Task completed

### Ordered List
1. First item
2. Second item with nested list:
   1. Subitem 2.1
   2. Subitem 2.2
3. Third item

### Mixed List Example
- **Fruits**
  1. Apple
  2. Banana
  3. Cherry
- **Vegetables**
  - Carrot
  - Lettuce
  - Spinach

---

## Code Blocks and Inline Code

### Inline Code
Here is an example of inline code: `print("Hello, world!")`.

### Fenced Code Block (Python)
```python
def greet(name):
    """
    Greets a person with the provided name.
    """
    print(f"Hello, {name}!")

greet("Alice")
```

### Fenced Code Block (JavaScript)
```javascript
function greet(name) {
    console.log(`Hello, ${name}!`);
}
greet("Bob");
```

---

## Tables

Here is a table demonstrating various elements:

| Syntax      | Description                              | Example                           |
| ----------- | ---------------------------------------- | --------------------------------- |
| Header      | Title                                    | **Bold Header**                   |
| Paragraph   | Text with *italic* and **bold** elements | This is a sample paragraph.       |
| Inline Code | `code snippet`                           | `let x = 10;`                     |

Additional table with alignment:

| Left Align | Center Align | Right Align |
| :--------- |:------------:| ----------:|
| Row 1      | Row 1        | Row 1      |
| Row 2      | Row 2        | Row 2      |

---

## Blockquotes and Nested Elements

> **Blockquote Header**
> 
> This is a blockquote. You can include **bold** and *italic* text, as well as `inline code` within blockquotes.
> 
> > ### Nested Blockquote
> > - Nested list item 1
> > - Nested list item 2
> >   1. Numbered subitem 1
> >   2. Numbered subitem 2
> > 
> > ```python
> > # Code snippet inside nested blockquote
> > for i in range(3):
> >     print(i)
> > ```
> 
> Back to the outer blockquote.

---

## Mathematical Expressions

### Inline Math
You can write inline math using the `\( ... \)` syntax. For example, the quadratic formula is given by:
\( x = \frac{-b \pm \sqrt{b^2-4ac}}{2a} \).

### Display Math
Display math can be rendered using the `\[ ... \]` syntax. For example, consider the integral:
\[
\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
\]

More complex display equations:
\[
E = mc^2 \quad \text{and} \quad F = ma
\]

---

## Links and Images

### Links
Here are examples of links:
- [OpenAI](https://www.openai.com)
- [GitHub](https://github.com)

### Images
Inline images can be embedded as follows:
![Alt Text for Image](https://via.placeholder.com/150 "Image Title")

![image](https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png)
![image](https://avatars.githubusercontent.com/u/103489488?v=4)

---

## Footnotes

Here is a statement with a footnote.[^1] Another reference can be added here.[^long]

[^1]: This is a simple footnote.
[^long]: This footnote contains a longer explanation to showcase how multiple lines can be formatted in a footnote. It supports Markdown formatting such as **bold** and *italic* text.

---

## Horizontal Rules and Miscellaneous

Horizontal rules can be used to separate sections:

---

### Task List Example
- [x] Write complex Markdown document
- [x] Include LaTeX math expressions
- [ ] Add more Markdown components if needed

### Nested Quotes with Code and Math
> **Example of Nested Components**
> 
> - Inline code: `sum = a + b`
> - Math expression: \( \sum_{i=1}^n i = \frac{n(n+1)}{2} \)
> - More text with **bold** formatting.
> 
> ```javascript
> // JavaScript code example inside a nested blockquote
> const sum = (n) => (n * (n + 1)) / 2;
> console.log(sum(10));
> ```

---

## Conclusion

This document was created to test the robustness of Markdown parsers and to ensure that all components, including advanced LaTeX expressions and nested structures, are rendered correctly. Enjoy testing and feel free to extend it further!
```
''',
      number: index,
      type: "",
      answers: List.generate(
        4,
        (index) => QuizAnswer(
          id: index,
          code: "answer_$index",
          content: "Answer $index",
        ),
      ),
    ),
  );

  @override
  void initState() {
    selectedAnswer = {
      for (var question in questions) question.id.toString(): null
    };
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.addListener(() {
        if (_pageController.page == 0) {
          setState(() {
            showBackButton = false;
          });
        } else {
          setState(() {
            showBackButton = true;
          });
        }

        if (_pageController.page == questions.length - 1) {
          setState(() {
            showSubmitButton = true;
          });
        } else {
          setState(() {
            showSubmitButton = false;
          });
        }
      });
    });
    super.initState();
  }

  onSelect(String code) => setState(() {
        selectedAnswer[questions[_pageController.page!.toInt()].id.toString()] =
            code;
      });

  onTimerOut() => onSubmit();

  onPreviousQuestion() => _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

  onNextQuestion() => _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

  onSubmit() => print(selectedAnswer);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget renderFooterButton() {
    if (showSubmitButton) {
      return Row(
        spacing: 8,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPreviousQuestion,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.chevron_left_rounded),
                  Text(
                    context.tr("common.back"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.tr("common.submit")),
                  Icon(Icons.done_all_rounded),
                ],
              ),
            ),
          ),
        ],
      );
    }

    if (showBackButton) {
      return Row(
        spacing: 8,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPreviousQuestion,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.chevron_left_rounded),
                  Text(context.tr("common.back")),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: onNextQuestion,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.tr("common.next")),
                  Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return ElevatedButton(
      onPressed: onNextQuestion,
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.tr("common.next")),
          Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GptMarkdownTheme(
      gptThemeData: GptMarkdownTheme.of(context).copyWith(
        highlightColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: const AppBackButton(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: AutoSizeText(
            maxLines: 1,
            "${context.tr("subjects.${widget.subject}")} ${context.tr(widget.className)}",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              spacing: 16,
              children: [
                Column(
                  spacing: 4,
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        AutoSizeText(
                          maxLines: 1,
                          "${_pageController.hasClients ? _pageController.page!.toInt() + 1 : 0}/${questions.length}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double progress = 0.0;
                              if (_pageController.hasClients &&
                                  _pageController.page != null) {
                                progress = _pageController.page! /
                                    (questions.length - 1);
                              }
                              return LinearProgressIndicator(
                                minHeight: 16,
                                value: progress.clamp(0.0, 1.0),
                                borderRadius: BorderRadius.circular(20),
                                backgroundColor: Colors.grey.withAlpha(20),
                                color: Theme.of(context).colorScheme.primary,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(
                          Icons.timer,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Expanded(
                          child: LinearTimer(
                            key: _timerKey,
                            duration: 300,
                            onTimerComplete: onTimerOut,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: questions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => QuizDisplay(
                      question: questions[index],
                      selectedAnswer:
                          selectedAnswer[questions[index].id.toString()],
                      onSelect: (String? value) {
                        onSelect(value!);
                      },
                    ),
                  ),
                ),
                PageTransitionSwitcher(
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) =>
                          SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: renderFooterButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
