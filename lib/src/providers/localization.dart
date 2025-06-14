import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/constants/shared_preferences.key.dart';
import 'package:misterblast_flutter/src/config/local-storage/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization.g.dart';

@Riverpod(keepAlive: true)
class LocalizationNotifier extends _$LocalizationNotifier {
  @override
  Future<Locale> build() async {
    final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
    final code = sharedPreferences.getString(
      SharedPreferencesKey.userLocal.name,
    );

    return Locale(code ?? 'id');
  }

  void setLocale(Locale locale) {
    state = AsyncData(locale);
    ref.read(sharedPreferencesProvider).value?.setString(
          SharedPreferencesKey.userLocal.name,
          locale.languageCode,
        );
  }
}
