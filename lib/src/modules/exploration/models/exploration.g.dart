// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exploration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Exploration _$ExplorationFromJson(Map<String, dynamic> json) => _Exploration(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      lang: json['lang'] as String?,
      imgUrl: json['img_url'] as String?,
      siteUrl: json['site_url'] as String?,
    );

Map<String, dynamic> _$ExplorationToJson(_Exploration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'lang': instance.lang,
      'img_url': instance.imgUrl,
      'site_url': instance.siteUrl,
    };
