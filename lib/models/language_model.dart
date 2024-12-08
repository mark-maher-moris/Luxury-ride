class LanguageModel {
  final String name;
  final String locale;
  final String flag;

  LanguageModel({required this.name, required this.locale, required this.flag});
}

List<LanguageModel> supportedLanguages = [
  LanguageModel(name: 'English', locale: 'EN', flag: 'en_flag.png'),
  LanguageModel(name: 'العربية', locale: 'AR', flag: 'ar_flag.png'),
];
