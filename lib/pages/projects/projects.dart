import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'projects.css.dart';

class _Project {
  final String title;
  final String description;
  final String url;
  final String language;
  final String languageColor;
  final String icon;
  final bool comingSoon;

  const _Project({
    required this.title,
    required this.description,
    required this.url,
    required this.language,
    required this.languageColor,
    this.icon = '📁',
    this.comingSoon = false,
  });
}

const _projects = [
  _Project(
    title: 'GenkiFlow',
    description:
        'An iOS app for Japanese language learning, combining JMDict dictionary data and kanji resources into a streamlined study experience.',
    url: 'https://github.com/martinloesethjensen/genkiflow',
    language: 'Swift',
    languageColor: '#f05138',
    icon: '⛩️',
  ),

  _Project(
    title: 'AltStore Source',
    description: 'A personal AltStore source for distributing and sideloading iOS apps — no jailbreak required.',
    url: 'https://github.com/martinloesethjensen/altstore-source',
    language: 'JSON',
    languageColor: '#292929',
    icon: '🚀',
    comingSoon: true,
  ),
];

class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'projects-page', [
      div(classes: 'projects-inner', [
        // Page header as terminal prompt
        div(classes: 'projects-hero', [
          div(classes: 'proj-term-line', [
            span(classes: 'proj-ps1', [.text('\$')]),
            span(classes: 'proj-cmd', [.text(' ls ~/projects/')]),
          ]),
          p(classes: 'projects-subtitle', [
            span(classes: 'proj-comment', [
              .text('// open source work and side projects'),
            ]),
          ]),
        ]),

        // Project cards grid
        div(classes: 'projects-grid', [
          for (final project in _projects) _buildCard(project),
        ]),

        // Footer
        div(classes: 'projects-footer', [
          a(
            href: 'https://github.com/martinloesethjensen',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            classes: 'github-profile-btn',
            [.text('View all on GitHub →')],
          ),
        ]),
      ]),
    ]);
  }

  Component _buildCard(_Project project) {
    return div(classes: 'project-card', [
      // Card title bar
      div(classes: 'card-titlebar', [
        div(classes: 'card-dots', [
          span(classes: 'card-dot card-dot--red', []),
          span(classes: 'card-dot card-dot--yellow', []),
          span(classes: 'card-dot card-dot--green', []),
        ]),
        span(classes: 'card-wintitle', [.text(project.title.toLowerCase())]),
      ]),
      // Card body
      div(classes: 'card-body', [
        div(classes: 'card-header-row', [
          span(classes: 'project-icon', [.text(project.icon)]),
          if (project.comingSoon) span(classes: 'project-badge', [.text('coming soon')]),
        ]),
        div(classes: 'project-name-line', [
          span(classes: 'proj-chevron', [.text('> ')]),
          h2(classes: 'project-name', [.text(project.title)]),
        ]),
        p(classes: 'project-description', [.text(project.description)]),
        div(classes: 'project-card-footer', [
          div(classes: 'project-lang', [
            span(
              classes: 'lang-dot',
              styles: Styles(backgroundColor: Color(project.languageColor)),
              [],
            ),
            span(classes: 'lang-label', [.text(project.language)]),
          ]),
          a(
            href: project.url,
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            classes: 'project-link',
            [.text('view on GitHub →')],
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => ProjectsCss.styles;
}
