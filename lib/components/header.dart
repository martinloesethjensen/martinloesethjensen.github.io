import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    final activePath = context.url;

    return header(classes: 'site-header', [
      div(classes: 'header-inner', [
        a(href: '/', classes: 'header-brand', [
          span(classes: 'header-prompt', [.text('>_')]),
          span(classes: 'header-brand-name', [.text(' martin.dev')]),
        ]),
        nav(classes: 'header-nav', [
          for (final route in [
            (label: '~/home', path: '/'),
            (label: '~/projects', path: '/projects'),
          ])
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
      backgroundColor: termTitlebar,
      position: .sticky(top: 0.px),
    ),
    css('.header-inner').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
      maxWidth: 960.px,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 0.875.rem),
      margin: .symmetric(horizontal: Unit.auto),
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
    ),
    css('.header-brand-name').styles(
      color: termText,
      fontSize: 1.rem,
      fontWeight: .w500,
    ),
    css('.header-brand:hover .header-prompt').styles(color: termGreenBright),
    css('.header-brand:hover .header-brand-name').styles(color: termGreenBright),
    css('.header-nav').styles(display: .flex, gap: Gap.all(1.5.rem)),
    css('.nav-link').styles(
      fontSize: 0.875.rem,
      fontWeight: .w400,
      color: termMuted,
      textDecoration: TextDecoration(line: .none),
      padding: .symmetric(vertical: 0.25.rem),
    ),
    css('.nav-link:hover').styles(color: termGreen),
    css('.nav-link--active').styles(color: termGreen, fontWeight: .w500),
  ];
}
