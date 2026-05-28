import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:martin_portfolio/styles/prompt.css.dart';

import '../theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  static const _headerItems = [
    (label: '~', path: '/'),
    (label: '~/projects', path: '/projects'),
  ];

  @override
  Component build(BuildContext context) {
    final activePath = context.url;

    return header(classes: 'site-header', [
      div(classes: 'header-inner', [
        a(href: '/', classes: 'header-brand prompt-line', [
          span(classes: 'header-prompt', [.text('>_')]),
          span(classes: 'header-brand-name', [.text(' martin.dev')]),
        ]),
        nav(classes: 'header-nav', [
          for (final route in _headerItems)
            a(
              href: route.path,
              classes: activePath == route.path ? 'nav-link nav-link--active' : 'nav-link',
              [.text(route.label)],
            ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.site-header').styles(
      position: .sticky(top: 0.px),
      backgroundColor: termTitlebar,
    ),
    css('.header-inner').styles(
      display: .flex,
      maxWidth: 960.px,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 0.875.rem),
      margin: .symmetric(horizontal: Unit.auto),
      justifyContent: .spaceBetween,
      alignItems: .center,
    ),
    css('.header-brand').styles(
      display: .flex,
      alignItems: .center,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.header-prompt').styles(
      color: termGreen,
      fontSize: 1.125.rem,
      fontWeight: .w700,
      raw: {'transition': 'color 0.15s ease'},
    ),
    css('.header-brand-name').styles(
      color: termText,
      fontSize: 1.rem,
      fontWeight: .w500,
      raw: {'transition': 'color 0.15s ease'},
    ),
    css('.header-brand:hover .header-prompt').styles(color: termGreenBright),
    css(
      '.header-brand:hover .header-brand-name',
    ).styles(color: termGreenBright),
    css('.header-nav').styles(display: .flex, gap: Gap.all(1.5.rem)),
    css('.nav-link').styles(
      padding: .symmetric(vertical: 0.25.rem),
      color: termMuted,
      fontSize: 0.875.rem,
      fontWeight: .w400,
      textDecoration: TextDecoration(line: .none),
      raw: {'transition': 'color 0.15s ease'},
    ),
    css('.nav-link:hover').styles(color: termGreen),
    css('.nav-link--active').styles(color: termGreen, fontWeight: .w500),

    ...PromptCss.styles,
  ];
}
