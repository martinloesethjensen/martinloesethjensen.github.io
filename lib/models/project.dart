class ProjectUrl {
  final String url;
  final String label;
  final String emoji;

  const ProjectUrl({
    required this.url,
    required this.label,
    required this.emoji,
  });
}

class GitHubProjectUrl extends ProjectUrl {
  const GitHubProjectUrl({required super.url})
    : super(label: 'view on GitHub', emoji: '🐙');
}

class ProjectLanguage {
  final String name;
  final String color;

  const ProjectLanguage({required this.name, required this.color});
}

class Project {
  final String title;
  final String description;
  final ProjectUrl? url;
  final ProjectUrl? liveUrl;
  final List<ProjectLanguage> languages;
  final String icon;
  final bool comingSoon;
  final List<String> tags;

  const Project({
    required this.title,
    required this.description,
    this.url,
    this.liveUrl,
    this.languages = const [],
    this.icon = '📁',
    this.comingSoon = false,
    this.tags = const [],
  });
}
