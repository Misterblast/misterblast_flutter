import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/modules/examples/models/question.dart';
import 'package:misterblast_flutter/src/modules/examples/widgets/search_question_tile.dart';
import 'package:misterblast_flutter/src/modules/quiz/widgets/filter_result_sheet.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/app_text_form_field.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class SearchExampleScreen extends StatefulWidget {
  const SearchExampleScreen({super.key});

  @override
  State<SearchExampleScreen> createState() => _SearchExampleScreenState();
}

class _SearchExampleScreenState extends State<SearchExampleScreen> {
  final _focusNode = FocusNode();
  final _searchController = TextEditingController();

  final Map<String, dynamic> _filter = {};

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _focusNode.requestFocus());
    super.initState();
  }

  onFilter((String?, String?)? filter) {
    if (filter != null) {
      setState(() {
        _filter["class"] = filter.$2;
        _filter["subject"] = filter.$1;
      });
    }
  }

  static List<Map<String, dynamic>> json = [
    {
      "id": 27,
      "number": 1,
      "type": "c1_faktual",
      "format": "mm",
      "content":
          "Pasangkan tahapan daur air dengan proses yang terjadi!\n\n| &#xA;\t\t\t\tTahapan&#xA;\t\t\t\tDaur Air&#xA; | &#xA;\t\t\t\tProses&#xA;\t\t\t\tyang Terjadi&#xA;             |\n| -------------------------------------- | ----------------------------------------------------- |\n| &#xA;\t\t\t\t1.&#xA;\t\t\t\tEvaporasi&#xA;     | &#xA;\t\t\t\tA.&#xA;\t\t\t\tAir hujan meresap ke tanah&#xA;   |\n| &#xA;\t\t\t\t2.&#xA;\t\t\t\tKondensasi&#xA;    | &#xA;\t\t\t\tB.&#xA;\t\t\t\tAir berubah menjadi uap air&#xA;  |\n| &#xA;\t\t\t\t3.&#xA;\t\t\t\tPresipitasi&#xA;   | &#xA;\t\t\t\tC.&#xA;\t\t\t\tUap air berubah menjadi awan&#xA; |\n| &#xA;\t\t\t\t4.&#xA;\t\t\t\tInfiltrasi&#xA;    | &#xA;\t\t\t\tD.&#xA;\t\t\t\tAwan berubah menjadi hujan&#xA;   |",
      "is_quiz": false,
      "set_id": 22,
      "set_name": "Kelas 4 - IPA - Set 1",
      "lesson_name": "IPAS",
      "class_name": "4",
      "explanation":
          "Peserta didik dapat menghubungkan tahapan daur air dengan proses yang terjadi.",
      "reason":
          "Evaporasi adalah proses penguapan air menjadi uap. Kondensasi adalah perubahan uap air menjadi awan. Presipitasi adalah turunnya hujan, dan infiltrasi adalah penyerapan air hujan ke dalam tanah.\n"
    },
    {
      "id": 71,
      "number": 1,
      "type": "c1_faktual",
      "format": "mm",
      "content":
          "Pasangkan jenis energi dengan contoh penggunaannya!\n\n| &#xA;\t\t\t\tJenis&#xA;\t\t\t\tEnergi&#xA;\t\t\t      | &#xA;\t\t\t\tContoh&#xA;\t\t\t\tPenggunaan&#xA;\t\t\t                 |\n| ------------------------------------------ | ---------------------------------------------------------- |\n| &#xA;\t\t\t\t1.&#xA;\t\t\t\tEnergi Panas&#xA;\t\t\t   | &#xA;\t\t\t\tA.&#xA;\t\t\t\tKipas angin berputar&#xA;\t\t\t           |\n| &#xA;\t\t\t\t2.&#xA;\t\t\t\tEnergi Listrik&#xA;\t\t\t | &#xA;\t\t\t\tB.&#xA;\t\t\t\tAir mendidih saat dipanaskan&#xA;\t\t\t   |\n| &#xA;\t\t\t\t3.&#xA;\t\t\t\tEnergi Kimia&#xA;\t\t\t   | &#xA;\t\t\t\tC.&#xA;\t\t\t\tManusia bergerak setelah makan&#xA;\t\t\t |\n| &#xA;\t\t\t\t4.&#xA;\t\t\t\tEnergi Gerak&#xA;\t\t\t   | &#xA;\t\t\t\tD.&#xA;\t\t\t\tSepeda melaju saat dikayuh&#xA;\t\t\t     |",
      "is_quiz": false,
      "set_id": 23,
      "set_name": "Kelas 4 - IPA - Set 2",
      "lesson_name": "IPAS",
      "class_name": "4",
      "explanation":
          "Peserta didik dapat menghubungkan jenis energi dengan contoh penggunaannya dalam kehidupan sehari-hari.",
      "reason":
          "Energi panas menyebabkan air mendidih, energi listrik digunakan untuk kipas angin, energi kimia berasal dari makanan yang dikonsumsi manusia, dan energi gerak terlihat saat sepeda dikayuh."
    },
    {
      "id": 77,
      "number": 1,
      "type": "c1_faktual",
      "format": "mm",
      "content":
          "Pasangkan sumber energi dengan contoh pemanfaatannya yang sesuai!\n\n| &#xA;\t\t\t\tSumber&#xA;\t\t\t\tEnergi&#xA; | &#xA;\t\t\t\tPemanfaatan&#xA;                                |\n| ----------------------------------- | -------------------------------------------------------- |\n| &#xA;\t\t\t\t1.&#xA;\t\t\t\tMatahari&#xA;   | &#xA;\t\t\t\tA.&#xA;\t\t\t\tMenggerakkan perahu nelayan&#xA;     |\n| &#xA;\t\t\t\t2.&#xA;\t\t\t\tAngin&#xA;      | &#xA;\t\t\t\tB.&#xA;\t\t\t\tMengeringkan pakaian&#xA;            |\n| &#xA;\t\t\t\t3.&#xA;\t\t\t\tAir&#xA;        | &#xA;\t\t\t\tC.&#xA;\t\t\t\tPembangkit listrik tenaga angin&#xA; |\n| &#xA;\t\t\t\t4.&#xA;\t\t\t\tBensin&#xA;     | &#xA;\t\t\t\tD.&#xA;\t\t\t\tBahan bakar kendaraan&#xA;           |",
      "is_quiz": false,
      "set_id": 24,
      "set_name": "Kelas 4 - IPA - Set 3",
      "lesson_name": "IPAS",
      "class_name": "4",
      "explanation":
          "Peserta didik dapat menghubungkan jenis sumber energi dengan contoh pemanfaatannya dalam kehidupan sehari-hari.",
      "reason":
          "Matahari membantu mengeringkan pakaian, angin digunakan untuk pembangkit listrik tenaga angin, air dapat menggerakkan perahu nelayan, dan bensin digunakan sebagai bahan bakar kendaraan"
    },
    {
      "id": 83,
      "number": 1,
      "type": "c1_faktual",
      "format": "mm",
      "content":
          "Pasangkan jenis gaya dengan contoh penerapannya!\n\n| &#xA;\t\t\t\tJenis&#xA;\t\t\t\tGaya&#xA;\t\t\t        | &#xA;\t\t\t\tContoh&#xA;\t\t\t\tPenerapan&#xA;\t\t\t                |\n| ------------------------------------------ | -------------------------------------------------------- |\n| &#xA;\t\t\t\t1.&#xA;\t\t\t\tGaya Otot&#xA;\t\t\t      | &#xA;\t\t\t\tA.&#xA;\t\t\t\tBatu yang dilempar ke sungai&#xA;\t\t\t |\n| &#xA;\t\t\t\t2.&#xA;\t\t\t\tGaya Gravitasi&#xA;\t\t\t | &#xA;\t\t\t\tB.&#xA;\t\t\t\tBola yang jatuh ke tanah&#xA;\t\t\t     |\n| &#xA;\t\t\t\t3.&#xA;\t\t\t\tGaya Gesek&#xA;\t\t\t     | &#xA;\t\t\t\tC.&#xA;\t\t\t\tMobil berhenti saat direm&#xA;\t\t\t    |\n| &#xA;\t\t\t\t4.&#xA;\t\t\t\tGaya Pegas&#xA;\t\t\t     | &#xA;\t\t\t\tD.&#xA;\t\t\t\tBusur panah yang ditarik&#xA;\t\t\t     |",
      "is_quiz": false,
      "set_id": 25,
      "set_name": "Kelas 5 - IPA - Set 1",
      "lesson_name": "IPAS",
      "class_name": "5",
      "explanation":
          "Peserta didik dapat menghubungkan jenis gaya dengan contoh penerapannya dalam kehidupan sehari-hari.",
      "reason":
          "Gaya otot digunakan saat melempar batu, gaya gravitasi menarik bola jatuh ke tanah, gaya gesek menyebabkan mobil berhenti, dan gaya pegas bekerja pada busur panah saat ditarik"
    },
    {
      "id": 89,
      "number": 1,
      "type": "c1_faktual",
      "format": "mm",
      "content":
          "Pasangkan komponen ekosistem dengan peranannya dalam rantai makanan!\n\n| &#xA;\t\t\t\tKomponen&#xA;\t\t\t\tEkosistem&#xA; | &#xA;\t\t\t\tPerannya&#xA;\t\t\t\tdalam Rantai Makanan&#xA;     |\n| ---------------------------------------- | ------------------------------------------------------- |\n| &#xA;\t\t\t\t1.&#xA;\t\t\t\tTumbuhan&#xA;        | &#xA;\t\t\t\tA.&#xA;\t\t\t\tMenguraikan sisa makhluk hidup&#xA; |\n| &#xA;\t\t\t\t2.&#xA;\t\t\t\tKelinci&#xA;         | &#xA;\t\t\t\tB.&#xA;\t\t\t\tSebagai produsen makanan&#xA;       |\n| &#xA;\t\t\t\t3.&#xA;\t\t\t\tSerigala&#xA;        | &#xA;\t\t\t\tC.&#xA;\t\t\t\tKonsumen tingkat pertama&#xA;       |\n| &#xA;\t\t\t\t4.&#xA;\t\t\t\tJamur&#xA;           | &#xA;\t\t\t\tD.&#xA;\t\t\t\tKonsumen tingkat kedua&#xA;         |",
      "is_quiz": false,
      "set_id": 26,
      "set_name": "Kelas 5 - IPA - Set 2",
      "lesson_name": "IPAS",
      "class_name": "5",
      "explanation":
          "Peserta didik dapat menghubungkan komponen ekosistem dengan perannya dalam rantai makanan.",
      "reason":
          "Peserta didik dapat menghubungkan komponen ekosistem dengan perannya dalam rantai makanan."
    },
    {
      "id": 95,
      "number": 1,
      "type": "c1_faktual",
      "format": "mm",
      "content":
          "Pasangkan jenis perubahan wujud benda dengan contoh peristiwa yang sesuai!\n\n| &#xA;\t\t\t\tJenis&#xA;\t\t\t\tPerubahan Wujud&#xA;\t\t\t | &#xA;\t\t\t\tContoh&#xA;\t\t\t\tPeristiwa&#xA;\t\t\t                                   |\n| ---------------------------------------------- | --------------------------------------------------------------------------- |\n| &#xA;\t\t\t\t1.&#xA;\t\t\t\tMencair&#xA;\t\t\t            | &#xA;\t\t\t\tA.&#xA;\t\t\t\tAir yang dipanaskan berubah menjadi uap&#xA;\t\t\t         |\n| &#xA;\t\t\t\t2.&#xA;\t\t\t\tMembeku&#xA;\t\t\t            | &#xA;\t\t\t\tB.&#xA;\t\t\t\tMentega yang dibiarkan di suhu ruangan&#xA;\t\t\t          |\n| &#xA;\t\t\t\t3.&#xA;\t\t\t\tMenguap&#xA;\t\t\t            | &#xA;\t\t\t\tC.&#xA;\t\t\t\tAir yang dimasukkan ke dalam freezer&#xA;\t\t\t            |\n| &#xA;\t\t\t\t4.&#xA;\t\t\t\tMengembun&#xA;\t\t\t          | &#xA;\t\t\t\tD.&#xA;\t\t\t\tEmbun yang terbentuk di kaca mobil di pagi hari&#xA;\t\t\t |",
      "is_quiz": false,
      "set_id": 27,
      "set_name": "Kelas 5 - IPA - Set 3",
      "lesson_name": "IPAS",
      "class_name": "5",
      "explanation":
          "Peserta didik dapat menghubungkan jenis perubahan wujud dengan contoh peristiwa yang terjadi dalam kehidupan sehari-hari",
      "reason":
          "Mencair terjadi saat benda padat berubah menjadi cair (mentega di suhu ruangan), membeku terjadi saat cairan menjadi padat (air di freezer), menguap terjadi saat cairan berubah menjadi gas (air mendidih menjadi uap), dan mengembun terjadi saat uap air berubah menjadi cairan (embun di kaca mobil)."
    },
    {
      "id": 101,
      "number": 1,
      "type": "c1_faktual",
      "format": "mm",
      "content":
          "Diketahui jumlah pengunjung kebun binatang 5 bulan terakhir ini!\n\n\n\n| &#xA;\t\t\tOktober&#xA;\t\t  | &#xA;\t\t\t13.456&#xA;\t\t |\n| ----------------------- | --------------------- |\n| &#xA;\t\t\tNovember&#xA;\t\t | &#xA;\t\t\t25.786&#xA;\t\t |\n| &#xA;\t\t\tDesember&#xA;\t\t | &#xA;\t\t\t88.976&#xA;\t\t |\n| &#xA;\t\t\tJanuari&#xA;\t\t  | &#xA;\t\t\t40.350&#xA;\t\t |\n| &#xA;\t\t\tFebruari&#xA;\t\t | &#xA;\t\t\t23.755&#xA;\t\t |\n\n\n\nBerdasarkan data tersebut, pasangkanlah banyaknya pengunjung setiap bulan secara terbilang di bawah ini!\n\n\n\n\n\n| &#xA;\t\t\tOktober&#xA;\t\t  | &#xA;\t\t\t&#xA;&#xA;\t\t\t&#xA;\t\t | &#xA;\t\t\tDua&#xA;\t\t\tpuluh tiga ribu tujuh ratus lima puluh lima&#xA;\t\t            |\n| ----------------------- | ---------------------------- | -------------------------------------------------------------------------------- |\n| &#xA;\t\t\tNovember&#xA;\t\t | &#xA;\t\t\t&#xA;&#xA;\t\t\t&#xA;\t\t | &#xA;\t\t\tTiga&#xA;\t\t\tbelas ribu empat ratus lima puluh enam&#xA;\t\t                |\n| &#xA;\t\t\tDesember&#xA;\t\t | &#xA;\t\t\t&#xA;&#xA;\t\t\t&#xA;\t\t | &#xA;\t\t\tEmpat&#xA;\t\t\tpuluh ribu tiga ratus lima puluh&#xA;\t\t                     |\n| &#xA;\t\t\tJanuari&#xA;\t\t  | &#xA;\t\t\t&#xA;&#xA;\t\t\t&#xA;\t\t | &#xA;\t\t\tDua&#xA;\t\t\tpuluh lima ribu tujuh ratus delapan puluh enam&#xA;\t\t         |\n| &#xA;\t\t\tFebruari&#xA;\t\t | &#xA;\t\t\t&#xA;&#xA;\t\t\t&#xA;\t\t | &#xA;\t\t\tDelapan&#xA;\t\t\tpuluh delapan ribu sembilan ratus tujuh puluh enam&#xA;\t\t |",
      "is_quiz": false,
      "set_id": 33,
      "set_name": "Kelas 5 - Matematika - Set 1",
      "lesson_name": "Matematika",
      "class_name": "5",
      "explanation":
          "Menyebutkan bentuk terbilang bilangan cacah dengan konteks jumlah pengunjung ",
      "reason":
          "Pertanyaan tersebut termasuk dalam kategori \"Mengingat\" dalam taksonomi Bloom. Pada tahap ini, siswa diminta untuk menyebutkan informasi atau fakta yang telah dipelajari sebelumnya. Pada konteks pertanyaan tersebut,  siswa diminta untuk menyebutkan kembali bentuk terbilang dari bilangan cacah kurang dari 100.000 berdasarkan data jumlah pengunjung setiap bulan."
    }
  ];

  final List<Question> _questions =
      json.map((e) => Question.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBackButton(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    ChangeLocalButton(),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                focusNode: _focusNode,
                                controller: _searchController,
                                hintText:
                                    context.tr("examples.search-placeholder"),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                textPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium!,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                _focusNode.unfocus();
                                (String?, String?)? filter =
                                    await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => FilterResultSheet(
                                    selectedClass: _filter["class"],
                                    selectedSubject: _filter["subject"],
                                  ),
                                );
                                onFilter(filter);
                              },
                              child: Chip(
                                label: Row(
                                  spacing: 6,
                                  children: [
                                    Icon(
                                      size: 16,
                                      Icons.filter_list,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Filter",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          children: _filter.entries.map((entry) {
                            if (entry.value == null) return const SizedBox();

                            String value = entry.value;
                            if (entry.key == "subject") {
                              value = context.tr("subjects.$value");
                            }
                            return Chip(
                              color: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.secondary,
                              ),
                              label: Text(
                                "${context.tr("common.${entry.key}")} : $value",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              deleteIconColor: Colors.white,
                              onDeleted: () => setState(() {
                                _filter.remove(entry.key);
                              }),
                            );
                          }).toList(),
                        ),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: _questions.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) => SearchQuestionTile(
                              question: _questions[index],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
