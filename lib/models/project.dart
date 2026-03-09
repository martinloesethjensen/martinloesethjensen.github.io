class Project {
  final String title;
  final String description;
  final String url;
  final String? liveUrl;
  final String language;
  final String languageColor;
  final String icon;
  final bool comingSoon;
  final List<String> tags;

  const Project({
    required this.title,
    required this.description,
    required this.url,
    this.liveUrl,
    required this.language,
    required this.languageColor,
    this.icon = '📁',
    this.comingSoon = false,
    this.tags = const [],
  });
}
