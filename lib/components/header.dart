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
        a(href: '/', classes: 'header-brand', [.text('Martin L. Jensen')]),
        nav(classes: 'header-nav', [
          for (final route in [
            (label: 'Home', path: '/'),
            (label: 'Projects', path: '/projects'),
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
      backgroundColor: cardBg,
      position: .sticky(top: 0.px),
    ),
    css('.header-inner').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
      maxWidth: 960.px,
      padding: .symmetric(horizontal: 1.5.rem, vertical: 1.rem),
      margin: .symmetric(horizontal: Unit.auto),
    ),
    css('.header-brand').styles(
      fontSize: 1.125.rem,
      fontWeight: .w700,
      color: darkColor,
      textDecoration: TextDecoration(line: .none),
    ),
    css('.header-brand:hover').styles(color: primaryColor),
    css('.header-nav').styles(display: .flex, gap: Gap.all(1.5.rem)),
    css('.nav-link').styles(
      fontSize: 0.9375.rem,
      fontWeight: .w500,
      color: mutedColor,
      textDecoration: TextDecoration(line: .none),
      padding: .symmetric(vertical: 0.25.rem),
    ),
    css('.nav-link:hover').styles(color: darkColor),
    css('.nav-link--active').styles(color: primaryColor),
  ];
}
