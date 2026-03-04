import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../theme.dart';

class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'projects-page', [
      div(classes: 'projects-inner', [
        div(classes: 'projects-hero', [
          h1(classes: 'projects-title', [.text('GitHub Projects')]),
          p(classes: 'projects-subtitle', [
            .text('Open source work and side projects — coming soon.'),
          ]),
        ]),
        div(classes: 'coming-soon-card', [
          div(classes: 'coming-soon-icon', [.text('🚀')]),
          h2(classes: 'coming-soon-title', [.text('Under Construction')]),
          p(classes: 'coming-soon-text', [
            .text(
              'GitHub projects and open source contributions will be showcased here. '
              'Check back soon!',
            ),
          ]),
          a(
            href: 'https://github.com/martinloesethjensen',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            classes: 'github-btn',
            [.text('View GitHub Profile')],
          ),
        ]),
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
      gap: Gap.all(3.rem),
    ),
    css(
      '.projects-hero',
    ).styles(display: .flex, flexDirection: .column, gap: Gap.all(0.75.rem)),
    css(
      '.projects-title',
    ).styles(color: darkColor, fontSize: 2.rem, fontWeight: .w700),
    css('.projects-subtitle').styles(color: mutedColor, fontSize: 1.125.rem),
    css('.coming-soon-card').styles(
      display: .flex,
      padding: .all(3.rem),
      radius: .circular(12.px),
      flexDirection: .column,
      alignItems: .center,
      gap: Gap.all(1.rem),
      backgroundColor: cardBg,
    ),
    css('.coming-soon-icon').styles(fontSize: 4.rem),
    css(
      '.coming-soon-title',
    ).styles(color: darkColor, fontSize: 1.5.rem, fontWeight: .w700),
    css('.coming-soon-text').styles(
      maxWidth: 480.px,
      color: mutedColor,
      textAlign: .center,
      fontSize: 1.rem,
    ),
    css('.github-btn').styles(
      display: .inlineBlock,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 0.75.rem),
      margin: .only(top: 0.5.rem),
      radius: .circular(6.px),
      color: const Color('#ffffff'),
      fontSize: 0.9375.rem,
      fontWeight: .w500,
      textDecoration: TextDecoration(line: .none),
      backgroundColor: primaryColor,
    ),
    css(
      '.github-btn:hover',
    ).styles(color: const Color('#ffffff'), backgroundColor: primaryDarkColor),
  ];
}
