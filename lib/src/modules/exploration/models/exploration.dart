import 'package:freezed_annotation/freezed_annotation.dart';

part 'exploration.g.dart';
part 'exploration.freezed.dart';

@freezed
abstract class Exploration with _$Exploration {
  const factory Exploration({
    required int id,
    String? title,
    String? desc,
    String? lang,
    @JsonKey(name: "img_url") String? imgUrl,
    @JsonKey(name: "site_url") String? siteUrl,
  }) = _Exploration;

  factory Exploration.fromJson(Map<String, dynamic> json) =>
      _$ExplorationFromJson(json);
}

// type Content struct {
// 	ID      int    `json:"id"`
// 	Title   string `json:"title"`
// 	Desc    string `json:"desc"`
// 	ImgURL  string `json:"img_url"`
// 	SiteURL string `json:"site_url"`
// 	Lang    string `json:"lang"`
// }
