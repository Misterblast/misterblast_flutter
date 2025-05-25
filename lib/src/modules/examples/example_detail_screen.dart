import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/models/set.dart';
import 'package:misterblast_flutter/src/modules/examples/models/question.dart';
import 'package:misterblast_flutter/src/providers/resources.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_markdown_viewer.dart';
import 'package:misterblast_flutter/src/widgets/shimmer_container.dart';

class ExampleDetailScreen extends ConsumerStatefulWidget {
  const ExampleDetailScreen({
    super.key,
    required this.subject,
    required this.className,
  });

  final String subject;
  final String className;

  @override
  ConsumerState<ExampleDetailScreen> createState() =>
      _ExampleDetailScreenState();
}

class _ExampleDetailScreenState extends ConsumerState<ExampleDetailScreen> {
  String? _selectedSet;

  final List<Map<String, dynamic>> questions = [
    {
      "id": 102,
      "number": 2,
      "type": "c2_konseptual",
      "format": "essay",
      "content":
          "Perhatikan gambar berikut!\n\n![](https://stg.file.go-assessment.link/file?key=prod/img/conso/33/102/1747938586581/1-2-a.png)\n\nBu Dian menjual berbagai macam jenis dakon dengan harga berbeda-beda (dakon a, b, c, dan d) seperti pada gambar tersebut. Berikan centang benar atau salah pada pernyataan di bawah ini!\n\n| &#xA;\t\t\tPernyataan&#xA;                                                         | &#xA;\t\t\tBenar&#xA;    | &#xA;\t\t\tSalah&#xA;    |\n| ------------------------------------------------------------------------------- | --------------------- | --------------------- |\n| &#xA;\t\t\tHarga&#xA;\t\t\tDakon A lebih mahal dari Dakon B&#xA;                      | &#xA;\t\t\t&#xA;\t\t\t&#xA; | &#xA;\t\t\t&#xA;\t\t\t&#xA; |\n| &#xA;\t\t\tHarga&#xA;\t\t\tDakon B lebih murah dari Dakon C&#xA;                      | &#xA;\t\t\t&#xA;\t\t\t&#xA; | &#xA;\t\t\t&#xA;\t\t\t&#xA; |\n| &#xA;\t\t\tHarga&#xA;\t\t\tDakon C lebih murah dari Dakon D&#xA;                      | &#xA;\t\t\t&#xA;\t\t\t&#xA; | &#xA;\t\t\t&#xA;\t\t\t&#xA; |\n| &#xA;\t\t\tHarga&#xA;\t\t\tDakon A memiliki harga yang sama dengan harga Dakon C&#xA; | &#xA;\t\t\t&#xA;\t\t\t&#xA; | &#xA;\t\t\t&#xA;\t\t\t&#xA; |",
      "explanation": "Membandingkan suatu nilai pada bilangan cacah",
      "reason":
          "Pertanyaan tersebut termasuk dalam kategori \"Memahami\" dalam taksonomi Bloom. Pada tahap ini, siswa diminta untuk menginterpretasikan konsep atau informasi yang telah dipresentasikan. Pada konteks pertanyaan tersebut, siswa diminta untuk menjelaskan hubungan bilangan cacah antara harga Dakon A, Dakon B, Dakon C, dan Dakon D",
      "set_id": 33,
      "answers": []
    },
    {
      "id": 31,
      "number": 2,
      "type": "c2_konseptual",
      "format": "t/f",
      "content":
          "Petunjuk : Tandai dengan (B) jika pernyataan benar dan (S) jika salah\n\n1. Gotong royong merupakan penerapan sila ketiga Pancasila.\n2. Pancasila terdiri dari tiga sila utama.\n3. Menghormati orang yang lebih tua mencerminkan sila kedua.\n4. Musyawarah untuk mufakat merupakan bagian dari sila keempat.\n5. Pancasila adalah dasar negara Indonesia.",
      "explanation":
          "Menentukan pernyataan benar atau salah terkait makna Pancasila dan implementasi Pancasila dalam kehidupan",
      "reason":
          "Menentukan pernyataan benar salah dalam kategori \"menentukan\" dalam taksonomi Bloom (C2-Konseptual). Pada tahap ini, siswa diminta untuk menginterpretasikan sebuah pernyataan benar atau salah dalam kaitannya dengan makna Pancasila dan implementasi Pancasila dalam kehidupan sehari-hari",
      "set_id": 40,
      "answers": [
        {
          "id": 33,
          "code": "essay",
          "content":
              "1. (B) Gotong royong merupakan penerapan sila ketiga Pancasila.\n2. (S) Pancasila terdiri dari lima sila utama.\n3. (B) Menghormati orang yang lebih tua mencerminkan sila kedua.\n4. (B) Musyawarah untuk mufakat merupakan bagian dari sila keempat.\n5.(B) Pancasila adalah dasar negara Indonesia.",
          "img_url": null
        }
      ]
    },
    {
      "id": 32,
      "number": 3,
      "type": "c3_prosedural",
      "format": "sa",
      "content":
          "Petunjuk :  Berikanlah jawaban singkat untuk pertanyaan berikut !\n\n(gambar)\nSumber :Kompas.com\n\nPenerapan sila Pancasila dari simbol tersebut adalah...... ",
      "explanation":
          "Menilai kemampuan peserta didik dalam menerapkan nilai-nilai dari simbol Pancasila",
      "reason":
          "Soal ini termasuk dalam kategori C3 karena siswa diminta untuk menjawab pertanyaan berdasarkan fakta atau konsep yang telah mereka pelajari.",
      "set_id": 40,
      "answers": [
        {
          "id": 32,
          "code": "essay",
          "content": "Jawaban : berbuat adil, mementingkan kepentingan umum\n",
          "img_url": null
        }
      ]
    },
    {
      "id": 33,
      "number": 4,
      "type": "c4_metakognitif",
      "format": "mc4",
      "content":
          "(gambar\n)\nSumber : pngtree.com\nCermatilah gambar berikut!\n\nJika kita melihat gambar di samping, kita akan mengenali\nidentitas tersebut berasal dari ….\n\n    a. Jawa Barat\n    b. Sumatera Selatan\n    c. Bali\n    d. Nusa Tenggara Timur",
      "explanation":
          "Mengaitkan identitas masyarakat\nsesuai budaya, suku bangsa, bahasa,",
      "reason":
          "Soal ini masuk ke dalam kategori C4 - Menganalisis, karena siswa tidak hanya mengingat informasi, tetapi juga harus memilah dan memilih dan mengaitkan jawaban yang paling benar berdasarkan pemahaman mereka tentang identitas masyarakat sesuai budaya, suku, agama, dan bahasa",
      "set_id": 40,
      "answers": [
        {
          "id": 34,
          "code": "essay",
          "content": "Jawaban : C. Bali",
          "img_url": null
        }
      ]
    },
    {
      "id": 34,
      "number": 5,
      "type": "c5_metakognitif",
      "format": "mcx",
      "content":
          "Petunjuk : Pilihlah dua jawaban yang benar !\n\n\nContoh sikap yang mencerminkan nilai sila keempat Pancasila adalah... \na.Bermusyawarah dalam mengambil keputusan.\nb. Bertindak semena-mena terhadap teman \nc. Menghormati pendapat orang lain\nd. Mengutamakan kepentingan pribadi",
      "explanation":
          "Mengukur kemampuan peserta didik dalam membedakan antara sikap yang sesuai dan tidak sesuai dengan nilai-nilai Pancasila, khususnya sila keempat",
      "reason":
          "Soal ini masuk dalam kategori C5 - Evaluasi, karena siswa diminta untuk menilai dan membandingkan sikap yang sesuai dengan sila keempat Pancasila. Mereka harus memahami mengapa suatu pilihan benar atau salah.",
      "set_id": 40,
      "answers": [
        {
          "id": 35,
          "code": "essay",
          "content":
              "Sila keempat Pancasila berbunyi:\n\"Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan dalam Permusyawaratan/Perwakilan.\"\n\nSila ini menekankan pentingnya demokrasi, musyawarah, dan mufakat dalam mengambil keputusan yang melibatkan orang banyak.\n\n(a) Bermusyawarah dalam mengambil keputusan → Benar\nMusyawarah adalah proses diskusi bersama untuk mencapai kesepakatan yang adil dan menguntungkan semua pihak. Ini adalah prinsip utama dalam sila keempat.\n(c) Menghormati pendapat orang lain -> Benar\nMenghormati pendapat orang lain mencerminkan sikap demokratis yang menjadi inti dari sila keempat Pancasila. Dalam proses musyawarah, setiap orang berhak menyampaikan pendapatnya.",
          "img_url": null
        }
      ]
    },
    {
      "id": 35,
      "number": 6,
      "type": "c6_metakognitif",
      "format": "essay",
      "content":
          "Susunlah argumen anda akan pentingnya menjaga persatuan dan kesatuan dalam kehidupan sehari-hari!",
      "explanation":
          "Menilai kemampuan peserta didik dalam mengembangkan pemikiran secara logis mengenai konsep Pancasila dalam kehidupan sehari-hari.",
      "reason":
          "Soal ini termasuk dalam kategori C6 - Menciptakan, karena siswa harus menyusun jawaban secara mandiri, menghubungkan konsep persatuan dan kesatuan dengan contoh nyata, serta menghasilkan argumen atau solusi berdasarkan pemahaman mereka.\n",
      "set_id": 40,
      "answers": [
        {
          "id": 36,
          "code": "essay",
          "content":
              "Menjaga persatuan dan kesatuan dalam kehidupan sehari-hari : \n\n    1. Membuat hidup rukun dan harmonis\n    • Tidak ada pertengkaran dan permusuhan\n    • Semua hidup berdampingan dengan damai\n    2. Meningkatkan Kerja Sama\n    • Gotong royong membuat pekerjaan lebih ringan dan cepat selesai.\n    • Di sekolah, kerja sama dalam tugas kelompok membuat hasil lebih baik.\n    3. Menghindari Pertengkaran dan Perpecahan\n    • Tidak mudah terpengaruh oleh provokasi atau perbedaan pendapat.\n    • Semua orang saling menghormati satu sama lain.\n    4. Membuat Bangsa Indonesia Lebih Kuat\n    • Jika rakyat bersatu, negara menjadi lebih aman dan sejahtera.\n    • Tidak mudah dipecah-belah oleh orang yang ingin membuat keributan.",
          "img_url": null
        }
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    final sets = ref.watch(
      exampleSetsProvider(
        className: widget.className,
        lessonName: widget.subject,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        title: Text(
          "${context.tr("subjects.${widget.subject}")} ${context.tr("common.class")} ${widget.className}",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sets.when(
              data: (sets) => ExampleSetsOptions(
                sets: [],
                selectedSet: _selectedSet ?? "1",
              ),
              error: (error, stack) => Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              loading: () => Row(
                spacing: 8,
                children: List.generate(
                  3,
                  (index) => ShimmerContainer(
                    size: const Size(60, 30),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (context, index) => QuestionTile(
                  question: Question.fromJson(questions[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExampleSetsOptions extends ConsumerStatefulWidget {
  ExampleSetsOptions({
    super.key,
    required this.selectedSet,
    required this.sets,
  });

  String selectedSet;
  List<ExampleSet> sets;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExampleSetsOptionsState();
}

class _ExampleSetsOptionsState extends ConsumerState<ExampleSetsOptions> {
  bool isScrollable = false;
  final ScrollController _scrollController = ScrollController();
  String? _selectedSet;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        if (_scrollController.position.maxScrollExtent >
            _scrollController.position.minScrollExtent) {
          setState(() {
            isScrollable = true;
          });
        } else {
          setState(() {
            isScrollable = false;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: ['1', '2', '3']
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        setState(() {
                          _selectedSet = item;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedSet == item
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: Text(
                          "${context.tr("common.question")} Set $item",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: _selectedSet == item
                                        ? Colors.white
                                        : Theme.of(context).colorScheme.primary,
                                  ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        if (isScrollable)
          InkWell(
            onTap: () {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                size: 28,
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(
                  context.tr("question-types.${question.type}"),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              ExpansionTile(
                dense: true,
                initiallyExpanded: true,
                collapsedIconColor: Theme.of(context).colorScheme.primary,
                tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                title: Text(
                  context.tr("common.reason"),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  AppMarkdownViewer(content: question.reason),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr("common.question"),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    AppMarkdownViewer(content: question.content),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr("common.answer"),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: question.answers!
                          .map(
                            (answer) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: AppMarkdownViewer(content: answer.content),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                dense: true,
                initiallyExpanded: true,
                collapsedIconColor: Theme.of(context).colorScheme.primary,
                tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                title: Text(
                  context.tr("common.explanation"),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  AppMarkdownViewer(content: question.explanation),
                ],
              ),
            ],
          ),
        ));
  }
}
