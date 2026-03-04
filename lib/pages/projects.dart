import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../theme.dart';

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
    description:
        'A personal AltStore source for distributing and sideloading iOS apps — no jailbreak required.',
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
        div(classes: 'projects-hero', [
          h1(classes: 'projects-title', [.text('GitHub Projects')]),
          p(classes: 'projects-subtitle', [
            .text('Open source work and side projects.'),
          ]),
        ]),
        div(classes: 'projects-grid', [
          for (final project in _projects) _buildCard(project),
        ]),
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

  Component _buildCard(_Project project, String icon) {
    return div(classes: 'project-card', [
      div(classes: 'project-card-header', [
        span(classes: 'project-icon', [.text(icon)]),
        if (project.comingSoon)
          span(classes: 'project-badge', [.text('Coming soon')]),
      ]),
      h2(classes: 'project-name', [.text(project.title)]),
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
          [.text('View on GitHub →')],
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.projects-page').styles(padding: .symmetric(vertical: 4.rem)),
    css('.projects-inner').styles(
      display: .flex,
      maxWidth: 960.px,
      padding: .symmetric(horizontal: 1.5.rem),
      margin: .symmetric(horizontal: Unit.auto),
      flexDirection: .column,
      gap: Gap.all(2.5.rem),
    ),
    css(
      '.projects-hero',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.75.rem)),
    css(
      '.projects-title',
    ).styles(color: darkColor, fontSize: 2.rem, fontWeight: .w700),
    css('.projects-subtitle').styles(color: mutedColor, fontSize: 1.125.rem),

    // Grid
    css(
      '.projects-grid',
    ).styles(display: .flex, flexWrap: .wrap, gap: Gap.all(1.5.rem)),

    // Card
    css('.project-card').styles(
      display: .flex,
      width: 320.px,
      padding: .all(1.5.rem),
      radius: .circular(12.px),
      flexDirection: .column,
      gap: Gap.all(0.75.rem),
      backgroundColor: cardBg,
    ),
    css('.project-card-header').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
    ),
    css('.project-icon').styles(fontSize: 1.5.rem),
    css('.project-badge').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 0.625.rem, vertical: 0.25.rem),
      radius: .circular(20.px),
      color: const Color('#92400e'),
      fontSize: 0.75.rem,
      fontWeight: .w500,
      backgroundColor: const Color('#fef3c7'),
    ),
    css(
      '.project-name',
    ).styles(color: darkColor, fontSize: 1.125.rem, fontWeight: .w600),
    css(
      '.project-description',
    ).styles(flex: Flex(grow: 1), color: mutedColor, fontSize: 0.9375.rem),
    css('.project-card-footer').styles(
      display: .flex,
      padding: .only(top: 0.5.rem),
      justifyContent: .spaceBetween,
      alignItems: .center,
    ),
    css(
      '.project-lang',
    ).styles(display: .flex, alignItems: .center, gap: Gap.all(0.375.rem)),
    css('.lang-dot').styles(
      display: .inlineBlock,
      width: 12.px,
      height: 12.px,
      radius: .circular(6.px),
    ),
    css('.lang-label').styles(color: mutedColor, fontSize: 0.8125.rem),
    css('.project-link').styles(
      color: primaryColor,
      fontSize: 0.875.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.project-link:hover').styles(color: primaryDarkColor),

    // Footer
    css('.projects-footer').styles(display: .flex, justifyContent: .center),
    css('.github-profile-btn').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 0.75.rem),
      radius: .circular(6.px),
      color: const Color('#ffffff'),
      fontSize: 0.9375.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: primaryColor,
    ),
    css(
      '.github-profile-btn:hover',
    ).styles(color: const Color('#ffffff'), backgroundColor: primaryDarkColor),
  ];
}
