import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_answer_explanation.dart';
import 'package:misterblast_flutter/src/modules/quiz/models/quiz_explanation.dart';
import 'package:misterblast_flutter/src/modules/quiz/widgets/quiz_answer_explanation_tile.dart';
import 'package:misterblast_flutter/src/utils/parse_unix_datetime.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  static Map<String, dynamic> json = {
    "id": 7,
    "grade": "66",
    "submitted_at": 1741285700,
    "correct": 2,
    "wrong": 1,
    "attempt_no": 1,
    "answers": [
      {
        "number": 1,
        "user_code": "a",
        "actual_code": "a",
        "user_content": "jawaban a",
        "actual_content": "jawaban a",
        "question_content": "soal no 1?",
        "is_correct": true,
        "explanation": "-",
        "reason": "r-15",
        "Format": "mm"
      },
      {
        "number": 2,
        "user_code": "a",
        "actual_code": "b",
        "user_content": "jawaban a",
        "actual_content": "jawaban b",
        "question_content": "soal no 2?",
        "is_correct": false,
        "explanation": "-",
        "reason": "r-17",
        "Format": "mm"
      },
      {
        "number": 3,
        "user_code": "c",
        "actual_code": "c",
        "user_content": "jawaban c",
        "actual_content": "jawaban c",
        "question_content": "soal no 3?",
        "is_correct": true,
        "explanation": "-",
        "reason": "r-16",
        "Format": "mm"
      },
      {
        "number": 2,
        "user_code": "a",
        "actual_code": "b",
        "user_content": "jawaban a",
        "actual_content": "jawaban b",
        "question_content": "soal no 2?",
        "is_correct": false,
        "explanation": "-",
        "reason": "r-17",
        "Format": "mm"
      },
      {
        "number": 3,
        "user_code": "c",
        "actual_code": "c",
        "user_content": "jawaban c",
        "actual_content": "jawaban c",
        "question_content": "soal no 3?",
        "is_correct": true,
        "explanation": "-",
        "reason": "r-16",
        "Format": "mm"
      },
      {
        "number": 2,
        "user_code": "a",
        "actual_code": "b",
        "user_content": "jawaban a",
        "actual_content": "jawaban b",
        "question_content": "soal no 2?",
        "is_correct": false,
        "explanation": "-",
        "reason": "r-17",
        "Format": "mm"
      },
      {
        "number": 3,
        "user_code": "c",
        "actual_code": "c",
        "user_content": "jawaban c",
        "actual_content": "jawaban c",
        "question_content": "soal no 3?",
        "is_correct": true,
        "explanation": "-",
        "reason": "r-16",
        "Format": "mm"
      },
      {
        "number": 2,
        "user_code": "a",
        "actual_code": "b",
        "user_content": "jawaban a",
        "actual_content": "jawaban b",
        "question_content": "soal no 2?",
        "is_correct": false,
        "explanation": "-",
        "reason": "r-17",
        "Format": "mm"
      },
      {
        "number": 3,
        "user_code": "c",
        "actual_code": "c",
        "user_content": "jawaban c",
        "actual_content": "jawaban c",
        "question_content": r'''This is a sample markdown document.

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
```''',
        "is_correct": true,
        "explanation": "-",
        "reason": "r-16",
        "Format": "mm"
      },
    ]
  };

  static QuizExplanation quizExplanation = QuizExplanation.fromJson(json);

  static List<Map<String, dynamic>> subjects = [
    {"icon": "math-icon.png", "title": "mathematics"},
    {"icon": "pancasila-icon.png", "title": "civics"},
    {"icon": "bindo-icon.png", "title": "indonesian"},
    {"icon": "ipas-icon.png", "title": "science"},
  ];

  static List<String> classes = [
    "4",
    "5",
    "6",
  ];

  Widget rowSubmissionDetail(BuildContext context, String label, String value) {
    return Row(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Text(
          ":",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: AutoSizeText(
          maxLines: 1,
          "${context.tr("")} ${context.tr("")}",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: SafeArea(
        child: Column(
          spacing: 24,
          children: [
            Column(
              children: [
                Text(
                  context.tr("quiz-result.score"),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.white),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      quizExplanation.grade,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white, fontSize: 60),
                    ),
                    Text(
                      " / 100",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: 8,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              Icon(
                                size: 24,
                                Icons.label_important_sharp,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Text(
                                context.tr("quiz-result.submission-details"),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              rowSubmissionDetail(
                                context,
                                context.tr("quiz-result.submitted-at"),
                                parseUnixDatetime(
                                  quizExplanation.submittedAt,
                                  locale: context.locale.countryCode,
                                ),
                              ),
                              rowSubmissionDetail(
                                context,
                                context.tr("quiz-result.correct-answer-count"),
                                quizExplanation.correct.toString(),
                              ),
                              rowSubmissionDetail(
                                context,
                                context
                                    .tr("quiz-result.incorrect-answer-count"),
                                quizExplanation.wrong.toString(),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              Icon(
                                size: 24,
                                Icons.label_important_sharp,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Text(
                                context.tr("common.subject"),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          Card(
                            child: ListTile(
                              selected: false,
                              selectedTileColor: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withAlpha(75),
                              contentPadding: const EdgeInsets.all(4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              horizontalTitleGap: 16,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "assets/images/math-icon.png",
                                  width: 75,
                                ),
                              ),
                              title: Text(
                                "${context.tr("subjects.mathematics")} - ${context.tr("common.class")} 6",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              subtitle: Text(
                                "${context.tr("quiz-result.attempt-number")} - ${quizExplanation.attemptNo}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              Icon(
                                size: 24,
                                Icons.label_important_sharp,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Text(
                                context.tr("common.answer-list"),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: quizExplanation.answers.length,
                            separatorBuilder: (_, index) => const SizedBox(
                              height: 8,
                            ),
                            itemBuilder: (_, index) {
                              final QuizAnswerExplanation answer =
                                  quizExplanation.answers[index];
                              return QuestionAnswerExplanationTile(
                                answerExplanation: answer,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
